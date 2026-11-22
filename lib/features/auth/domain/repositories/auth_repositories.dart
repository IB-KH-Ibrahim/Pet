import 'package:petstore/features/auth/domain/params/user_parameters.dart';

abstract class AuthRepositories {

  Future<void> register({
   required UserParameters userParametors
  });

  Future<void> login({
    required String username,
    required String password,
  });
  Future<bool> check();
}

