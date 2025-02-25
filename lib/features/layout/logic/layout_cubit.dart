import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce_app/features/home/presentation/widget/home_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/widget/profile_screen.dart';
import 'package:e_commerce_app/features/search/presentation/search_screen.dart';
import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'layout_state.dart';


class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  List<Widget>bodyScreen = [
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
   emit(ChangeScreenLayout());
  }
}
