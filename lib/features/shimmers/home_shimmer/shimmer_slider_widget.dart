import 'package:flutter/material.dart';

class ShimmerHomeSliderWidget extends StatelessWidget {
  const ShimmerHomeSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 20,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 200,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 200,
          width: 20,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
