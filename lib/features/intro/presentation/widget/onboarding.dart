import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:e_commerce_app/core/db/cache/cache.dart';
import 'package:e_commerce_app/features/intro/logic/intro_cubit.dart';
import 'package:e_commerce_app/features/intro/logic/intro_state.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_color.dart';
import '../../../login/presentation/widget/login_screen.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../../../profile/logic/profile_state.dart';
import '../../data/introModel.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                checkCache(context);
              },
              child: Text(
                "Skip",
              ),
            ),
          ],
        ),
        body: BlocBuilder<IntroCubit, IntroState>(
          builder: (T, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 299.w,
                        height: 299.h,
                        child: SvgPicture.asset(
                          introductionBoarding[T.read<IntroCubit>().index]
                              .image,
                        )),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    introductionBoarding[T.read<IntroCubit>().index].title,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColor.fontColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    introductionBoarding[T.read<IntroCubit>().index].subTitle,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColor.subFontColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 94.w,
                          height: 94.h,
                          child: CircleProgressBar(
                            value: T.read<IntroCubit>().changeValuePage(),
                            strokeWidth: 3.w,
                            backgroundColor: Colors.grey.withValues(alpha: .08),
                            foregroundColor: AppColor.buttonColor,
                          ),
                        ),
                        Container(
                          height: 62.h,
                          width: 62.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(84.r),
                            color: AppColor.buttonColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              T.read<IntroCubit>().changePage(context);
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            iconSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }


}
void checkCache(BuildContext context) {
  CacheHelper.getData(key: 'token') != null
      ? Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutScreen(),
      ),
          (route) => false)
      : Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
          (route) => false);
}