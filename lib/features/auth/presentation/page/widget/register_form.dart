import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petstore/core/app_router/app_routers.dart';
import 'package:petstore/core/widget/custom_form_text_widget.dart';
import 'package:petstore/features/auth/presentation/cubit/password/password_visibility_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/password/password_visibility_state.dart';
import 'package:petstore/features/auth/presentation/cubit/registar/register_cubit.dart';
import 'package:petstore/features/auth/presentation/cubit/registar/register_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final focusUserName = FocusNode();
  final focusFirstName = FocusNode();
  final focusLastName = FocusNode();
  final focusEmail = FocusNode();
  final focusPhone = FocusNode();
  final focusPassword = FocusNode();
  final focusConfirmPassword = FocusNode();
  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    focusUserName.dispose();
    focusFirstName.dispose();
    focusLastName.dispose();
    focusEmail.dispose();
    focusPhone.dispose();
    focusPassword.dispose();
    focusConfirmPassword.dispose();
    super.dispose();
  }

  final List<Widget> item =[
  














 ];
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 100.h,
            left: 10.w,
            right: 10.w,
            bottom: 10.h,
          ),
          child: Card(
            color: const Color.fromARGB(201, 255, 255, 255),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 2.h, start: 10.w),
                  child: Text(
                    "First Name:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                CustomFormTextWidget(
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
                  myfocus: focusFirstName,
                  nextfocus: focusLastName,
                  controller: firstNameController,
                  typeinput: TextInputType.text,
                  hinttext: 'Ali',
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          bottom: 2.h,
                          start: 10.w,
                        ),
                        child: Text(
                          "Last Name:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CustomFormTextWidget(
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
                        myfocus: focusLastName,
                        nextfocus: focusUserName,
                        controller: lastNameController,
                        typeinput: TextInputType.text,
                        hinttext: 'Al Ali',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: 30.h,
                    bottom: 10.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    bottom: 2.h,
                                    start: 10.w,
                                  ),
                                  child: Text(
                                    "User Name:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                CustomFormTextWidget(
                                  validat: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: const Color.fromARGB(
                                      255,
                                      16,
                                      75,
                                      19,
                                    ),
                                  ),
                                  myfocus: focusUserName,
                                  nextfocus: focusEmail,
                                  controller: userNameController,
                                  typeinput: TextInputType.text,
                                  hinttext: 'Ali1',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    bottom: 2.h,
                                    start: 10.w,
                                  ),
                                  child: Text(
                                    "Email:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                CustomFormTextWidget(
                                  validat: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                    if (!EmailValidator.validate(value)) {
                                      return 'Invalid email address';
                                    }

                                    return null;
                                  },
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: const Color.fromARGB(
                                      255,
                                      16,
                                      75,
                                      19,
                                    ),
                                  ),
                                  myfocus: focusEmail,
                                  nextfocus: focusPhone,
                                  controller: emailController,
                                  typeinput: TextInputType.emailAddress,
                                  hinttext: 'Ali@gmail.com',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    bottom: 2.h,
                                    start: 10.w,
                                  ),
                                  child: Text(
                                    "Phone:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                CustomFormTextWidget(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  validat: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: const Color.fromARGB(
                                      255,
                                      16,
                                      75,
                                      19,
                                    ),
                                  ),
                                  myfocus: focusPhone,
                                  nextfocus: focusPassword,
                                  controller: phoneController,
                                  typeinput: TextInputType.phone,
                                  hinttext: '0911112222',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    bottom: 2.h,
                                    start: 10.w,
                                  ),
                                  child: Text(
                                    "Password:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
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
                                        if (value !=
                                            confirmPasswordController.text) {
                                          return "Passwords do not match";
                                        }
                                        return null;
                                      },
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: const Color.fromARGB(
                                          255,
                                          16,
                                          75,
                                          19,
                                        ),
                                      ),
                                      obscure: state.statePassword,
                                      myfocus: focusPassword,
                                      nextfocus: focusConfirmPassword,
                                      controller: passwordController,
                                      typeinput: TextInputType.visiblePassword,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          state.statePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: const Color.fromARGB(
                                            255,
                                            16,
                                            75,
                                            19,
                                          ),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<PasswordVisibilityCubit>()
                                              .changeVisibilityPassword();
                                        },
                                      ),
                                      hinttext: 'Password',
                                    );
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    bottom: 2.h,
                                    start: 10.w,
                                  ),
                                  child: Text(
                                    "Confirm Password:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
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
                                        if (value != passwordController.text) {
                                          return "Passwords do not match";
                                        }
                                        return null;
                                      },
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: const Color.fromARGB(
                                          255,
                                          16,
                                          75,
                                          19,
                                        ),
                                      ),
                                      obscure: state.stateConfigrationPassword,
                                      myfocus: focusConfirmPassword,
                                      controller: confirmPasswordController,
                                      typeinput: TextInputType.visiblePassword,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          state.stateConfigrationPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: const Color.fromARGB(
                                            255,
                                            16,
                                            75,
                                            19,
                                          ),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<PasswordVisibilityCubit>()
                                              .changeVisibilityConfigrationPassword();
                                        },
                                      ),
                                      hinttext: 'Confirm Password',
                                    );
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 50.w,
                                vertical: 10.h,
                              ),
                              child:
                                  BlocSelector<
                                    RegisterCubit,
                                    RegisterState,
                                    bool
                                  >(
                                    selector: (state) =>
                                        state is RegisterLoading,
                                    builder: (context, state) {
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                            255,
                                            16,
                                            75,
                                            19,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                        ),
                                        onPressed: state
                                            ? null
                                            : () {
                                                if (registerFormKey
                                                    .currentState!
                                                    .validate()) {
                                                  context
                                                      .read<RegisterCubit>()
                                                      .registar(
                                                        username:
                                                            userNameController
                                                                .text
                                                                .trim(),
                                                        firstName:
                                                            firstNameController
                                                                .text
                                                                .trim(),
                                                        lastName:
                                                            lastNameController
                                                                .text
                                                                .trim(),
                                                        email: emailController
                                                            .text
                                                            .trim(),
                                                        password:
                                                            passwordController
                                                                .text
                                                                .trim(),
                                                        phone: phoneController
                                                            .text
                                                            .trim(),
                                                      );
                                                }
                                              },
                                        child: Center(
                                          child: Text(
                                            state ? "Wait..." : "create",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
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
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.login,
                                  );
                                },
                                child: Text(
                                  "Already have an account? Log in",
                                  style: TextStyle(
                                    color: const Color.fromARGB(185, 6, 6, 6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
