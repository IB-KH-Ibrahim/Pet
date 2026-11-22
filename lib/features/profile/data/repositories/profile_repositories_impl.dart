import 'package:petstore/features/profile/data/data_sources/profile_remot_data_source.dart';
import 'package:petstore/features/profile/data/model/user_model.dart';
import 'package:petstore/features/profile/domain/entities/user.dart';
import 'package:petstore/features/profile/domain/repositories/profile_repositories.dart';

class ProfileRepositoriesImpl implements ProfileRepositories {
  final ProfileRemotDataSource profileRemotDataSource;
  ProfileRepositoriesImpl( this.profileRemotDataSource);
  @override
  Future<User> getUser() async {
    final UserModel userModel = await profileRemotDataSource.getUser();
    return User(
      userName: userModel.username,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      password: userModel.password,
      phone: userModel.phone,
    );
  }
}
