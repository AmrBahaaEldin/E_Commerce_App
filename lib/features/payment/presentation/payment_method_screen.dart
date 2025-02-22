import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/widgets/custom_text.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      Container(
      height: 44.h,
          width: 44.h,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34.r),
                bottomRight: Radius.circular(34.r),
                topLeft: Radius.circular(34.r),
                topRight: Radius.circular(34.r),
              ),
              border:
              Border.all(color: AppColor.fontLabelColor, width: 1.w)),
          child: Icon(
            Icons.arrow_back_outlined,
            size: 20.sp,
          )),
            CustomText(
              text: "Payment Method",
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            SizedBox(width: 10.w,),
          ],
        ),

      ),
    );
  }
}
