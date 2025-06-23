import 'package:dosytkom/core/utl/constant_values.dart';
import 'package:dosytkom/core/utl/secure_storage.dart';
import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';
import 'package:dosytkom/features/auth/domain/use_case/login_use_use_case.dart';
import 'package:dosytkom/features/auth/presentation/state/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginStateInitial());

  Future<void> login({required String phone, required String password}) async {
    emit(LoginStateLoading());

    try {
      final authEntity = await loginUseCase.call(
        phone: phone,
        password: password,
      );

      if (authEntity.status == true) {
        // افترضت أن AuthEntity يحتوي result
        await SecureStorageHelper().savePrefString(
          key: ConstantValues.password,
          value: password,
        );
        await SecureStorageHelper().savePrefString(
          key: ConstantValues.phone,
          value: phone,
        );

        emit(LoginStateSuccess(authEntity: authEntity));
      } else {
        emit(
          LoginStateError(
            errorMessage: authEntity.resultMessage ?? "فشل تسجيل الدخول",
          ),
        );
      }
    } catch (error) {
      emit(LoginStateError(errorMessage: error.toString()));
    }
  }

  Future<void> getData() async {
    emit(LoginStateLoading());

    final password = await SecureStorageHelper().getPrefString(
      key: ConstantValues.password,
      defaultValue: "",
    );
    final phone = await SecureStorageHelper().getPrefString(
      key: ConstantValues.phone,
      defaultValue: "",
    );

    final authEntity = AuthEntity(
      password: password,
      userName: phone,
      userType: '',
      loginToken: '',
      status: null,
      resultMessage: '',
      refNo: '', firstName: '', lastName: '', libraryName: '', countryId: null, cityId: null, locationId: null, phoneNumber: '',
     
    );

    emit(LoginStateSuccess(authEntity: authEntity));
  }
}
