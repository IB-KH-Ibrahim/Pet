import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore/features/profile/domain/use_cases/use_case_get_user.dart';
import 'package:petstore/features/profile/presentation/cubit/profile_state.dart';

class GetUserCubit extends Cubit<ProfileState> {
  final UseCaseGetUser useCaseGetUser;
  GetUserCubit(this.useCaseGetUser) : super(ProfileLoading());
   Future<void> getUser() async {
    emit(ProfileLoading());

    try {
      emit(ProfileSuccess(await useCaseGetUser()));

     
    } catch (e) {
      emit(ProfileError());
      return;
    }
    
  }
}
