part of 'featch_home_slider_cubit.dart';

sealed class FeatchHomeSliderState extends Equatable {
  const FeatchHomeSliderState();

  @override
  List<Object> get props => [];
}

final class FeatchHomeSliderInitial extends FeatchHomeSliderState {}

final class FeatchHomeSliderLodaing extends FeatchHomeSliderState {}

final class FeatchHomeSliderFailuer extends FeatchHomeSliderState {
  final String errorMassge;

  const FeatchHomeSliderFailuer(this.errorMassge);
}

final class FeatchHomeSliderSuccess extends FeatchHomeSliderState {
  final List<Articles> news;

  const FeatchHomeSliderSuccess(this.news);
}
