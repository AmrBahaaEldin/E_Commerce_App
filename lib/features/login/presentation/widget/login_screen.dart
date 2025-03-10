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
                    msg: state.loginModel.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
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
                }
                else {
                  print("⚠️ Error: Token is null or empty");
                }

                

              }
              else if (state.loginModel.status == false) {
                Fluttertoast.showToast(
                    msg: state.loginModel.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: context.read<LoginCubit>().fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Login to Your \n account",
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.fontColor,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your Email";
                          }
                          return null;
                        },
                        controller: context.read<LoginCubit>().controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Email",
                        labelText: "Email Address",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        controller:
                            context.read<LoginCubit>().controllerPassword,
                        keyboardType: TextInputType.visiblePassword,
                        isHidden: context.read<LoginCubit>().isHide,
                        hintText: "Password",
                        labelText: "Password",
                        suffixIcon: context.read<LoginCubit>().isHide
                            ? GestureDetector(
                                onTap: () {
                                  context.read<LoginCubit>().setHide();
                                },
                                child: Icon(Icons.visibility_outlined))
                            : GestureDetector(
                                onTap: () {
                                  context.read<LoginCubit>().setHide();
                                },
                                child: Icon(Icons.visibility_off_outlined)),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 5.0, sigmaY: 5.0),
                                    child: CustomForgetPasswordSheet());
                              },
                            );
                          },
                          child: CustomText(
                            text: "Forgot Password?",
                            color: AppColor.fontColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ConditionalBuilder(
                          condition: state is! LoginLoading,
                          builder: (context) => CustomTextButton(
                                label: "login",
                                onTap: () {
                                  final loginCubit = context.read<LoginCubit>();
                                  if (loginCubit.fromKey.currentState!
                                      .validate()) {
                                    loginCubit.userLogin(
                                      loginCubit.controllerEmail.text.trim(),
                                      loginCubit.controllerPassword.text.trim(),
                                    );
                                  }
                                },
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator())),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomLineContinous(),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomSignLog(
                        textLogo: "Continue with google",
                        imageLogo: AppImage.logoGoogle,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomSignLog(
                        textLogo: "Continue with facebook",
                        imageLogo: AppImage.logoFaceBook,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Don't have an account?",
                            color: AppColor.subFontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return RegisterScreen();
                                },
                              ));
                            },
                            child: CustomText(
                              text: "Register",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.importFontColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
