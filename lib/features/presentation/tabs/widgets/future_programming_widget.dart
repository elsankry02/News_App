import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/home/data/manger/featch_future_programming/future_programming_cubit.dart';

import '../../../../../core/utils/widget/custom_error_massage.dart';
import '../../shimmer/view/shimmer_card_details.dart';
import 'card_details_widget.dart';

class FutureProgrammingWidget extends StatelessWidget {
  const FutureProgrammingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatchFutureProgrammingCubit,
        FeatchFutureProgrammingState>(
      builder: (context, state) {
        if (state is FeatchFutureProgrammingSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CardDetailsWidget(article: state.news[index]),
                );
              },
            ),
          );
        } else if (state is FeatchFutureProgrammingFailuer) {
          return CustomErrorMassage(errorMessage: state.errorMassge);
        } else {
          return const Expanded(child: CardDetailsShimmer());
        }
      },
    );
  }
}
