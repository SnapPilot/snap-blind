import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

@immutable
final class GetTodayMatchOpponentProfileEvent extends HomeEvent {}

// @immutable
// final class LoginRequestEvent extends AuthEvent {
//   const LoginRequestEvent({
//     required this.userEntity,
//     required this.authTokenEntity,
//   });
//
//   final UserEntity userEntity;
//   final AuthTokenEntity authTokenEntity;
// }
//
// @immutable
// final class LogoutRequestEvent extends AuthEvent {}
//
// @immutable
// final class KaKaoLoginRequestEvent extends AuthEvent {}
//
// @immutable
// class AdminLoginRequestEvent extends AuthEvent {
//   const AdminLoginRequestEvent({required this.email, required this.password});
//
//   final String email;
//   final String password;
//
//   @override
//   List<Object?> get props => [email, password];
// }
