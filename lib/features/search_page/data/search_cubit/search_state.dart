part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchFailuer extends SearchState {
  final String errorMassage;

  const SearchFailuer(this.errorMassage);
}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Articles> news;

  const SearchSuccess(this.news);
}
