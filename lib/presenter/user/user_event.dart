import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

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
