import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

@immutable
final class LoginRequestEvent extends AuthEvent {}

@immutable
final class LogoutRequestEvent extends AuthEvent {}
