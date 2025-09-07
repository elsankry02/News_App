part of 'global_cubit.dart';

abstract class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class GlobalLoading extends GlobalState {}

final class GlobalSuccsses extends GlobalState {
  final List<Articles> news;

  GlobalSuccsses(this.news);
}

final class GlobalFaliuer extends GlobalState {
  final String errorMassge;

  GlobalFaliuer(this.errorMassge);
}
