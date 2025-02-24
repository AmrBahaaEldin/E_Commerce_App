import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:meta/meta.dart';



class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
}
