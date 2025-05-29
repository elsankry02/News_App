import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_switch.dart';
import '../../../../core/services/api_service.dart';
import '../../data/search_cubit/search_cubit.dart';
import '../widget/search_container_text.dart';
import '../widget/search_result_widget.dart';
import '../widget/text_filed_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final theme = Theme.of(context);
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(
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
                const CustomSwitch(),
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
            const SearchContanierText(),
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
