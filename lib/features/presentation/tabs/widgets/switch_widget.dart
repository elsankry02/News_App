import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/home/data/manger/set_data/set_data_cubit.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.black,
        activeTrackColor: Colors.amber,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.blue,
        value: BlocProvider.of<SetDataCubit>(context).getData() ?? false,
        onChanged: (value) async {
          await BlocProvider.of<SetDataCubit>(context)
              .upDateTheme(value: value);
          setState(() {});
        });
  }
}
