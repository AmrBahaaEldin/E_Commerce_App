import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/home/logic/home_cubit.dart';
import 'package:e_commerce_app/features/home/logic/home_state.dart';
import 'package:e_commerce_app/features/home/presentation/detail_product_screen.dart';
import 'package:e_commerce_app/features/home/presentation/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDataHome(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                        padding:
                            EdgeInsets.only(top: 48.h, left: 20.w, right: 20.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.2, 0.8, 0.9],

                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffFD6C8A),
                              Color(0xffFDA56C),
                              Color(0xffFEB5AE),

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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationScreen(),
                                        ));
                                  },
                                  child: Container(
                                    height: 44.h,
                                    width: 44.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    decoration: ShapeDecoration(
                                        color: AppColor.backgroundIcon,
                                        shape: CircleBorder()),
                                    child: Image(
                                      image:
                                          AssetImage("assets/svg/icon/img.png"),
                                    ),
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
                  child: ConditionalBuilder(
                      condition:
                          context.watch<HomeCubit>().homeModel.isNotEmpty,
                      builder: (context) =>
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: SizedBox(
                              height: 215.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    HomeCubit.get(context).homeModel.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 16.w),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 159.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: HomeCubit.get(context)
                                              .homeModel[index]
                                              .image!,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          height: 100.h,
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        CustomText(
                                          text: HomeCubit.get(context)
                                              .homeModel[index]
                                              .title!,
                                          fontSize: 14.sp,
                                          color: AppColor.fontColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        CustomText(
                                          text:
                                              "\$ ${HomeCubit.get(context).homeModel[index].price.toString()}",
                                          fontSize: 16.sp,
                                          color: AppColor.importFontColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator())),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 38.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: CustomText(
                        text: "Categories",
                        fontSize: 18.sp,
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 16.h),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/png/img_7.png"),
                          width: 80.w,
                          height: 40.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Image(
                          image: AssetImage("assets/png/img_8.png"),
                          width: 114.w,
                          height: 40.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Image(
                          image: AssetImage("assets/png/img_9.png"),
                          width: 114.w,
                          height: 40.h,
                        ),
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
                ConditionalBuilder(
                  condition: context.watch<HomeCubit>().homeModel.isNotEmpty,
                  builder: (context) => SliverPadding(padding:EdgeInsets.only(left: 20.w,right: 14.w) ,
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (c) {
                             return DetailProductScreen(id:  HomeCubit.get(context).homeModel[index].id.toString()

                             //7.toString()
                             );
                            },));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                // width: 131.w,
                                // height: 123.h,
                                // NetworkImage(HomeCubit.get(context)
                                //     .homeModel[index]
                                //     .image),
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl: HomeCubit.get(context)
                                        .homeModel[index]
                                        .image!,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    height: 123.h,
                                    width: 131.w,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                CustomText(
                                  text:HomeCubit.get(context)
                                      .homeModel[index]
                                      .title!.toLowerCase(),
                                  fontSize: 14.sp,
                                  color: AppColor.fontColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                CustomText(
                                  text:
                                      "\$${HomeCubit.get(context).homeModel[index].price.toString()}",
                                  fontSize: 16.sp,
                                  color: AppColor.importFontColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                        childCount: HomeCubit.get(context).homeModel.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24.h, //vertical
                          mainAxisSpacing: 16.w, //horizontal
                          childAspectRatio: 159.w / 215.h //(width/height)

                          //vertical
                          ),
                    ),
                  ),
                  fallback: (context) => SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator())),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
