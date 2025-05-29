import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_text_card.dart';
import '../../../../core/constants/color_manger.dart';
import '../../data/search_cubit/search_cubit.dart';

class SearchContanierText extends StatefulWidget {
  const SearchContanierText({super.key});

  @override
  State<SearchContanierText> createState() => _SearchContanierTextState();
}

class _SearchContanierTextState extends State<SearchContanierText> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return buildCategoryItems(context, index: index);
        },
      ),
    );
  }

  buildCategoryItems(BuildContext context, {required index}) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        if (currentIndex != index) {
          setState(
            () {
              currentIndex = index;
              BlocProvider.of<SearchCubit>(context).fetchSearch(
                category: tabs[index],
              );
            },
          );
        }
      },
      child: CustomCardDetailsTabs(
        text: tabs[index],
        colorText: currentIndex == index ? Colors.white : Colors.grey,
        colorTybe:
            currentIndex == index ? theme.primaryColor : ColorManger.klightGrey,
      ),
    );
  }

  final List tabs = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sport',
    'technology',
  ];
}
