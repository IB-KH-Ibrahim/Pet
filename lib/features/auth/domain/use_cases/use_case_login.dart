import 'package:petstore/features/auth/domain/repositories/auth_repositories.dart';

class UseCaseLogin {
  final AuthRepositories authRepositories;
  UseCaseLogin( this.authRepositories);
  Future<void> call({
    required String username,
    required String password,
  }) async {
    return authRepositories.login(username: username, password: password);
  }
}
