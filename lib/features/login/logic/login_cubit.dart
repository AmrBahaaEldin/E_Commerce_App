import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../../core/network/dio_helper.dart';
import '../../../core/network/endpoints.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
 bool isHide=false;
  void setHide(){
   isHide=!isHide;
   emit(LoginHidePassword());
 }
  Future <void> userLogin(String userName, String password)async{
   emit(LoginLoading());
    try{

    Response response= await ZaladaService(dio: Dio()).postData(url: Endpoints.baseUrl , data:
        {
          "username": userName,
          "password": password,
        }
      );
    if (response.statusCode==200) {
      emit(LoginSuccess());
    }


    }
    catch(e){

   emit(LoginError(error: e.toString()));
    }

  }
}
