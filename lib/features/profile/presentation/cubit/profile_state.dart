import 'package:petstore/features/profile/domain/entities/user.dart';

sealed class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User user;
  ProfileSuccess(this.user);
}
