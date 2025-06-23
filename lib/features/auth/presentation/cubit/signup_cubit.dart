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
  }) async {
    emit(SignupLoading());
    try {
      await signupUseCase(
        firstName: firstName,
        lastName: lastName,
        libraryName: libraryName,
        countryId: countryId,
        cityId: cityId,
        locationId: locationId,
        phoneNumber: phoneNumber,
        secondPhoneNumber: secondPhoneNumber,
      );
      emit(SignupSuccess());
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
