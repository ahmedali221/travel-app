// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  Color color;
  AppText({
    Key? key,
    this.size = 14,
    required this.text,
    this.color = AppColors.textColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
