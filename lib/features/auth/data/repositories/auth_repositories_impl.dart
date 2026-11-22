import 'package:petstore/features/auth/data/data_sources/auth_remot_data_source.dart';
import 'package:petstore/features/auth/domain/params/user_parameters.dart';
import 'package:petstore/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  final AuthRemotDataSource authRemotDataSource;
  AuthRepositoriesImpl(this.authRemotDataSource);

  @override
  Future<void> login({required String username, required String password}) {
    return authRemotDataSource.logIn(username, password);
  }

  @override
  Future<void> register({required UserParameters userParametors}) {
    return authRemotDataSource.createAccount(userParametors);
  }

  @override
  Future<bool> check() {
     return authRemotDataSource.check();
  }

}
