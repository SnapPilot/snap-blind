import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/bloc/user/user_event.dart';
import 'package:snap_blind/presenter/bloc/user/user_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';

@injectable
final class UserBloc extends BaseBloc<UserEditEvent, UserEditState> {
  UserBloc() : super(const UserEditState()) {
    on<UserUpdateRequested>(_onSubmit);
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController introController = TextEditingController();

  Future<void> _onSubmit(
    UserUpdateRequested event,
    Emitter<UserEditState> emit,
  ) async {
    if ((state.age != null && (state.age! <= 0 || state.age! > 120))) {
      emit(
        state.copyWith(
          stateType: BaseStateType.failure,
          errorMessage: StringConst.ageInputErrorMessage,
        ),
      );
      return;
    }

    emit(state.copyWith(stateType: BaseStateType.inProgress));

    await Future.delayed(const Duration(seconds: 2));
    // emit(const UserEditSuccess());
    // return;
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
