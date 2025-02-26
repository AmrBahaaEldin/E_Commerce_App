import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:e_commerce_app/features/order/presentation/select_address_screen.dart';
import 'package:e_commerce_app/features/order/presentation/widget/payment_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'order_success.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 44.h,
                  width: 44.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(34.r),
                        bottomRight: Radius.circular(34.r),
                        topLeft: Radius.circular(34.r),
                        topRight: Radius.circular(34.r),
                      ),
                      border: Border.all(
                          color: AppColor.fontLabelColor, width: 1.w)),
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 20.sp,
                  )),
            ),
            CustomText(
              text: "Order",
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 16.h),
            
              children: [
                Row(
                  children: [
                    CustomText(
                        text: "Address",
                        fontSize: 18.sp,
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SelectAddressScreen(),));
                      },
                      child: CustomText(
                          text: "Edit",
                          fontSize: 14.sp,
                          color: AppColor.importFontColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomText(
                    text: "🏠  Home",
                    fontSize: 14.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                    text: "10th of ramadan City",
                    fontSize: 12.sp,
                    color: AppColor.subFontColor,
                    fontWeight: FontWeight.w400),
                CustomText(
                    text: "Items",
                    fontSize: 18.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600),
                SvgPicture.asset(
                  height: 4.h,
                  width: 375.w,
                  AppImage.bigLine,
                ),
                SizedBox(
                  height: 18.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => CustomOrderItem(),
                    itemCount: 2,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 18.h,
                        )),
                SizedBox(height: 14.h),
                Divider(
                  height: 1,
                  color: AppColor.backgroundColor,
                ),
                SizedBox(
                  height: 16.h,
                ),
                SvgPicture.asset(
                  height: 4.h,
                  width: 375.w,
                  AppImage.bigLine,
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomText(
                    text: "Shipping",
                    fontSize: 18.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600),
                SizedBox(height: 16.h,),
                CustomShippingItem(),
                SizedBox(height: 24.h,),
                SvgPicture.asset(
                  height: 4.h,
                  width: 375.w,
                  AppImage.bigLine,
                ),
                SizedBox(height: 24.h,),
                CustomText(
                    text: "Payment Summary",
                    fontSize: 18.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600),
                Row(
                  children: [
                    CustomText(
                        text: "Price",
                        fontSize: 14.sp,
                        color: AppColor.subFontColor,
                        fontWeight: FontWeight.w400),
                    Spacer(),
                    CustomText(
                        text: "\$ 4.53",
                        fontSize: 14.sp,
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                SizedBox(height: 12.h,),
                Row(
                  children: [
                    CustomText(
                        text: "Price",
                        fontSize: 14.sp,
                        color: AppColor.subFontColor,
                        fontWeight: FontWeight.w400),
                    Spacer(),
                    CustomText(
                        text: "\$ 4.53",
                        fontSize: 14.sp,
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                SizedBox(height: 16.h,),
                Divider(
                  height: 1,
                  color: AppColor.backgroundColor,
                ),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    CustomText(
                        text: "Price",
                        fontSize: 14.sp,
                        color: AppColor.subFontColor,
                        fontWeight: FontWeight.w400),
                    Spacer(),
                    CustomText(
                        text: "\$ 4.53",
                        fontSize: 14.sp,
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                SizedBox(height: 24.h,),
                SvgPicture.asset(
                  height: 4.h,
                  width: 375.w,
                  AppImage.bigLine,
                ),
                SizedBox(height: 24.h,),
                CustomText(
                    text: "Payment Summary",
                    fontSize: 18.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600),
                SizedBox(height: 16.h,),
                PaymentMethod(),
              SizedBox(height: 24.h,),
            
            
            
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 16.h,bottom: 27.h),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),),
              ),
              child: CustomTextButton(label: "Pay \$1248")),
        ],
      ),
    );
  }
}





