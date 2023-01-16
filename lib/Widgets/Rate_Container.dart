import 'package:flutter/material.dart';
import 'package:travel/Widgets/app_text.dart';
import 'package:travel/misc/colors.dart';

class RateStars extends StatefulWidget {
  const RateStars({super.key});

  @override
  State<RateStars> createState() => _RateStarsState();
}

class _RateStarsState extends State<RateStars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        ((index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: AppText(
                text: index.toString(),
                size: 18,
                color: AppColors.bigTextColor,
              ),
            ),
          );
        }),
      ),
    );
  }
}
