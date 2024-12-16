import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/widget/color_manger.dart';
import 'package:news_app/core/utils/widget/custom_shimmer.dart';
import 'package:news_app/features/presentation/home/data/models/news_models.dart';
import 'package:news_app/features/presentation/tabs/screens/card_details_screen.dart';

import 'icon_and_date.dart';

class CardDetailsWidget extends StatelessWidget {
  const CardDetailsWidget({super.key, required this.article});
  final Articles article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CardDetails(
          article: article,
        ),
      )),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 120,
              width: 120,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) => const CustomShimmer(),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/error_image.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.source!.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManger.kgrey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.description!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                IconAndDate(
                  date: article.publishedAt!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
