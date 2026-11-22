import 'package:petstore/features/profile/domain/entities/user.dart';

abstract class ProfileRepositories {
  Future<User> getUser();
}
