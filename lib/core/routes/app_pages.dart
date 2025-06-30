import 'package:dosytkom/features/NewOrder/data/data_source/new_order_request.dart';
import 'package:dosytkom/features/NewOrder/data/repositories/neworder_repository_Impl.dart';
import 'package:dosytkom/features/NewOrder/domain/repository/newOrderrepository.dart';
import 'package:dosytkom/features/NewOrder/domain/use_case/newOrder_use_case.dart';
import 'package:dosytkom/features/NewOrder/presentation/cubit/newOrderCubit.dart';
import 'package:dosytkom/features/auth/data/data_source/remote_data_source.dart';
import 'package:dosytkom/features/auth/data/repostitory/auth_repo_Impl.dart';
import 'package:dosytkom/features/auth/domain/repository/auth_reposotry.dart';
import 'package:dosytkom/features/auth/domain/use_case/login_use_use_case.dart';
import 'package:dosytkom/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:dosytkom/features/auth/presentation/cubit/login_cubit.dart';
import 'package:dosytkom/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

AuthRepository authRepository = AuthRepoImpl(dataSource: AuthRemoteDataSource());
NewOrderRequestRepository newOrderRequestRepository=RemoteDataSourceImpl(dataSource: DataSourceImpl());


class AppPages {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  static List<SingleChildWidget> get providers => [
    BlocProvider(
      create: (context) {
        return LoginCubit(loginUseCase: LoginUseCase(authRepository));
      },
    ),
    BlocProvider(
      create: (context) {
        return SignupCubit(signupUseCase: SignupUseCase(authRepository));
      },
    ),
   BlocProvider(
      create: (_) => NewOrderCubit(newOrderRequestRepository),),
  ];
  
}
