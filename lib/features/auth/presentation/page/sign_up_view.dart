import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petstore/core/di/injection_container.dart';
import 'package:petstore/core/app_router/app_routers.dart';
import 'package:petstore/core/widget/showmessage.dart';
import 'package:petstore/features/auth/presentation/cubit/password/password_visibility_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/registar/register_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/registar/register_state.dart';
import 'package:petstore/features/auth/presentation/page/widget/register_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PasswordVisibilityCubit()),
        BlocProvider(create: (context) => sl<RegisterCubit>()),
      ],
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          switch (state) {
            case RegisterInitial():
              return;
            case RegisterLoading():
              return;
            case RegisterSuccess():
              showmessage(
                'Create Account  successful',
               theme.colorScheme.primary,
              );
              Navigator.pushReplacementNamed(context, AppRoutes.main);
            case RegisterError():
              showmessage('error', Colors.red);
          }
        },
        child: Scaffold(body: RegisterForm()),
      ),
    );
  }
}
