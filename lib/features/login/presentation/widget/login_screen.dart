import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/widgets/custom_button_sheet.dart';
import '../../../../core/widgets/custom_line_continous.dart';
import '../../../../core/widgets/custom_sign_log.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../home/presentation/widget/home_screen.dart';
import '../../../register/presentation/widget/register_screen.dart';
import '../../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            TextEditingController controllerUsername = TextEditingController();
            TextEditingController controllerPassword = TextEditingController();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: fromKey,
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
                            return "Please enter your username";
                          }
                        },
                        controller: controllerUsername,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "username",
                        labelText: "Username",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                        },
                        controller: controllerPassword,
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
                      CustomTextButton(
                        label: "login",
                        onTap: () {
                          if (!fromKey.currentState!.validate()) {
                            context.read<LoginCubit>().userLogin(
                                controllerUsername.text,
                                controllerPassword.text,
                                context);

                          }
                        },
                      ),
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
