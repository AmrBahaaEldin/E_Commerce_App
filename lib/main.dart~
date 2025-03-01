import 'package:e_commerce_app/core/constants/bloc_observer.dart';
import 'package:e_commerce_app/core/db/cache/cache.dart';
import 'package:e_commerce_app/core/db/db_local/db_local_helper.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/new_api.dart';
import 'package:e_commerce_app/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce_app/features/home/presentation/detail_product_screen.dart';
import 'package:e_commerce_app/features/intro/presentation/widget/onboarding.dart';

import 'package:e_commerce_app/features/intro/presentation/widget/splash_screen.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:e_commerce_app/features/login/presentation/widget/login_screen.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:e_commerce_app/features/order/presentation/select_address_screen.dart';
import 'package:e_commerce_app/features/order/presentation/select_payment_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/widget/edit_profile_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/widget/profile_screen.dart';
import 'package:e_commerce_app/features/register/presentation/widget/register_screen.dart';
import 'package:e_commerce_app/features/search/presentation/search_screen.dart';
import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
import 'package:e_commerce_app/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/order/presentation/order_success.dart';
import 'features/payment/presentation/payment_method_screen.dart';
import 'features/privacy/presentation/widget/privcy_screen.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await SQLHelper.initDb();
  NewApi.init();
  await CacheHelper.init();
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
        home: LayoutScreen(),
      ),


    );
  }
}
