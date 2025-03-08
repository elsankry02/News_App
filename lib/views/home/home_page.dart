import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/color_manger.dart';
import 'package:news_app/core/components/custom_error_massage.dart';
import 'package:news_app/core/components/custom_switch.dart';
import 'package:news_app/core/router/router.dart';
import 'package:news_app/manger/featch_home_slider/featch_home_slider_cubit.dart';
import 'package:news_app/views/home/shimmer/shimmer_home.dart';

import '../future_programming/widget/future_programming_widget.dart';
import 'widget/carousel_slider_widget.dart';

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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return BlocBuilder<FeatchHomeSliderCubit, FeatchHomeSliderState>(
      builder: (context, state) {
        if (state is FeatchHomeSliderSuccess) {
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
                SizedBox(
                  height: 30,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          state.news.length > 10 ? 10 : state.news.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 10),
                          height: 6,
                          width: index == carouselSliderIndix ? 6 : 3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == carouselSliderIndix
                                ? theme.primaryColor
                                : ColorManger.kgrey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
        } else if (state is FeatchHomeSliderFailuer) {
          return CustomErrorMassage(errorMessage: state.errorMassge);
        } else {
          return const ShimmerHome();
        }
      },
    );
  }
}
