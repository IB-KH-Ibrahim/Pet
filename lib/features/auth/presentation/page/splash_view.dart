

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petstore/core/di/injection_container.dart';
import 'package:petstore/features/auth/presentation/cubit/splash/splash_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/splash/splash_state.dart';
import '../../../../core/app_router/app_routers.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SplashCubit>(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
                switch (state) {
            case SplashLoading():
              return;
            case SplashHome():
              context.go(AppRoutes.main);
            case SplashLogin():
            context.go(AppRoutes.login);
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/bg_pet.png', fit: BoxFit.cover),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,

                color: const Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ).withValues(alpha: 0.5),
              ),
              Center(child: Image.asset("assets/logo_pet.png")),
            ],
          ),
        ),
      ),
    );
  }
}
