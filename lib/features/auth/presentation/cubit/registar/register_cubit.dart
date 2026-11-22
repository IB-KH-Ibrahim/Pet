import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore/features/auth/domain/params/user_parameters.dart';
import 'package:petstore/features/auth/domain/use_cases/use_case_create_account.dart';
import 'package:petstore/features/auth/presentation/cubit/registar/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UseCaseCreateAccount useCaseCreateAccount;
  RegisterCubit(this.useCaseCreateAccount) : super(RegisterInitial());

  Future<void> registar({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) async {
    UserParameters userParameters = UserParameters(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
    );
    emit(RegisterLoading());

    try {
      await useCaseCreateAccount(userParametors: userParameters);
    } catch (e) {
      emit(RegisterError());
      return;
    }
    emit(RegisterSuccess());
  }
}
