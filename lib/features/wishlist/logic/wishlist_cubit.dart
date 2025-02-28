
import 'package:e_commerce_app/core/db/db_local/db_local_helper.dart';
import 'package:e_commerce_app/features/wishlist/data/favourite_model.dart';
import 'package:e_commerce_app/features/wishlist/logic/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  static FavouriteCubit get(context) => BlocProvider.of(context);
  List<FavouriteModel> favouriteProduct = [];
  bool isFavourite=false;
  Future<void> getFavouriteData() async {
    isFavourite=! isFavourite;
    emit(FavouriteLoading());
    try {

      await SQLHelper.get1().then((value) {
        favouriteProduct = value.map((e) => FavouriteModel.fromJson(e)).toList();});
      emit(FavouriteLoaded());
    }
    catch (e) {
      print("_______________${e.toString()}+++++++++++++");
      emit(FavouriteError(e.toString()));
    }
  }
  Future<void>deleteFavouriteProduct(String id)async{
    try{
      emit(FavouriteLoading());
      await SQLHelper.delete1(id);
      await getFavouriteData();
      if (favouriteProduct.isEmpty) {
        emit(FavouriteProductCartEmpty());
      } else {
        emit(FavouriteProductDeleted());
      }



    }catch(e){
      print(e.toString());
      emit(FavouriteError(e.toString()));

    }

  }

}
