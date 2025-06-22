import 'package:dosytkom/features/auth/data/model/auth_model.dart';

abstract class LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  AuthModel authModel;

  LoginStateSuccess({required this.authModel});
}

class LoginStateError extends LoginState {
  String errorMessage;

  LoginStateError({required this.errorMessage});
}

class LoginStateInitial extends LoginState {}

class LogoutState extends LoginState {}

class LogoutLoadingState extends LoginState {}
