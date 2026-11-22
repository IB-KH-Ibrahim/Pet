import 'package:go_router/go_router.dart';
import 'package:petstore/core/app_router/app_routers.dart';
import 'package:petstore/features/auth/presentation/page/log_in_screen.dart';
import 'package:petstore/features/auth/presentation/page/reset_password_view.dart';
import 'package:petstore/features/auth/presentation/page/sign_up_view.dart';
import 'package:petstore/features/home/presentation/page/main_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.main,
  routes: [
    GoRoute(
      path: AppRoutes.main,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LogInScreen(),
    ),

    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => const SignUpPage(),
    ),

    GoRoute(
      path: AppRoutes.resetPassword,
      builder: (context, state) => const ResetPassword(),
    ),
  ],
);