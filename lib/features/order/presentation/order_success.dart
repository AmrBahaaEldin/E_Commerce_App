import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../login/presentation/widget/otp_screen.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 565.h,
      width: 375.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Container(
              width: 66.66666.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColor.buttonColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(11.r),
                  topLeft: Radius.circular(11.r),
                  bottomRight: Radius.circular(11.r),
                  topRight: Radius.circular(11.r),
                ),
              ),
            ),
          ),
          SvgPicture.asset(AppImage.successOrder),
          SizedBox(height: 24.h,),
          CustomText(text: "Order Successful!",
              fontSize: 24.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600),
          SizedBox(height: 12.h,),
          CustomText(text: "You have successfully made order",
              fontSize: 14.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w400),
          SizedBox(height: 14.h,),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OtpScreen(),));
              },
              child: CustomTextButton(label: "view order",)),
          SizedBox(height: 12.h,),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OtpScreen(),));
              },
              child: CustomTextButton(label: "Back to Home",
                backgroundColor: Colors.white,
                color: AppColor.fontLabelColor,)),

        ],
      ),
    );
  }
}
