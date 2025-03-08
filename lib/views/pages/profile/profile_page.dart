import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/constants/image_manger.dart';

import 'widget/linkes_profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 60,
        ),
        Image.asset(
          ImageManger.kNews,
          color: theme.primaryColor,
        ),
        const SizedBox(
          height: 100,
        ),
        const LinkesProfileWidget(),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'App Version : 1.0.0',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
