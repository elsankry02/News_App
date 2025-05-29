import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home_page/data/change_theme_cubit/change_theme_cubit.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.black,
        activeTrackColor: Colors.amber,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.blue,
        value: BlocProvider.of<ChangeThemeCubit>(context).getTheme() ?? false,
        onChanged: (value) async {
          await BlocProvider.of<ChangeThemeCubit>(context)
              .setTheme(value: value);
          setState(() {});
        });
  }
}
