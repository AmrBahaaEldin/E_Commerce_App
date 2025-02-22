import 'package:e_commerce_app/features/login/presentation/widget/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/payment/presentation/payment_method_screen.dart';



void main() {

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
      // Use builder only if you need to use library outside ScreenUtilInit context


    );
  }
}
