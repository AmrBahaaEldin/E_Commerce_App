import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LayoutScreen(),
                    ),
                    (route) => false);
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
              text: "Cart",
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
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: 55.w, right: 55.w,top: 44.h),
          child: Column(

            children: [
              SvgPicture.asset(AppImage.card),
              SizedBox(
                height: 24.h,
              ),
              CustomText(
                  text: "Your cart is an empty!",
                  fontSize: 20.sp,
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 12.h,
              ),
              CustomText(
                  text: "Looks like you haven't added anything\n                              to your cart yet",
                  fontSize: 14.sp,
                  color: AppColor.subFontColor,
                  fontWeight: FontWeight.w400),
            ],
          ),
        ),
      ),
    );
  }
}
