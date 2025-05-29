import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/components/custom_shimmer_details.dart';
import '../../../core/constants/color_manger.dart';

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
                  return const CustomShimmerDetails();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
