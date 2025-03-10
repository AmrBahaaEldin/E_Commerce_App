import 'dart:ui';

import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:e_commerce_app/features/payment/data/payment_model.dart';
import 'package:e_commerce_app/features/payment/presentation/payment_method_screen.dart';
import 'package:e_commerce_app/features/payment/presentation/widget/custom_payment_item_method.dart';
import 'package:e_commerce_app/features/payment/presentation/widget/sheetpayment.dart';
import 'package:e_commerce_app/features/profile/presentation/widget/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/widgets/custom_text.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LayoutScreen(),), (route) => false);
              },
              child: Container(
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
            ),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
      
          children: [
            SizedBox(height: 16.h,),
            Expanded(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index) => CustomPaymentItemMethod(index: index,) , separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ), itemCount: 3),
            ),
            Spacer(),
            CustomTextButton(label: "Add New Payment", onTap: (){
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return  BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: CustomSheetPayment());
                },
              );
            },),
            SizedBox(height: 8.h,),
      
          ],
        ),
      ),
    );
  }
}



