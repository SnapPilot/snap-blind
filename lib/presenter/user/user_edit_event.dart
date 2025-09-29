import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import 'package:snap_blind/domain/auth/entity/user_entity.dart';

@immutable
sealed class UserEditEvent extends Equatable {
  const UserEditEvent();

  @override
  List<Object?> get props => [];
}

@immutable
final class UserUpdateRequested extends UserEditEvent {
  const UserUpdateRequested({required this.uid});

  final String uid;
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

@immutable
final class UserFieldsChanged extends UserEditEvent {
  const UserFieldsChanged();
}

@immutable
final class UserProfileImageClicked extends UserEditEvent {}

@immutable
final class UserProfileImagePicked extends UserEditEvent {
  const UserProfileImagePicked(this.profileImage);

  final XFile profileImage;
}
