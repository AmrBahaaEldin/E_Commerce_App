import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300.h,
                  padding: EdgeInsets.only(top: 48.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.0, 1.0],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffFDA56C),
                        Color(0xffFD6C8A),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 44.h,
                            width: 44.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: ShapeDecoration(
                                color: AppColor.backgroundIcon,
                                shape: CircleBorder()),
                            child: Icon(
                              Icons.location_on,
                              color: AppColor.backgroundColor,
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: "Location",
                                  fontSize: 12.sp,
                                  color: AppColor.backgroundColor,
                                  fontWeight: FontWeight.w400),
                              CustomText(
                                  text: "Condong Catur",
                                  fontSize: 14.sp,
                                  color: AppColor.backgroundColor,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 44.h,
                            width: 44.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: ShapeDecoration(
                                color: AppColor.backgroundIcon,
                                shape: CircleBorder()),
                            child: Image(
                              image: AssetImage("assets/svg/icon/img.png"),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                                color: AppColor.backgroundIcon,
                                shape: CircleBorder()),
                            child: Image.asset(
                              AppImage.homeProfile,
                              width: 44.h,
                              height: 44.h,
                            ),
                          ), //profile
                        ],
                      ),
                      CustomText(
                          text: "Find best device for your setup!",
                          fontSize: 32.sp,
                          color: AppColor.backgroundColor,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -54.h,
                  child: Image(
                    image: AssetImage(AppImage.homeOffer),
                    height: 178.h,
                  ),
                ),
              ],
            ),
          ),
          ///////////////////////////////////////
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Hot deals🔥",
                    fontSize: 18.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Image(
                    image: AssetImage("assets/png/img_5.png"),
                    width: 100.h,
                  )
                ],
              ),
            ),
          ),
          ////////////////////////////////////
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          // ✅ 3️⃣ قائمة أفقية للمنتجات
          SliverToBoxAdapter(
            child: Padding(
              padding:EdgeInsets.only(left: 20.w),
              child: SizedBox(
                height: 215.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                  itemBuilder: (context, index) => Container(
                    width: 159.w,

                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/png/img_6.png"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomText(
                          text: "Macbook Pro 15” 2019 - Intel core i7",
                          fontSize: 14.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomText(
                          text: "\$ 1999",
                          fontSize: 16.sp,
                          color: AppColor.importFontColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 38.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: CustomText(
                  text: "Categories",
                  fontSize: 18.sp,
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h),),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Image(image: AssetImage("assets/png/img_7.png"),width: 80.w,height: 40.h,),
                  SizedBox(width: 12.w,),
                  Image(image: AssetImage("assets/png/img_8.png"),width: 114.w,height: 40.h,),
                  SizedBox(width: 12.w,),
                  Image(image: AssetImage("assets/png/img_9.png"),width: 114.w,height: 40.h,),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 22.h,
            ),
          ),
          // ✅ 4️⃣ شبكة المنتجات باستخدام SliverGrid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                  Container(


                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          width: 131.w,
                          height: 123.h,
                          image: AssetImage("assets/png/img_6.png"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomText(
                          text: "Macbook Pro 15” 2019 - Intel core i7",
                          fontSize: 14.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomText(
                          text: "\$ 1999",
                          fontSize: 16.sp,
                          color: AppColor.importFontColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
              childCount: 4,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24.h,           //vertical
                mainAxisSpacing: 16.w,          //horizontal
                childAspectRatio: 159.w/215.h      //(weidth/height)

              //vertical
            ),
          ),
        ],
      ),
    );
  }
}
