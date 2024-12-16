import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/api_service.dart';
import 'package:news_app/core/utils/widget/custom_error_massage.dart';
import 'package:news_app/features/presentation/home/data/manger/featch_global_tebs/global_tebs_cubit.dart';
import 'package:news_app/features/presentation/shimmer/view/shimmer_global_tabs.dart';
import 'package:news_app/features/presentation/tabs/widgets/switch_widget.dart';

import 'widgets/card_details_widget.dart';

class GlobalTabs extends StatelessWidget {
  const GlobalTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (BuildContext context) {
        return FeatchGlobalTebsCubit(
          ApiService(
            Dio(),
          ),
        )..featchGlobalTebs();
      },
      child: BlocBuilder<FeatchGlobalTebsCubit, FeatchGlobalTebsState>(
        builder: (context, state) {
          if (state is FeatchGlobalTebsSuccsses) {
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
                      const SwitchWidget()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CardDetailsWidget(
                            article: state.news[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FeatchGlobalTebsFaliuer) {
            return CustomErrorMassage(
              errorMessage: state.errorMassge,
            );
          } else {
            return const ShimmerGlobalTabs();
          }
        },
      ),
    );
  }
}
