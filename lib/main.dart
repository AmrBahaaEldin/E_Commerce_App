import 'package:e_commerce_app/core/constants/bloc_observer.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/new_api.dart';
import 'package:e_commerce_app/features/home/presentation/widget/home_screen.dart';
import 'package:e_commerce_app/features/home/presentation/widget/notification_screen.dart';
import 'package:e_commerce_app/features/login/presentation/widget/login_screen.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:e_commerce_app/features/register/presentation/widget/register_screen.dart';
import 'package:e_commerce_app/features/search/presentation/search_screen.dart';
import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/order/presentation/order_success.dart';
import 'features/payment/presentation/payment_method_screen.dart';
import 'features/privacy/presentation/widget/privcy_screen.dart';



void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  NewApi.init();
  runApp(const ZaladaApp());
}

class ZaladaApp extends StatelessWidget {
  const ZaladaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),


    );
  }
}
