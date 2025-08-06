import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract base class BaseState extends Equatable {
  const BaseState({this.stateType, this.errorMessage});

  final BaseStateType? stateType;
  final String? errorMessage;

  @override
  List<Object?> get props => [stateType, errorMessage];
}

enum BaseStateType { initial, inProgress, failure, success }
