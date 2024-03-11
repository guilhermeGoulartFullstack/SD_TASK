import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sd_task/core/custom_colors.core.dart';

class PeriodCard extends StatelessWidget {
  const PeriodCard({
    super.key,
    required this.name,
    required this.start,
    required this.ends,
  });

  final String name;
  final DateTime start;
  final DateTime ends;
  final double cardHeigth = 38;

  String dateFormater({required DateTime date}) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 38,
      decoration: const BoxDecoration(
        color: CustomColors.offWhite,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.black,
                ),
              ),
              Text(
                '${dateFormater(date: start)} a ${dateFormater(date: ends)}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
