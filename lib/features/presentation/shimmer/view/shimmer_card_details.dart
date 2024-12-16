import 'package:flutter/material.dart';
import 'package:news_app/core/utils/widget/color_manger.dart';
import 'package:news_app/features/presentation/shimmer/widget/shimmer_details_widget.dart';
import 'package:shimmer/shimmer.dart';

class CardDetailsShimmer extends StatelessWidget {
  const CardDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManger.klightGrey,
      highlightColor: Colors.grey,
      period: const Duration(seconds: 2),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ShimmerDetailsWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
