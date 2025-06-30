abstract class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final String message;
  LoginStateSuccess({required this.message});
}

class LoginStateError extends LoginState {
  final String errorMessage;
  LoginStateError({required this.errorMessage});
}
