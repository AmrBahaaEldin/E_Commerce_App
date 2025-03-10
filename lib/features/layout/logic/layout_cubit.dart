
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/layout/logic/layout_state.dart';

class BottomNavigatorBarCubit extends Cubit<BottomNavigatorBarState> {

  BottomNavigatorBarCubit() : super(BottomNavigatorBarChanges(0, 'Home'));

  void getNavBarItem(String navBarItem) {
    switch (navBarItem) {
      case 'Home':
        emit(BottomNavigatorBarChanges(0, 'Home'));
        break;
      case 'Search':
        emit(BottomNavigatorBarChanges(1, 'Search'));
        break;
      case 'Wishlist':
        emit(BottomNavigatorBarChanges(2, 'Wishlist'));
        break;
      case 'Cart':
        emit(BottomNavigatorBarChanges(3, 'Cart'));
        break;
      case 'Profile':
        emit(BottomNavigatorBarChanges(4, 'Profile'));
        break;
    }
  }
}