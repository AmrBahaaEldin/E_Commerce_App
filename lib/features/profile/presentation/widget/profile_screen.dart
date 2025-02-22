import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../data/profileModel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  //introductionBoarding
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 266.h,
                padding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink.shade50, Colors.blue.shade100],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 44.h,
                              width: 44.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(34.r),
                                    bottomRight: Radius.circular(34.r),
                                    topLeft: Radius.circular(34.r),
                                    topRight: Radius.circular(34.r),
                                  ),
                                  border: Border.all(
                                      color: AppColor.fontLabelColor,
                                      width: 1.w)),
                              child: Icon(
                                Icons.arrow_back_outlined,
                                size: 20.sp,
                              )),
                        ),
                        CustomText(
                          text: "Profile",
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 44.h,
                              width: 44.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(34.r),
                                    bottomRight: Radius.circular(34.r),
                                    topLeft: Radius.circular(34.r),
                                    topRight: Radius.circular(34.r),
                                  ),
                                  border: Border.all(
                                      color: AppColor.fontLabelColor,
                                      width: 1.w)),
                              child: Image(
                                  image: AssetImage("assets/png/img.png"))),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage('assets/png/img_2.png'), //
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: "Bryan Adam",
                      fontSize: 18.sp,
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: "bryan.adam87@gmail.com",
                      fontSize: 14.sp,
                      color: AppColor.subFontColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
           SliverToBoxAdapter(
             child: Column(
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 24.h,
                     ),
                     SvgPicture.asset(AppImage.bigLine),
                     SizedBox(
                       height: 28.h,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 20.w),
                       child: CustomText(
                           text: "Account Settings",
                           fontSize: 14.sp,
                           color: AppColor.subFontColor,
                           fontWeight: FontWeight.w600),
                     ),
                     SizedBox(
                       height: 16.h,
                     ),
                   ],
                 ),

               ],
             ),
           ),
            SliverList.separated(
              itemCount: accountSettings.length,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Divider(
                  thickness: 1,
                  height: 1,
                  color: Color(0xffEAEAEA),
                ),
              ),
              itemBuilder: (context, index) => CustomItemAccount(index: index),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  SvgPicture.asset(AppImage.bigLine),
                  SizedBox(
                    height: 28.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: CustomText(
                        text: "Account Settings",
                        fontSize: 14.sp,
                        color: AppColor.subFontColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
            SliverList.separated(
              itemCount: generalModel.length,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Divider(
                  thickness: 1,
                  height: 1,
                  color: Color(0xffEAEAEA),
                ),
              ),
              itemBuilder: (context, index) => CustomItemGeneral(index: index),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  SvgPicture.asset(AppImage.bigLine),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
            SliverList.separated(
              itemCount: leaveModel.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                height: 1,
                color: Color(0xffEAEAEA),
              ),
              itemBuilder: (context, index) => CustomItemLeave(index: index),
            )
          ],
        ),
      ),
    );
  }
}

class CustomItemAccount extends StatelessWidget {
  final int index;

  const CustomItemAccount({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: ShapeDecoration(
                color: AppColor.backgroundColor, shape: CircleBorder()),
            child: accountSettings[index].iconLeading,
          ),
          SizedBox(
            width: 16.h,
          ),
          CustomText(
            text: accountSettings[index].title,
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: accountSettings[index].iconTrailing!,
          )
        ],
      ),
    );
  }
}

class CustomItemGeneral extends StatelessWidget {
  final int index;

  const CustomItemGeneral({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: ShapeDecoration(
                color: AppColor.backgroundColor, shape: CircleBorder()),
            child: generalModel[index].iconLeading,
          ),
          SizedBox(
            width: 16.h,
          ),
          CustomText(
            text: generalModel[index].title,
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: generalModel[index].iconTrailing!,
          )
        ],
      ),
    );
  }
}

class CustomItemLeave extends StatelessWidget {
  final int index;

  const CustomItemLeave({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: ShapeDecoration(
                color: AppColor.backgroundColor, shape: CircleBorder()),
            child: leaveModel[index].iconLeading,
          ),
          SizedBox(
            width: 16.h,
          ),
          CustomText(
            text: leaveModel[index].title,
            color: AppColor.fontSelectColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
