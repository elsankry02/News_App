part of 'global_tebs_cubit.dart';

@immutable
sealed class FeatchGlobalTebsState {}

final class FeatchGlobalTebsInitial extends FeatchGlobalTebsState {}

final class FeatchGlobalTebsLoading extends FeatchGlobalTebsState {}

final class FeatchGlobalTebsSuccsses extends FeatchGlobalTebsState {
  final List<Articles> news;

  FeatchGlobalTebsSuccsses(this.news);
}

final class FeatchGlobalTebsFaliuer extends FeatchGlobalTebsState {
  final String errorMassge;

  FeatchGlobalTebsFaliuer(this.errorMassge);
}
