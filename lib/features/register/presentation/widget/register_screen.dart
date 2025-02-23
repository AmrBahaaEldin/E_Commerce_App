import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/widgets/custom_sign_log.dart';
import '../../../../core/widgets/custom_line_continous.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../login/presentation/widget/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Your new \n account",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.fontColor,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                hintText: "Email address",
                labelText: "Email",
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Password",
                  labelText: "Password",
                  suffixIcon: Icon(Icons.visibility_outlined)),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Confirm Password",
                  labelText: "Password",
                  suffixIcon: Icon(Icons.visibility_outlined)),
              SizedBox(
                height: 24.h,
              ),
              CustomTextButton(label: "Register"),
              SizedBox(height:  24.h),
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
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColor.subFontColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      },));
                    },
                    child: CustomText(

                      text: "Login",
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
  }
}
