import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../data/model_privcy.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
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
              text: "Privacy policy",
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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
            SliverList.separated(itemCount: privacyList.length,
              itemBuilder: (context, index) =>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "${index+1}.${privacyList[index].title}",
                    fontSize: 18.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600),
                SizedBox(height: 12.h,),
                CustomText(
                    color: AppColor.subFontColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    text:
                    privacyList[index].subtitle,
                ),
              ],
            ), separatorBuilder: (context, index) {
             return SizedBox(height: 24.h,);
            },)

          ],
        ),
      )
      ,
    );
  }
}
