import 'package:petstore/core/api/api_dio.dart';
import 'package:petstore/core/api/api_string.dart';
import 'package:petstore/core/storage/scure_storage.dart';
import 'package:petstore/features/auth/data/data_sources/auth_remot_data_source.dart';
import 'package:petstore/features/auth/domain/params/user_parameters.dart';

class AuthRemotDataSourceImpl implements AuthRemotDataSource {
  final ApiDio apiDio;
  AuthRemotDataSourceImpl({required this.apiDio});
  @override
  Future<void> createAccount(UserParameters userParametors) async {
    await apiDio.post(url: ApiString.user, body: userParametors.toJson());
  }

  @override
  Future<void> logIn(String username, String password) async {
    await apiDio.get(
      url: ApiString.login,
      queryParameters: {'username': username, 'password': password},
    );
    await ScureStorage.saveData(key: username, value: username);
  }

  @override
  Future<bool> check() async {
    if (await ScureStorage.getData(value: 'username') != null) {
      return true;
    } else {
      return false;
    }
  }
}
