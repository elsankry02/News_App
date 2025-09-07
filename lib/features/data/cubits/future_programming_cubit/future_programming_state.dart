part of 'future_programming_cubit.dart';

sealed class FutureProgrammingState extends Equatable {
  const FutureProgrammingState();

  @override
  List<Object> get props => [];
}

final class FutureProgrammingInitial extends FutureProgrammingState {}

final class FutureProgrammingSuccess extends FutureProgrammingState {
  final List<Articles> news;

  const FutureProgrammingSuccess(this.news);
}

final class FutureProgrammingFailuer extends FutureProgrammingState {
  final String errorMassge;

  const FutureProgrammingFailuer(this.errorMassge);
}

final class FutureProgrammingLoading extends FutureProgrammingState {}
