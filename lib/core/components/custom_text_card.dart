import 'package:flutter/material.dart';

class CustomCardDetailsTabs extends StatelessWidget {
  const CustomCardDetailsTabs(
      {super.key,
      required this.text,
      required this.colorText,
      required this.colorTybe});
  final String text;
  final Color colorText;
  final Color colorTybe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: colorTybe,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
