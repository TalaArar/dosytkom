// features/auth/presentation/cubit/login_state.dart

import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';

abstract class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final AuthEntity authEntity;

  LoginStateSuccess({required this.authEntity});
  
}

class LoginStateError extends LoginState {
  final String errorMessage;

  LoginStateError({required this.errorMessage});
}

class LogoutState extends LoginState {}

class LogoutLoadingState extends LoginState {}
