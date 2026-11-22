import 'package:petstore/features/auth/domain/params/user_parameters.dart';
import 'package:petstore/features/auth/domain/repositories/auth_repositories.dart';


class UseCaseCreateAccount {
  final AuthRepositories authRepositories;
  UseCaseCreateAccount(this.authRepositories);
  Future<void> call({
    required UserParameters userParametors,

  }) {
    return authRepositories.register(
     userParametors: userParametors,
    );
  }
}
