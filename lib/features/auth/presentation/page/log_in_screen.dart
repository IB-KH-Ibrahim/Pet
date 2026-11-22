import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:petstore/core/di/injection_container.dart';
import 'package:petstore/core/app_router/app_routers.dart';
import 'package:petstore/core/widget/showmessage.dart';
import 'package:petstore/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/login/login_state.dart';
import 'package:petstore/features/auth/presentation/cubit/password/password_visibility_cubit.dart';
import 'package:petstore/features/auth/presentation/page/widget/login_form.dart';
import 'package:petstore/features/auth/presentation/page/widget/login_heder.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PasswordVisibilityCubit()),
        BlocProvider(create: (context) => sl<LoginCubit>()),
      ],
      child: BlocListener<LoginCubit, LoginStete>(
        listener: (context, state) {
          switch (state) {
            case LoginInitial():
              return;
            case LoginLoading():
              return;
            case LoginSuccess():
              showmessage('Login successful', Color.fromARGB(255, 41, 197, 39));
              context.go(AppRoutes.main);
            case LoginError():
              showmessage('The password is invalid', Colors.red);
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(),
                SizedBox(height: 50.h),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
