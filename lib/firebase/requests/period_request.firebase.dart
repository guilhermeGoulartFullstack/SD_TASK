import 'package:flutter/foundation.dart';

class PeriodRequest {
  String name;
  DateTime start;
  DateTime ends;
  Category category;
  int goalOne;
  int? goalTwo;

  PeriodRequest({
    required this.name,
    required this.start,
    required this.ends,
    required this.category,
    required this.goalOne,
    this.goalTwo,
  });
}
