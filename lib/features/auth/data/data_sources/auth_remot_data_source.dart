
import 'package:petstore/features/auth/domain/params/user_parameters.dart';

abstract class AuthRemotDataSource {
  Future<void> createAccount( UserParameters userParametors);
  Future<void> logIn(String username,String password);
  Future<bool> check();
}