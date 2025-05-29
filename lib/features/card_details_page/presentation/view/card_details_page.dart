import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/components/custom_shimmer.dart';
import '../../../../core/constants/color_manger.dart';
import '../../../../core/constants/image_manger.dart';
import '../../../../core/components/custom_date_formate.dart';
import '../../../home_page/data/model/news_models.dart';

@RoutePage()
class CardDetailsPage extends StatelessWidget {
  const CardDetailsPage({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: theme.primaryColor),
        ),
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () => context.router.maybePop(),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => const CustomShimmer(),
                  errorWidget: (context, url, error) => Image.asset(
                    ImageManger.kErrorImage,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: theme.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  article.source!.name!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorManger.kgrey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.description!,
              style: const TextStyle(fontSize: 15),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  formatDate(article.publishedAt!),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManger.kgrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
