import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/db/db_local/db_local_helper.dart';
import 'package:e_commerce_app/features/cart/model/card%20_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> products = [];

  Future<void> getCartData() async {
    emit(CartLoading());
    try {
      await SQLHelper.get().then((value) {
        products = value.map((e) => CartModel.fromJson(e)).toList();});
      emit(CartLoaded());
    } catch (e) {
      print("_______________${e.toString()}+++++++++++++");
      emit(CartError(e.toString()));
    }
  }
  Future<void>deleteProduct(String id)async{
    try{
      emit(CartLoading());
      await SQLHelper.delete(id);
      await getCartData();
      if (products.isEmpty) {
        emit(CartProductCartEmpty());
      } else {
        emit(CartProductDeleted());
      }



    }catch(e){
      print(e.toString());
      emit(CartError(e.toString()));

    }

  }

}
