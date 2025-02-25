import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'layout_state.dart';


class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeScreenLayout());
  }
}
