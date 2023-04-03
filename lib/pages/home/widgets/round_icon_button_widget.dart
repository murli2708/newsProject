import 'package:basic_news_app/constants/appColors.dart';
import 'package:flutter/material.dart';

class RoundIconButtonWidget extends StatelessWidget {
  const RoundIconButtonWidget({
    super.key,
    required this.iconColor,
    required this.iconWidth,
    required this.iconHeight,
    required this.borderColor,
    this.onTap,
    required this.iconName,
  });

  final Color borderColor;
  final String iconName;

  final Color iconColor;
  final double iconWidth;
  final double iconHeight;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.borderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            iconName,
            width: iconWidth,
            height: iconHeight,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
