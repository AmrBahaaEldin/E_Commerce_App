//
// import 'package:dio/dio.dart';
// import 'package:e_commerce_app/core/network/dio_helper.dart';
// import 'package:e_commerce_app/core/network/endpoints.dart';
// import 'package:e_commerce_app/features/register/logic/register_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//   bool isHide = false;
//
//   void setHide() {
//     isHide = !isHide;
//     emit(RegisterHide());
//   }
//
//   void setRegister(userName, password) {
//     emit(RegisterLoading());
//     try {
//       ZaladaService(dio: Dio()).postData(
//           url: "${Endpoints.baseUrl}+${Endpoints.signUpEndPoint}",
//           queryParameters: {
//             "username": userName,
//             "password": password,
//           }, );
//     } catch (e) {
//       emit(RegisterError(error: e.toString()));
//     }
//   }
// }
