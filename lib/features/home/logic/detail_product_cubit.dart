

import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:e_commerce_app/features/home/data/detail_product_model.dart';
import 'package:e_commerce_app/features/home/data/home_model.dart';
import 'package:e_commerce_app/features/home/logic/detail_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailProductCubit extends Cubit<DetailProductState> {
  DetailProductCubit() : super(DetailProductInitial());
  static DetailProductCubit get(context) => BlocProvider.of(context);
  DetailProductModel? detailProductModel;
 List<ViewProduct> viewProducts=[];

  Future<void> getDetailProduct(String id) async {
    emit(DetailProductLoading());
    try {
      Response response = await DioHelper.getData(url: '/products/$id');
      if (response.statusCode == 200 && response.data != null) {
        detailProductModel = DetailProductModel.formJson(response.data);
        emit(DetailProductLoaded(detailProduct: detailProductModel!));
      } else {
        emit(DetailProductError(error: "Failed to fetch product details"));
      }
    } catch (e) {
      emit(DetailProductError(error: e.toString()));
    }
  }
  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      Response response = await DioHelper.getData(url: Endpoints.productsEndpoint);
      if (response.statusCode == 200 && response.data is List) {
        viewProducts = (response.data as List)
            .map((e) => ViewProduct.fromJson(e))
            .toList();

        emit(ProductsLoaded(viewProducts: viewProducts));
      } else {
        emit(ProductsError(error: "Failed to fetch products list"));
      }
    } catch (e) {
      emit(ProductsError(error: e.toString()));
    }
  }

  Future<void> getAllDetailProductAndProducts({required String id}) async {
    emit(DetailProductLoading());
    try {
      await
      Future.wait([
        getDetailProduct(id),
        getProducts(),
      ]);
      emit(DetailProductLoaded());
    } catch (e) {
      emit(DetailProductError(error: e.toString()));
    }
  }
}
