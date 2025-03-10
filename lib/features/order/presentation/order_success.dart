import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/widgets/custom_text_button.dart';


class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),

      width: 375.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 66.66666.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColor.subFontColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.r),
                topLeft: Radius.circular(11.r),
                bottomRight: Radius.circular(11.r),
                topRight: Radius.circular(11.r),
              ),
            ),
          ),
          SizedBox(height: 12.h,),
          SvgPicture.asset(AppImage.successOrder,height: 208.h,width: 199.w,),
          CustomText(text: "Order Successful!",
              fontSize: 24.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600),
          SizedBox(height: 12.h,),
          CustomText(text: "You have successfully made order",
              fontSize: 14.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w400),
          SizedBox(height: 24.h,),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfirmOrderScreen(),));
              },
              child: CustomTextButton(label: "view order",)),
          SizedBox(height: 12.h,),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LayoutScreen(),));
              },
              child: CustomTextButton(label: "Back to Home",
                backgroundColor: Colors.white,
                color: AppColor.fontLabelColor,)),

        ],
      ),
    );
  }
}
