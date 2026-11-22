
import 'package:petstore/features/profile/data/model/user_model.dart';

abstract class ProfileRemotDataSource {
   Future<UserModel> getUser();
}