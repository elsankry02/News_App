import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constants/image_manger.dart';
import 'package:news_app/views/data/models/news_models.dart';

import '../../../../core/components/custom_shimmer.dart';

class CarouselSliderWidget extends StatelessWidget {
  final Articles articles;

  const CarouselSliderWidget({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? ImageManger.kErrorImage,
              fit: BoxFit.fill,
              placeholder: (context, url) => const CustomShimmer(),
              errorWidget: (context, url, error) =>
                  Image.asset(ImageManger.kErrorImage),
            ),
          ),
        );
      },
    );
  }
}
