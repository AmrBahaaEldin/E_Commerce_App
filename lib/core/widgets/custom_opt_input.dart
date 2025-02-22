import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../constants/app_color.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: TextEditingController(),
      showCursor: true,
      animationCurve: Curves.easeInQuint,
      keyboardType: TextInputType.number,
      length: 4,
      focusedPinTheme:PinTheme(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        width: 75.w,
        height: 72.h,
        textStyle: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w400,color: AppColor.fontColor),
        decoration: BoxDecoration(
          border: Border.all(
            width:2.w,
            color: AppColor. importFontColor,
          ),

          borderRadius: BorderRadius.circular(12.r),
        ),

      ),
      defaultPinTheme: PinTheme(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        width: 75.w,
        height: 72.h,
        textStyle: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w400,color: AppColor.fontColor),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: AppColor. fontLabelColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      validator: (s) {
        return s == '2222' ? "pin is correct" : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,

      onCompleted: (value) {
        print(
            "_____________Completed________________${value}_________________");
      },
    );
  }
}