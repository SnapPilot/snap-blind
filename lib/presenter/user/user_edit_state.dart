import 'package:flutter/material.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';

enum Gender {
  male,
  female;

  @override
  String toString() {
    switch (this) {
      case male:
        return StringConst.male;
      case female:
        return StringConst.female;
    }
  }

  factory Gender.fromCode(String code) {
    switch (code) {
      case 'male':
        return Gender.male;
      default:
        return Gender.female;
    }
  }
}

@immutable
final class UserEditState extends BaseState {
  const UserEditState({
    super.stateType = BaseStateType.success,
    super.errorMessage,
    this.selectedGender = Gender.male,
    this.userEntity,
  });

  final UserEntity? userEntity;
  final Gender selectedGender;

  UserEditState copyWith({
    BaseStateType? stateType,
    String? errorMessage,
    UserEntity? userEntity,
    Gender? selectedGender,
  }) {
    return UserEditState(
      stateType: stateType ?? this.stateType,
      errorMessage: errorMessage ?? this.errorMessage,
      userEntity: userEntity ?? this.userEntity,
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }

  @override
  List<Object?> get props => [...super.props, userEntity];
}

final class UserEditSuccessState extends UserEditState {
  const UserEditSuccessState({super.userEntity});

  @override
  List<Object?> get props => [...super.props];
}
