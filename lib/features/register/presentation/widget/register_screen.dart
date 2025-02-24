// import 'package:e_commerce_app/features/register/logic/register_cubit.dart';
// import 'package:e_commerce_app/features/register/logic/register_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// import '../../../../core/constants/app_color.dart';
// import '../../../../core/constants/app_image.dart';
// import '../../../../core/widgets/custom_sign_log.dart';
// import '../../../../core/widgets/custom_line_continous.dart';
// import '../../../../core/widgets/custom_text.dart';
// import '../../../../core/widgets/custom_text_button.dart';
// import '../../../../core/widgets/custom_text_field.dart';
// import '../../../login/presentation/widget/login_screen.dart';
//
// class RegisterScreen extends StatelessWidget {
//    RegisterScreen({super.key});
//  var formKey = GlobalKey<FormState>();
//  final TextEditingController emailController = TextEditingController();
//  final TextEditingController password_1Controller = TextEditingController();
//  final TextEditingController password_2Controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//   create: (context) => RegisterCubit(),
//   child: Scaffold(
//       appBar: AppBar(),
//       body: BlocConsumer<RegisterCubit, RegisterState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   builder: (context, state) {
//
//
//     return Form(
//       child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Container(
//             padding: EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(context).viewInsets.bottom
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Create Your new \n account",
//                   style: GoogleFonts.plusJakartaSans(
//                     fontSize: 28.sp,
//                     fontWeight: FontWeight.w600,
//                     color: AppColor.fontColor,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 32.h,
//                 ),
//                 CustomTextField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter your email";
//
//                     }
//                     return null;
//                   },
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   hintText: "Email address",
//                   labelText: "Email",
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 CustomTextField(
//                   validator: (value) {
//                     if(value! .isEmpty){
//                       return "Please enter your password";
//                     }
//                     return null;
//                   },
//                     isHidden: context.read<RegisterCubit>().isHide,
//                   controller: password_1Controller,
//                     keyboardType: TextInputType.visiblePassword,
//                     hintText: "Password",
//                     labelText: "Password",
//                     ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 CustomTextField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter your password";
//                     }
//                     return null;
//                   },
//                   isHidden: context.read<RegisterCubit>().isHide,
//                   controller: password_2Controller,
//                     keyboardType: TextInputType.visiblePassword,
//                     hintText: "Confirm Password",
//                     labelText: "Password",
//                   suffixIcon: context.read<RegisterCubit>().isHide
//                       ? GestureDetector(
//                       onTap: () {
//                         context.read<RegisterCubit>().setHide();
//                       },
//                       child: Icon(Icons.visibility_outlined))
//                       : GestureDetector(
//                       onTap: () {
//                         context.read<RegisterCubit>().setHide();
//                       },
//                       child: Icon(Icons.visibility_off_outlined)),),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 CustomTextButton(label: "Register",onTap: () {
//                   if ( formKey.currentState!.validate()) {
//                     if(password_1Controller.text == password_2Controller.text){
//                       context.read<RegisterCubit>().setRegister(emailController.text, password_1Controller.text);
//                     }
//
//
//                   }
//                 },),
//                 SizedBox(height:  24.h),
//                 CustomLineContinous(),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 CustomSignLog(
//                   textLogo: "Continue with google",
//                   imageLogo: AppImage.logoGoogle,
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 CustomSignLog(
//                   textLogo: "Continue with facebook",
//                   imageLogo: AppImage.logoFaceBook,
//                 ),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have an account?",
//                       style: GoogleFonts.plusJakartaSans(
//                         color: AppColor.subFontColor,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//                           return LoginScreen();
//                         },));
//                       },
//                       child: CustomText(
//
//                         text: "Login",
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: AppColor.importFontColor,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//     );
//   },
// ),
//     ),
// );
//   }
// }
