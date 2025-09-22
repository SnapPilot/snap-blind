import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';

@immutable
sealed class UserEditEvent extends Equatable {
  const UserEditEvent();

  @override
  List<Object?> get props => [];
}

@immutable
final class UserUpdateRequested extends UserEditEvent {
  const UserUpdateRequested();
}

@immutable
final class UserInitializeRequested extends UserEditEvent {
  const UserInitializeRequested();
}

@immutable
final class UserInitialized extends UserEditEvent {
  const UserInitialized(this.entity);

  final UserEntity entity;

  @override
  List<Object?> get props => [entity];
}
