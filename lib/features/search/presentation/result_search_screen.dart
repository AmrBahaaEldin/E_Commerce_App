import 'dart:ui';

import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/search/logic/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/widget/categories_gird_view.dart';
import 'package:e_commerce_app/features/search/presentation/widget/custom_Search.dart';
import 'package:e_commerce_app/features/search/presentation/widget/price_range_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;

  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController(text: query);
    String queryString = query;
    return BlocProvider(
      create: (context) => SearchCubit()..getProducts(searchQuery: query),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Builder(
                builder: (BuildContext innerContext) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFEAEAEA)),
                                  borderRadius: BorderRadius.circular(34),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppColor.fontColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 283.w,
                            height: 56.h,
                            child: CustomSearch(),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (state is SearchSuccess &&
                              state.searchedProducts.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No products found',
                                    style: GoogleFonts.plusJakartaSans(
                                        color: AppColor.subFontColor,
                                        fontSize: 18.sp),
                                  ),
                                ],
                              ),
                            );
                          }
                          if (state is SearchSuccess) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Result for "${queryString}"',
                                      style: GoogleFonts.plusJakartaSans(
                                        color: AppColor.subFontColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.43.h,
                                      ),
                                    ),
                                    Text(
                                      '${state.searchedProducts.length} founds',
                                      style: GoogleFonts.plusJakartaSans(
                                        color: AppColor.importFontColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.43.h,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                CategoriesGridView(
                                  products: state.searchedProducts,
                                ),
                              ],
                            );
                          }
                          return CategoriesGridView(
                            products: context.read<SearchCubit>().products,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 119.w,
          height: 52.h,
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
                backgroundColor: AppColor.buttonColor,
                onPressed: () {
                  final searchCubit = context.read<SearchCubit>();
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BlocProvider.value(
                          value: searchCubit,
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: PriceRangeSlider()),
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Filter',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.50.h,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
