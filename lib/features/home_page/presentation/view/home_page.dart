import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_page/data/model/news_models.dart';
import 'package:news_app/features/home_page/presentation/widget/generator_widget.dart';

import '../../../../core/components/custom_error_massage.dart';
import '../../../../core/components/custom_switch.dart';
import '../../../../core/router/router.dart';
import '../../../future_programming_page/presentation/widget/future_programming_widget.dart';
import '../../data/home_slider_cubit/home_slider_cubit.dart';
import '../../home_shimmer/home_shimmer.dart';
import '../widget/carousel_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

int carouselSliderIndix = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HomeSliderCubit, HomeSliderState>(
      builder: (context, state) {
        if (state is HomeSliderSuccess) {
          return Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Iphone News',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor),
                    ),
                    const CustomSwitch(),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.90,
                    autoPlayInterval: const Duration(seconds: 3),
                    height: 200,
                    onPageChanged: (index, reason) {
                      setState(() {
                        carouselSliderIndix = index;
                      });
                    },
                  ),
                  itemCount: state.news.length > 10 ? 10 : state.news.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () => context.router.push(
                        CardDetailsRoute(
                          article: state.news[index],
                        ),
                      ),
                      child: CarouselSliderWidget(
                        articles: state.news[index],
                      ),
                    );
                  },
                ),
                //! GeneratorWidget
                GeneratorWidget(news: Articles(), state: state, theme: theme),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Future Programming',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor),
                    ),
                    GestureDetector(
                      onTap: () => context.router.push(
                        const FutureProgrammingRoute(),
                      ),
                      child: Text(
                        'View all',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: theme.primaryColor,
                            decorationThickness: 1.5,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const FutureProgrammingWidget(),
              ],
            ),
          );
        } else if (state is HomeSliderFailuer) {
          return CustomErrorMassage(errorMessage: state.errorMassge);
        } else {
          return const HomeShimmer();
        }
      },
    );
  }
}
