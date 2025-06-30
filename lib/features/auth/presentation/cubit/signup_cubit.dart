import 'dart:developer';

import 'package:dosytkom/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:dosytkom/features/auth/presentation/state/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  Future<void> signUp({
  required String firstName,
  required String lastName,
  required String libraryName,
  required int countryId,
  required int cityId,
  required int locationId,
  required String phoneNumber,
  String? secondPhoneNumber,
  required String deviceId,
}) async {
  emit(SignupLoading());
  try {
    final result = await signupUseCase(
      firstName: firstName,
      lastName: lastName,
      libraryName: libraryName,
      countryId: countryId,
      cityId: cityId,
      locationId: locationId,
      phoneNumber: phoneNumber,
      secondPhoneNumber: secondPhoneNumber,
     
    );

    // لاحظي هنا نتحقق من قيمة resultMessage
    if (result.status == true) {
      emit(SignupSuccess(message: result.resultMessage ?? "تم إنشاء الحساب بنجاح"));
    } else {
      emit(SignupError(result.resultMessage ?? "فشل التسجيل"));
    }
  } catch (e) {
    String errorMessage = e.toString();
    if (errorMessage.startsWith('Exception: ')) {
      errorMessage = errorMessage.replaceFirst('Exception: ', '');
    }
    log('Signup Error: $errorMessage');
    emit(SignupError(errorMessage));
  }
}
}