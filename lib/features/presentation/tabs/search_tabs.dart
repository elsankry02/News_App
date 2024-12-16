import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/api_service.dart';
import 'package:news_app/features/presentation/home/data/manger/featch_search_tabs/featch_search_tabs_cubit.dart';
import 'package:news_app/features/presentation/tabs/widgets/switch_widget.dart';

import 'widgets/search_result_widget.dart';
import 'widgets/search_tabs_widget.dart';
import 'widgets/text_filed_widget.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final theme = Theme.of(context);
    return BlocProvider<FetchSearchTebsCubit>(
      create: (context) => FetchSearchTebsCubit(
        ApiService(Dio()),
      )..fetchSearch(category: 'business'),
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor),
                ),
                const SwitchWidget(),
              ],
            ),
            const Text(
              'News from all around the world ',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFiledWidget(),
            const SizedBox(
              height: 20,
            ),
            const SearchTabsWidget(),
            const SizedBox(
              height: 20,
            ),
            const SearchResultWidget(),
          ],
        ),
      ),
    );
  }
}
