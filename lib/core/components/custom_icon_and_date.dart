import 'package:flutter/material.dart';
import 'package:news_app/core/constants/color_manger.dart';
import 'package:news_app/core/components/custom_date_formate.dart';

class CustomIconAndDate extends StatelessWidget {
  final String date;
  const CustomIconAndDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * .59,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.account_circle_outlined,
            color: theme.primaryColor,
          ),
          Text(
            formatDate(date),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorManger.kgrey,
            ),
          ),
        ],
      ),
    );
  }
}
