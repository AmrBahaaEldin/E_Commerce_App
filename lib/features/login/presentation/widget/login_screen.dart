import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/db/cache/cache.dart';

import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/widgets/custom_forget_password_sheet.dart';
import '../../../../core/widgets/custom_line_continous.dart';
import '../../../../core/widgets/custom_sign_log.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

import '../../../register/presentation/widget/register_screen.dart';
import '../../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginSuccess) {
                if (state.loginModel.status) {
                  Fluttertoast.showToast(
                    msg: state.loginModel.message ?? "Login successful",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );


                  final token = state.loginModel.data?.token;
                  if (token != null && token.isNotEmpty) {
                    await CacheHelper.saveData(key: 'token', value: token);
                    print("🔹 New Token Stored: $token");


                    Future.delayed(Duration(milliseconds: 500), () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LayoutScreen()),
                            (route) => false,
                      );
                    });
                  } else {
                    print("⚠️ Error: Token is null or empty");
                  }
                } else {
                  Fluttertoast.showToast(
                    msg: state.loginModel.message ?? "Login failed",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              }
            }
,
            builder: (context, state) {
              final loginCubit = context.read<LoginCubit>();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: loginCubit.fromKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Login to Your \n account",
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.fontColor,
                        ),
                        SizedBox(height: 32.h),
                        CustomTextField(
                          validator: (value) {
                            if (value!.isEmpty) return "Please enter your Email";
                            return null;
                          },
                          controller: loginCubit.controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Email",
                          labelText: "Email Address",
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          validator: (value) {
                            if (value!.isEmpty) return "Please enter your password";
                            return null;
                          },
                          controller: loginCubit.controllerPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isHidden: loginCubit.isHide,
                          hintText: "Password",
                          labelText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () => loginCubit.setHide(),
                            child: Icon(loginCubit.isHide
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ConditionalBuilder(
                          condition: state is! LoginLoading,
                          builder: (context) => CustomTextButton(
                            label: "login",
                            onTap: () {
                              if (loginCubit.fromKey.currentState!.validate()) {
                                loginCubit.userLogin(
                                  loginCubit.controllerEmail.text.trim(),
                                  loginCubit.controllerPassword.text.trim(),
                                );
                              }
                            },
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

        ),
      ),
    );
  }
}
