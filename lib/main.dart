import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petstore/core/app_router/app_router.dart';
import 'package:petstore/core/di/injection_container.dart';
import 'package:petstore/core/theme/app_theme.dart';
final GlobalKey<ScaffoldMessengerState> publiccontex = GlobalKey();
void main() {
  setupDependencies();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          theme:  AppTheme.lightTheme,
          scaffoldMessengerKey: publiccontex,
          debugShowCheckedModeBanner: false,
          routerConfig:  appRouter,
        );
      },
    ),
  );
}
