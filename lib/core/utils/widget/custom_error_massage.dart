import 'package:flutter/material.dart';

class CustomErrorMassage extends StatelessWidget {
  const CustomErrorMassage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errorMessage,
      style: const TextStyle(fontSize: 20),
    ));
  }
}
