import 'package:flutter/material.dart';
import '../../../../core/constants/color_manger.dart';
import '../../../data/model/news_models.dart';
import '../view/home_page.dart';

class GeneratorWidget extends StatelessWidget {
  const GeneratorWidget({
    super.key,
    required this.theme,
    required this.state,
    required this.news,
  });
  final dynamic state;
  final ThemeData theme;

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          state.news.length > 10 ? 10 : state.news.length,
          (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 6,
              width: carouselSliderIndix == index ? 20 : 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: carouselSliderIndix == index
                    ? theme.primaryColor
                    : ColorManger.kgrey,
              ),
            );
          },
        ),
      ],
    );
  }
}
