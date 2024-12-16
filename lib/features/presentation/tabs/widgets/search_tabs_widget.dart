import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/widget/color_manger.dart';
import 'package:news_app/features/presentation/home/data/manger/featch_search_tabs/featch_search_tabs_cubit.dart';

import 'details_tabs_widget.dart';

class SearchTabsWidget extends StatefulWidget {
  const SearchTabsWidget({super.key});

  @override
  State<SearchTabsWidget> createState() => _SearchTabsWidgetState();
}

class _SearchTabsWidgetState extends State<SearchTabsWidget> {
  int _currentIndex = 0;

  final List tabs = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sport',
    'technology',
  ];
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
        setState(
          () {
            _currentIndex = index;
            BlocProvider.of<FetchSearchTebsCubit>(context).fetchSearch(
              category: tabs[index],
            );
          },
        );
      },
      child: DetailsTabsWidget(
        text: tabs[index],
        colorText: _currentIndex == index ? Colors.white : Colors.grey,
        colorTybe: _currentIndex == index
            ? theme.primaryColor
            : ColorManger.klightGrey,
      ),
    );
  }
}
