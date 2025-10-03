import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/int_extension.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/data/user/dto/user_profile_update_req_dto.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';
import 'package:snap_blind/domain/user/entity/user_profile_entity.dart';
import 'package:snap_blind/domain/user/repository/user_repository.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/user/user_edit_event.dart';
import 'package:snap_blind/presenter/user/user_edit_state.dart';

@injectable
final class UserEditBloc extends BaseBloc<UserEditEvent, UserEditState> {
  UserEditBloc(this._userRepository)
    : super(const UserEditState(stateType: BaseStateType.initial)) {
    on<UserUpdateRequested>(_onSubmit);
    on<UserInitializeRequested>(_onInitializeRequest);
    on<UserInitialized>(_onInitialize);
    on<UserFieldsChanged>(_onFieldsChanged);
    on<UserProfileImageClicked>(_onUserProfileImageClicked);
    on<UserProfileImagePicked>(_onUserProfileImagePicked);

    nameController.addListener(_onControllerChanged);
    ageController.addListener(_onControllerChanged);
    introController.addListener(_onControllerChanged);
  }

  final UserRepository _userRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController introController = TextEditingController();

  Gender _selectedGender = Gender.male;

  Gender get selectedGender => _selectedGender;

  void _onInitializeRequest(
    UserInitializeRequested event,
    Emitter<UserEditState> emit,
  ) {
    emit(const UserEditState(stateType: BaseStateType.initial));
  }

  void _onInitialize(UserInitialized event, Emitter<UserEditState> emit) {
    final UserEntity userEntity = event.entity;

    nameController.text = userEntity.nickName;
    ageController.text = userEntity.age.toString();
    introController.text = userEntity.intro;

    emit(UserEditState(userEntity: userEntity));
  }

  void _onSubmit(UserUpdateRequested event, Emitter<UserEditState> emit) async {
    String uploadImagePath = '';

    if (event.imageFile != null) {
      Result<String> result = await _userRepository.uploadProfileImage(
        event.imageFile!,
      );

      result.when(
        ok: (String imagePath) {
          uploadImagePath = imagePath;
        },
        exception: (e) {
          emit(
            UserEditState(
              profileImage: state.profileImage,
              userEntity: state.userEntity,
              stateType: BaseStateType.failure,
              errorMessage: StringConst.uploadImageErrorMessage,
            ),
          );
        },
      );

      if (result is Error) {
        return;
      }
    }

    Result<UserProfileEntity> result = await _userRepository.updateProfile(
      UserProfileUpdateReqDto(
        uid: event.uid,
        intro: introController.text,
        nickName: nameController.text,
        gender: selectedGender.name,
        birthDate: int.tryParse(ageController.text)?.ageToDateTime(),
        photoUrl: uploadImagePath,
      ),
    );

    result.when(
      ok: (UserProfileEntity userProfileEntity) {
        emit(
          UserEditSuccessState(
            userEntity: state.userEntity!.copyWith(
              nickName: userProfileEntity.nickname,
              profileImage: userProfileEntity.photoUrl,
              gender: userProfileEntity.gender,
              age: userProfileEntity.age,
              intro: userProfileEntity.intro,
            ),
          ),
        );
      },
      exception: (e) {
        emit(
          UserEditState(
            profileImage: state.profileImage,
            userEntity: state.userEntity,
            stateType: BaseStateType.failure,
            errorMessage: StringConst.updateProfileErrorMessage,
          ),
        );
      },
    );
  }

  void changeGenderSelect(Gender? gender) {
    if (gender == null) return;

    _selectedGender = gender;

    add(const UserFieldsChanged());
    return;
  }

  bool get _userInputValidation {
    final int? age = int.tryParse(ageController.text);
    final int nameLength = nameController.text.length;
    final int introLength = introController.text.length;

    if (introLength < 1 || introLength > 100) {
      return false;
    }

    if (age == null || age < 1 || age > 100) {
      return false;
    }

    if (nameLength < 2 || nameLength > 12) {
      return false;
    }

    return true;
  }

  void _onControllerChanged() {
    add(const UserFieldsChanged());
  }

  void _onFieldsChanged(UserFieldsChanged event, Emitter<UserEditState> emit) {
    if (state.userEntity == null) {
      return;
    }

    final UserEntity userEntity = state.userEntity!;

    if (ageController.text == userEntity.age.toString() &&
        nameController.text == userEntity.nickName &&
        introController.text == userEntity.intro &&
        selectedGender == userEntity.gender) {
      emit(
        UserEditState(
          userEntity: state.userEntity,
          profileImage: state.profileImage,
          stateType: BaseStateType.success,
        ),
      );
      return;
    }

    if (_userInputValidation) {
      emit(
        UserEditChangedState(
          userEntity: state.userEntity,
          profileImage: state.profileImage,
        ),
      );
      return;
    }

    emit(UserEditValidationFailedState(userEntity: state.userEntity));
  }

  void _onUserProfileImageClicked(
    UserProfileImageClicked event,
    Emitter<UserEditState> emit,
  ) async {
    /// app TODO: 이미지 다운 샘플링
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? picked = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (picked == null) {
        emit(UserProfileImagePickFailedState(userEntity: state.userEntity));
        return;
      }

      add(UserProfileImagePicked(picked));
    } catch (e, _) {
      emit(UserProfileImagePickFailedState(userEntity: state.userEntity));
    }
  }

  void _onUserProfileImagePicked(
    UserProfileImagePicked event,
    Emitter<UserEditState> emit,
  ) {
    emit(
      UserEditChangedState(
        userEntity: state.userEntity,
        profileImage: event.profileImage,
      ),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    ageController.dispose();
    introController.dispose();
    return super.close();
  }
}
