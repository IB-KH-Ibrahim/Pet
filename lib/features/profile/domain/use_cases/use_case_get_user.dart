import 'package:petstore/features/profile/domain/entities/user.dart';
import 'package:petstore/features/profile/domain/repositories/profile_repositories.dart';

class UseCaseGetUser {
  final ProfileRepositories profileRepositories;
  UseCaseGetUser( this.profileRepositories);
  Future<User> call() async {
 return profileRepositories.getUser();
  }
}
