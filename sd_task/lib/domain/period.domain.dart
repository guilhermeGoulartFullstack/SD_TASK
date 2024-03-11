import 'package:flutter/foundation.dart';

class Period {
  String name;
  DateTime start;
  DateTime ends;
  Category category;
  int goalOne;
  int? goalTwo;

  Period({
    required this.name,
    required this.start,
    required this.ends,
    required this.category,
    required this.goalOne,
    this.goalTwo,
  });
}
