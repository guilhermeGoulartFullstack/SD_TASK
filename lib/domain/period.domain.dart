import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sd_task/domain/enums/category.dart';

class Period {
  String id;
  String name;
  int start;
  int ends;
  PeriodCategory periodCategory;
  int goalOne;
  int? goalTwo;

  Period({
    required this.id,
    required this.name,
    required this.start,
    required this.ends,
    required this.periodCategory,
    required this.goalOne,
    this.goalTwo,
  });

  factory Period.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> map) {
    // log(map['period_category']);
    return Period(
      id: map.id,
      name: map['name'],
      start: map['start'],
      ends: map['ends'],
      periodCategory: PeriodCategory.values.elementAt(map['period_category']),
      goalOne: map['goal_one'],
      goalTwo: map['goal_two'],
    );
  }
}
