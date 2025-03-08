part of 'featch_search_tabs_cubit.dart';

sealed class FetchSearchTebsState extends Equatable {
  const FetchSearchTebsState();

  @override
  List<Object> get props => [];
}

final class FetchSearchTebsInitial extends FetchSearchTebsState {}

final class FetchSearchTebsFailuer extends FetchSearchTebsState {
  final String errorMassage;

  const FetchSearchTebsFailuer(this.errorMassage);
}

final class FetchSearchTebsLoading extends FetchSearchTebsState {}

final class FetchSearchTebsSuccess extends FetchSearchTebsState {
  final List<Articles> news;

  const FetchSearchTebsSuccess(this.news);
}
