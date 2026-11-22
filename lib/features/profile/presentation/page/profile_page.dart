import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore/core/di/injection_container.dart';
import 'package:petstore/core/widget/app_background.dart';
import 'package:petstore/features/profile/presentation/cubit/get_user_cubit.dart';
import 'package:petstore/features/profile/presentation/widget/profile_body.dart';
import 'package:petstore/features/profile/presentation/widget/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<GetUserCubit>(),
        child: AppBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              ProfileHeader(),
              ProfileBody(),
            ],
          ),
        ),
      ),
    );
  }
}
