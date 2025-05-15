import 'package:flutter/material.dart';
import '../../../constants/color_manger.dart';
import '../../../components/custom_shimmer_details.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGlobal extends StatelessWidget {
  const ShimmerGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 40),
      child: Shimmer.fromColors(
        baseColor: ColorManger.kMaterialWhiteColor,
        highlightColor: Colors.grey,
        period: const Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
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
      ),
    );
  }
}
