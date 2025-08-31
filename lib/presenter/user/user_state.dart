import 'package:flutter/material.dart';
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
}

@immutable
final class UserEditState extends BaseState {
  const UserEditState({
    super.stateType = BaseStateType.success,
    super.errorMessage,
    this.name,
    this.gender,
    this.age,
    this.intro,
  });

  final String? name;
  final Gender? gender;
  final int? age;
  final String? intro;

  UserEditState copyWith({
    BaseStateType? stateType,
    String? errorMessage,
    String? name,
    Gender? gender,
    int? age,
    String? intro,
  }) {
    return UserEditState(
      stateType: stateType ?? this.stateType,
      errorMessage: errorMessage ?? this.errorMessage,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      intro: intro ?? this.intro,
    );
  }

  @override
  List<Object?> get props => [...super.props, name, gender, age, intro];
}

final class UserEditSuccess extends UserEditState {
  const UserEditSuccess();
}
