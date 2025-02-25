import 'package:e_commerce_app/features/home/presentation/widget/home_screen.dart';
import 'package:e_commerce_app/features/layout/logic/layout_cubit.dart';
import 'package:e_commerce_app/features/profile/presentation/widget/profile_screen.dart';
import 'package:e_commerce_app/features/search/presentation/search_screen.dart';
import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/app_color.dart';
import '../logic/layout_state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
          body: bodyScreen[context
              .read<LayoutCubit>()
              .currentIndex],

          bottomNavigationBar: (
               BottomNavigationBar(
                  onTap: (value) {
                    context.read<LayoutCubit>().changeIndex(value);
                  },
                  unselectedItemColor: AppColor.subFontColor,
                  showUnselectedLabels: true,
                  selectedItemColor: AppColor.buttonColor,
                  landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  currentIndex: context
                      .read<LayoutCubit>()
                      .currentIndex,

                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.search), label: "Browse"),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.heart), label: "Wishlist"),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.cartShopping),
                        label: "Cart"),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.user), label: "Profile"),
                  ])
          )


      );
  },
),
    );
  }
}

List<Widget>bodyScreen = [
  HomeScreen(),
  SearchScreen(),
  WishlistScreen(),
  ProfileScreen(),
  ProfileScreen(),
];
List <Widget>appBarScreen = [];