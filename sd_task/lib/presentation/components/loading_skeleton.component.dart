import 'package:flutter/material.dart';
import 'package:sd_task/core/custom_colors.core.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: CustomColors.mediumGray,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
