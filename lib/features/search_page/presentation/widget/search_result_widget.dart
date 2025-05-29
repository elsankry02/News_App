import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_error_massage.dart';
import '../../../card_page/presentation/view/card_page.dart';
import '../../data/search_cubit/search_cubit.dart';
import '../../card_details_shimmer/card_details_shimmer.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CardPage(
                    article: state.news[index],
                  ),
                );
              },
            ),
          );
        } else if (state is SearchFailuer) {
          return CustomErrorMassage(errorMessage: state.errorMassage);
        } else {
          return const Expanded(
            child: CardDetailsShimmer(),
          );
        }
      },
    );
  }
}
