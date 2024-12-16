import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/widget/color_manger.dart';
import 'package:news_app/core/utils/widget/custom_error_massage.dart';
import 'package:news_app/features/presentation/home/data/manger/featch_home_slider/featch_home_slider_cubit.dart';
import 'package:news_app/features/presentation/shimmer/view/shimmer_home_tabs.dart';
import 'package:news_app/features/presentation/tabs/screens/card_details_screen.dart';
import 'package:news_app/features/presentation/tabs/widgets/switch_widget.dart';

import 'screens/future_programming_screen.dart';
import 'widgets/carousel_slider_widget.dart';
import 'widgets/future_programming_widget.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});
  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

int carouselSliderIndix = 0;

class _HomeTabsState extends State<HomeTabs> {
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
                    const SwitchWidget(),
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
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CardDetails(
                            article: state.news[index],
                          ),
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
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FutureProgrammingScreen(),
                        ),
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
          return const ShimmerHomeTabs();
        }
      },
    );
  }
}
