part of 'future_programming_cubit.dart';

sealed class FeatchFutureProgrammingState extends Equatable {
  const FeatchFutureProgrammingState();

  @override
  List<Object> get props => [];
}

final class FeatchRecommendationInitial extends FeatchFutureProgrammingState {}

final class FeatchFutureProgrammingSuccess
    extends FeatchFutureProgrammingState {
  final List<Articles> news;

  const FeatchFutureProgrammingSuccess(this.news);
}

final class FeatchFutureProgrammingFailuer
    extends FeatchFutureProgrammingState {
  final String errorMassge;

  const FeatchFutureProgrammingFailuer(this.errorMassge);
}

final class FeatchFutureProgrammingLoading
    extends FeatchFutureProgrammingState {}
