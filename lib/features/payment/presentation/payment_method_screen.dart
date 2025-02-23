import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/payment/data/payment_model.dart';
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
            CustomTextButton(label: "Add New Payment", onTap: (){},),
            SizedBox(height: 8.h,),
      
          ],
        ),
      ),
    );
  }
}

class CustomPaymentItemMethod extends StatelessWidget {
  final int index;
  const CustomPaymentItemMethod({
    super.key,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          border: Border.all(width: 1.w,color: AppColor.subFontColor),),

                    child: Row(
    children: [
      Container(
        height: 44.h,
        width: 44.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: ShapeDecoration(
            color: AppColor.backgroundColor, shape: CircleBorder()),
        child:Image.asset( paymentModel[index].image),
      ),
      SizedBox(
        width: 16.h,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: paymentModel[index].title,
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          CustomText(
            text: paymentModel[index].subtitle,
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ],
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_forward_ios),
      )
    ],
                    ),
                  );
  }
}
