// import 'package:e_commerce_app/core/constants/app_color.dart';
// import 'package:e_commerce_app/core/widgets/custom_text.dart';
// import 'package:e_commerce_app/features/home/logic/home_cubit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class WishlistScreen extends StatelessWidget {
//   const WishlistScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(
//           text: "Your Wishlist",
//           color: AppColor.fontColor,
//           fontWeight: FontWeight.w600,
//           fontSize: 24.sp,
//         ),
//
//       ),
//       body: Padding(
//         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//         child: CustomScrollView(
//           slivers: [
//
//             SliverGrid(
//               delegate: SliverChildBuilderDelegate(
//                     (context, index) =>
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12.w),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.r),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         children: [
//                           Image(
//                             width: 131.w,
//                             height: 123.h,
//                             image: AssetImage(mode[index].image!),
//                           ),
//                           SizedBox(
//                             height: 4.h,
//                           ),
//                           CustomText(
//                             text: favoriteProducts[index].title!,
//                             fontSize: 14.sp,
//                             color: AppColor.fontColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           SizedBox(
//                             height: 4.h,
//                           ),
//                           CustomText(
//                             text: "\$ ${favoriteProducts[index].price}",
//                             fontSize: 16.sp,
//                             color: AppColor.importFontColor,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ],
//                       ),
//                     ),
//                 childCount: favoriteProducts.length,
//               ),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 24.h, //vertical
//                   mainAxisSpacing: 16.w, //horizontal
//                   childAspectRatio: 159.w / 215.h //(weidth/height)
//
//                 //vertical
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
