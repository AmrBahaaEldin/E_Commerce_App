part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}


final class SearchLoading extends SearchState {}



final class SearchSuccess extends SearchState {
  final List<HomeModel> searchedProducts;
  SearchSuccess({required this.searchedProducts});
}

final class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}