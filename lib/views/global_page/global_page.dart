import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/news_provider/news_provider.dart';

import '../../core/components/custom_item_details.dart';
import '../../core/components/custom_switch.dart';
import 'shimmer/shimmer_global.dart';

class GlobalPage extends ConsumerWidget {
  const GlobalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider);
    final theme = Theme.of(context);
    return news.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Global News',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor),
                  ),
                  const CustomSwitch()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CustomitemsDetails(
                        article: data[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        return Center(child: Text('$error'));
      },
      loading: () {
        return const ShimmerGlobal();
      },
    );
  }
}
