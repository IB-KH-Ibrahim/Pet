import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:petstore/core/app_router/app_routers.dart';
import 'package:petstore/core/widget/custom_form_text_widget.dart';
import 'package:petstore/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/login/login_state.dart';
import 'package:petstore/features/auth/presentation/cubit/password/password_visibility_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/password/password_visibility_state.dart';

class LoginForm extends StatefulWidget {
  const new({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Card(
        elevation: 3,
        child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: CustomFormTextWidget(
                  validat: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 16, 75, 19),
                  ),
                  myfocus: usernameFocusNode,
                  nextfocus: passwordFocusNode,
                  controller: usernameController,
                  typeinput: TextInputType.text,
                  hinttext: 'Enter Your User Name',
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child:
                    BlocBuilder<
                      PasswordVisibilityCubit,
                      PasswordVisibilityState
                    >(
                      builder: (context, state) {
                        return CustomFormTextWidget(
                          validat: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },

                          prefixIcon: Icon(
                            Icons.lock,
                            color: const Color.fromARGB(255, 16, 75, 19),
                          ),
                          obscure: state.statePassword,
                          myfocus: passwordFocusNode,
                          controller: passwordController,
                          typeinput: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.statePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromARGB(255, 16, 75, 19),
                            ),
                            onPressed: () {
                              context
                                  .read<PasswordVisibilityCubit>()
                                  .changeVisibilityPassword();
                            },
                          ),
                          hinttext: 'Enter Your Password',
                        );
                      },
                    ),
              ),
              TextButton(
                onPressed: () {
                  context.go(AppRoutes.resetPassword);
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: const Color.fromARGB(215, 0, 0, 0),
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 50.w),
                child: BlocSelector<LoginCubit, LoginStete, bool>(
                  selector: (state) => state is LoginLoading,
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 16, 75, 19),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: state
                          ? null
                          : () async {
                              if (loginFormKey.currentState!.validate()) {
                                context.read<LoginCubit>().logIn(
                                  userName: usernameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                      child: Center(
                        child: Text(
                          state ? 'Loading...' : 'Login',
                          style: TextStyle(
                            color: state
                                ? const Color.fromARGB(255, 16, 75, 19)
                                : Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 5.w,
                  horizontal: 10.h,
                ),
                child: TextButton(
                  onPressed: () {
                    context.go(AppRoutes.signup);
                  },
                  child: Text(
                    "Don't have an account? Join us",

                    style: TextStyle(color: const Color.fromARGB(185, 0, 0, 0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
