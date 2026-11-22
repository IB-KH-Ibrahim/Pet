import 'package:petstore/features/auth/domain/repositories/auth_repositories.dart';

class UseCaseAuthCheck {
  final AuthRepositories authRepositories;
  UseCaseAuthCheck(this.authRepositories);
  Future<bool> call() {
    return authRepositories.check();
  }
}