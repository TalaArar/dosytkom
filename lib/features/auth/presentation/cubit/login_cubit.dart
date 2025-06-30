import 'dart:developer';
import 'package:dosytkom/features/auth/domain/use_case/login_use_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dosytkom/features/auth/presentation/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginStateInitial());

  Future<void> login({
    required String phone,
    required String password,
    required String deviceId,
  }) async {
    emit(LoginStateLoading());

    try {
      final result = await loginUseCase(
        phone: phone,
        password: password,
      );

      if (result.status == true) {
        emit(LoginStateSuccess(message: result.resultMessage ?? "تم تسجيل الدخول بنجاح"));
      } else {
        emit(LoginStateError(errorMessage: result.resultMessage ?? "فشل تسجيل الدخول"));
      }

    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.replaceFirst('Exception: ', '');
      }
      log('Login Error: $errorMessage'); // ✅ هنا التصحيح
      emit(LoginStateError(errorMessage: errorMessage));
    }
  }
}
