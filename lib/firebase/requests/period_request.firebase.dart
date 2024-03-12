import 'package:sd_task/domain/enums/category.dart';

class PeriodRequest {
  String name;
  int start;
  int ends;
  PeriodCategory periodCategory;
  int goalOne;
  int? goalTwo;

  PeriodRequest({
    required this.name,
    required this.start,
    required this.ends,
    required this.periodCategory,
    required this.goalOne,
    this.goalTwo,
  });
}

Map<String, dynamic> periodRequestToMap(PeriodRequest request) {
  return {
    'name': request.name,
    'start': request.start,
    'ends': request.ends,
    'period_category': request.periodCategory.index,
    'goal_one': request.goalOne,
    'goal_two': request.goalTwo,
  };
}
