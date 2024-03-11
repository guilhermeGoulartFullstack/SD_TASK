import 'dart:io';

import 'package:sd_task/domain/period.domain.dart';

class UserAccount {
  String userId;
  String nickname;
  File? photo;
  List<Period> periods;

  UserAccount({
    required this.userId,
    required this.nickname,
    this.photo,
    this.periods = const [],
  });
}
