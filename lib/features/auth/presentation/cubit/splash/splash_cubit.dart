import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore/features/auth/domain/use_cases/use_case_auth_check.dart';
import 'package:petstore/features/auth/presentation/cubit/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final UseCaseAuthCheck useCaseAuthCheck;
  SplashCubit.name(this.useCaseAuthCheck) : super(SplashLoading());

  Future<void> check() async {
    await Future.delayed(const Duration(seconds: 3));
    bool state = await useCaseAuthCheck();
    state ? emit(SplashHome()) : emit(SplashLogin());
  }
}
