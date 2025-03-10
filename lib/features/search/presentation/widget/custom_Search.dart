import 'package:e_commerce_app/features/search/logic/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/result_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (query) {
        if (query.isNotEmpty) {
          context.read<SearchCubit>()
              .searchProducts(query);
        }
      },

      onFieldSubmitted: (query) {
        if (query.isNotEmpty) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return SearchResultScreen(
                  query: query,
                );
              }));
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(CupertinoIcons.search),
        hintText: "Search laptop, headset..",
        contentPadding:
        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.grey),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(34.r),
            bottomRight: Radius.circular(34.r),
            topLeft: Radius.circular(34.r),
            topRight: Radius.circular(34.r),
          ),
        ),
      ),
    );
  }
}