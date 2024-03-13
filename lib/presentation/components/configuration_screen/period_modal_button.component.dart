import 'package:flutter/material.dart';
import 'package:sd_task/core/custom_colors.core.dart';

class PeriodModalButton extends StatelessWidget {
  const PeriodModalButton({
    super.key,
    required this.text,
    required this.canClick,
    required this.canClickCallback,
    required this.errorCallback,
    required this.color,
  });

  final String text;
  final bool canClick;
  final Function canClickCallback;
  final Function errorCallback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (canClick) {
          canClickCallback();
        } else {
          errorCallback();
        }
      },
      child: Container(
        width: 89,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: CustomColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
