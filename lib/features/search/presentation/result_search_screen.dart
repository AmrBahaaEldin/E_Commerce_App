import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/search/logic/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/widget/categories_gird_view.dart';
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
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Search laptop, headset..',
                                hintStyle: GoogleFonts.plusJakartaSans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.50.h,
                                    color: AppColor.subFontColor),
                                prefixIcon: const Icon(
                                  CupertinoIcons.search,
                                  color: AppColor.fontColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(34.r),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(34.r),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.yellow),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(34.r),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.red),
                                ),
                              ),
                              onChanged: (query) {
                                queryString = query;
                                innerContext
                                    .read<SearchCubit>()
                                    .searchProducts(query);
                              },
                            ),
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
                              child: Text(
                                'No products found',
                                style: GoogleFonts.plusJakartaSans(
                                    color: AppColor.subFontColor,
                                    fontSize: 18.sp),
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
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.r),
            ),
            backgroundColor: AppColor.buttonColor,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                        width: 375.w,
                        height: 308.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.r),
                              topRight: Radius.circular(24.r),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 66.67,
                                  height: 4,
                                  decoration: ShapeDecoration(
                                    color: Colors.black
                                        .withValues(alpha: 0.20000000298023224),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Filter',
                                    style: GoogleFonts.plusJakartaSans(
                                      color: AppColor.fontColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.44.h,
                                    ),
                                  ),
                                  Text(
                                    'Reset',
                                    style: GoogleFonts.plusJakartaSans(
                                      color: AppColor.importFontColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.43.h,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 48.h,
                              ),
                              Text(
                                'Price Range',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppColor.fontColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.44.h,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              PriceRangeSlider(),
                              SizedBox(
                                height: 24.h,
                              ),
                              CustomTextButton(
                                onTap: () {},
                                label: 'Apply filter',
                              )
                            ],
                          ),
                        ));
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
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
