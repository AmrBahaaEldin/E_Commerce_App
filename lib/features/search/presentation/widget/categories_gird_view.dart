import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/home/data/home_model.dart';
import 'package:e_commerce_app/features/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridView extends StatelessWidget {
final  List<HomeModel> products;
const  CategoriesGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    print("Products in GridView: ${products.length}");
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.w,
            crossAxisSpacing: 14.h, //vertical
            mainAxisSpacing: 16.w, //horizontal
            childAspectRatio: 159.w / 215.h //(width/height)
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, index) {
          return  Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(
                horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // width: 131.w,
                // height: 123.h,
                // NetworkImage(HomeCubit.get(context)
                //     .homeModel[index]
                //     .image),
                CachedNetworkImage(
                  imageUrl:
                 products[index].image!,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                  height: 123.h,
                  width: 131.w,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text:
                  products[index].title!,
                  fontSize: 14.sp,
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text:
                  "\$ ${products[index].price!}",
                  fontSize: 16.sp,
                  color: AppColor.importFontColor,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          );
        });
  }
}


