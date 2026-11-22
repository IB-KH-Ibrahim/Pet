import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:petstore/core/api/api_dio.dart';
import 'package:petstore/core/api/api_string.dart';
import 'package:petstore/features/auth/data/data_sources/auth_remot_data_source.dart';
import 'package:petstore/features/auth/data/data_sources/auth_remot_data_source_impl.dart';
import 'package:petstore/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:petstore/features/auth/domain/repositories/auth_repositories.dart';
import 'package:petstore/features/auth/domain/use_cases/use_case_auth_check.dart';
import 'package:petstore/features/auth/domain/use_cases/use_case_create_account.dart';
import 'package:petstore/features/auth/domain/use_cases/use_case_login.dart';
import 'package:petstore/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/registar/register_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/splash/splash_cubit.dart';
import 'package:petstore/features/profile/data/data_sources/profile_remot_data_source.dart';
import 'package:petstore/features/profile/data/data_sources/profile_remot_data_source_impl.dart';
import 'package:petstore/features/profile/data/repositories/profile_repositories_impl.dart';
import 'package:petstore/features/profile/domain/repositories/profile_repositories.dart';
import 'package:petstore/features/profile/domain/use_cases/use_case_get_user.dart';
import 'package:petstore/features/profile/presentation/cubit/get_user_cubit.dart';

final sl = GetIt.instance;

void setupDependencies() {
  sl.registerLazySingleton<GetUserCubit>(
    () => GetUserCubit(sl<UseCaseGetUser>()),
  );

  sl.registerLazySingleton<UseCaseGetUser>(
    () => UseCaseGetUser(sl<ProfileRepositories>()),
  );

  sl.registerLazySingleton<ProfileRepositories>(
    () => ProfileRepositoriesImpl(sl<ProfileRemotDataSource>()),
  );
  sl.registerLazySingleton<ProfileRemotDataSource>(
    () => ProfileRemotDataSourceImpl(apiDio: sl<ApiDio>()),
  );

  sl.registerFactory<SplashCubit>(
    () => SplashCubit.name(sl<UseCaseAuthCheck>()),
  );
  sl.registerFactory<UseCaseAuthCheck>(
    () => UseCaseAuthCheck(sl<AuthRepositories>()),
  );
  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(sl<UseCaseCreateAccount>()),
  );
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<UseCaseLogin>()));
  sl.registerFactory<UseCaseCreateAccount>(
    () => UseCaseCreateAccount(sl<AuthRepositories>()),
  );
  sl.registerFactory<UseCaseLogin>(() => UseCaseLogin(sl<AuthRepositories>()));
  sl.registerFactory<AuthRepositories>(
    () => AuthRepositoriesImpl(sl<AuthRemotDataSource>()),
  );

  sl.registerFactory<AuthRemotDataSource>(
    () => AuthRemotDataSourceImpl(apiDio: sl<ApiDio>()),
  );
  sl.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiString.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    ),
  );
  sl.registerLazySingleton<ApiDio>(() => ApiDio(sl<Dio>()));
}
