import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/textStyels.dart';

class PackageText extends StatelessWidget {
  final String title;
  PackageText({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 16,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.left,
          style: style16White,
        ),
      ],
    );
  }
}
