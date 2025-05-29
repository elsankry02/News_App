part of 'home_slider_cubit.dart';

sealed class HomeSliderState extends Equatable {
  const HomeSliderState();

  @override
  List<Object> get props => [];
}

final class HomeSliderInitial extends HomeSliderState {}

final class HomeSliderLodaing extends HomeSliderState {}

final class HomeSliderFailuer extends HomeSliderState {
  final String errorMassge;

  const HomeSliderFailuer(this.errorMassge);
}

final class HomeSliderSuccess extends HomeSliderState {
  final List<Articles> news;

  const HomeSliderSuccess(this.news);
}
