import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_color.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.label, this.onTap, this.color, this.backgroundColor});
  final String label;
  final Color? color;
  final Color? backgroundColor;
 final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 24.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.fontLabelColor, width: 1.w),
          color: backgroundColor?? AppColor.buttonColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: CustomText(
          text: label,
            color: color?? AppColor.backgroundColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

    );
  }
}