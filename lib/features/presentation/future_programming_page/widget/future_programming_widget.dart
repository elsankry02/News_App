import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/custom_error_massage.dart';
import '../../card_page/card_page.dart';
import '../../../data/cubits/future_programming_cubit/future_programming_cubit.dart';
import '../../../shimmers/card_details_shimmer/card_details_shimmer.dart';

class FutureProgrammingWidget extends StatelessWidget {
  const FutureProgrammingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FutureProgrammingCubit, FutureProgrammingState>(
      builder: (context, state) {
        if (state is FutureProgrammingSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CardPage(article: state.news[index]),
                );
              },
            ),
          );
        } else if (state is FutureProgrammingFailuer) {
          return CustomErrorMassage(errorMessage: state.errorMassge);
        } else {
          return const Expanded(child: CardDetailsShimmer());
        }
      },
    );
  }
}
