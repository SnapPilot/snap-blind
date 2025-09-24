import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<void> _onSubmit(
    UserUpdateRequested event,
    Emitter<UserEditState> emit,
  ) async {
    emit(state.copyWith(stateType: BaseStateType.inProgress));

    Result<UserProfileEntity> result = await _userRepository.updateProfile(
      UserProfileUpdateReqDto(
        uid: event.uid,
        intro: introController.text,
        nickName: nameController.text,
        gender: selectedGender.name,
        birthDate: int.tryParse(ageController.text)?.ageToDateTime(),
      ),
    );

    if (state.userEntity == null) {
      emit(
        const UserEditState(
          stateType: BaseStateType.failure,
          errorMessage: StringConst.notLoggedInMessage,
        ),
      );
    }

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
      exception: (e) {},
    );
  }

  void changeGenderSelect(Gender? gender) {
    if (gender == null) return;

    _selectedGender = gender;
  }

  @override
  Future<void> close() {
    nameController.dispose();
    ageController.dispose();
    introController.dispose();
    return super.close();
  }
}
