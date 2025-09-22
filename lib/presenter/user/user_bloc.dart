import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/user/user_event.dart';
import 'package:snap_blind/presenter/user/user_state.dart';

@injectable
final class UserBloc extends BaseBloc<UserEditEvent, UserEditState> {
  UserBloc() : super(const UserEditState(stateType: BaseStateType.initial)) {
    on<UserUpdateRequested>(_onSubmit);
    on<UserInitializeRequested>(_onInitializeRequest);
    on<UserInitialized>(_onInitialize);
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController introController = TextEditingController();

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

    await Future.delayed(const Duration(seconds: 2));

    emit(
      state.copyWith(
        stateType: BaseStateType.failure,
        errorMessage: StringConst.defaultErrorMessage,
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
