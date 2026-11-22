import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore/features/auth/domain/use_cases/use_case_login.dart';
import 'package:petstore/features/auth/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginStete> {
  final UseCaseLogin useCaseLogin;

  LoginCubit(this.useCaseLogin) : super(LoginInitial());

  Future<void> logIn({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      await useCaseLogin(
        username: userName,
        password: password,
      );
    } catch (e) {
      emit(LoginError());
      return;
    }
    emit(LoginSuccess());
  }
}
