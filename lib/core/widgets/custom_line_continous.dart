import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_color.dart';

class CustomLineContinous extends StatelessWidget {
  const CustomLineContinous({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/svg/line.svg"),
        SizedBox(
          width: 9.w,
        ),
        Text(
          "or continue with",
          style: GoogleFonts.plusJakartaSans(
            color: AppColor.fontLabelColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          width: 9.w,
        ),
        SvgPicture.asset("assets/svg/line.svg")
      ],
    );
  }
}