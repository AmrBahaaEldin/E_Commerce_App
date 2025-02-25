import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isHidden;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool isRead;

  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.keyboardType,
      this.suffixIcon,
      this.hintText,
      required this.controller,
      this.isHidden = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.isRead=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.plusJakartaSans(
              color: AppColor.fontLabelColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          readOnly: isRead,
          onTap: onTap,
          obscureText: isHidden,
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.grey),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
