import 'package:petstore/core/api/api_dio.dart';
import 'package:petstore/core/api/api_string.dart';
import 'package:petstore/core/storage/scure_storage.dart';
import 'package:petstore/features/profile/data/data_sources/profile_remot_data_source.dart';
import 'package:petstore/features/profile/data/model/user_model.dart';

class ProfileRemotDataSourceImpl implements ProfileRemotDataSource {
  final ApiDio apiDio;

  ProfileRemotDataSourceImpl({required this.apiDio});
  @override
  Future<UserModel> getUser() async {
    final String username = ScureStorage.getData(value: 'username').toString();
    final response =await apiDio.get(
      url: ApiString.user,
      queryParameters: {'username': username},
    );
    return UserModel.fromJison(response);
  }
}
