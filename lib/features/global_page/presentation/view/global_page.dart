import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/components/custom_error_massage.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/global_page/data/global_cubit/global_cubit.dart';

import '../../../../core/components/custom_switch.dart';
import '../../../card_page/presentation/view/card_page.dart';
import '../../global_shimmer/global_shimmer.dart';

class GlobalPage extends StatelessWidget {
  const GlobalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (BuildContext context) {
        return GlobalCubit(
          ApiService(
            Dio(),
          ),
        )..featchGlobalTebs();
      },
      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          if (state is GlobalSuccsses) {
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
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CardPage(
                            article: state.news[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GlobalFaliuer) {
            return CustomErrorMassage(
              errorMessage: state.errorMassge,
            );
          } else {
            return const GlobalShimmer();
          }
        },
      ),
    );
  }
}
