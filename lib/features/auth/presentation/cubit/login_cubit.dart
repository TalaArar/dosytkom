
// import 'package:dosytkom/core/utl/constant_values.dart';
// import 'package:dosytkom/core/utl/secure_storage.dart';
// import 'package:dosytkom/features/auth/data/model/auth_model.dart';
// import 'package:dosytkom/features/auth/domain/use_case/login_use_use_case.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// import '../state/login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginUseCase loginUseCase;

//   LoginCubit({required this.loginUseCase}) : super(LoginStateInitial());

//   login({required String phone, required String password}) async {
//     emit(LoginStateLoading());
//     await loginUseCase
//         .call(phone: phone, password: password)
//         .then(
//           (value) {
//             if (value.result!) {
              
              
//               SecureStorageHelper().savePrefString(
//                 key: ConstantValues.phone,
//                 value: value.password!,
//               );

//               SecureStorageHelper().savePrefString(
//                 key: ConstantValues.phone,
//                 value: value.phone!,
//               );

//               emit(LoginStateSuccess(authModel: value));
//             } else {
//               emit(LoginStateError(errorMessage: value.msg!));
//             }
//           },
//           onError: (error) {
//             emit(LoginStateError(errorMessage: error.toString()));
//           },
//         );
//   }

//   getData() async {
//     emit(LoginStateLoading());

    
//     String password = await SecureStorageHelper().getPrefString(
//       key: ConstantValues.password,
//       defaultValue: "",
//     );
//     String phone = await SecureStorageHelper().getPrefString(
//       key: ConstantValues.phone,
//       defaultValue: "",
//     );

//     emit(
//       LoginStateSuccess(
//         authModel: AuthModel(
//           password: password,
//           phone: phone,
//         ),
//       ),
//     );
//   }

  
// }
