import 'package:sd_task/domain/period.domain.dart';

class UserAccount {
  String userId;
  String nickname;
  String? photoUrl;
  List<Period>? periods;

  UserAccount({
    required this.userId,
    required this.nickname,
    this.photoUrl,
    this.periods,
  });

  factory UserAccount.fromMap(
      {required Map<String, dynamic> map, List<Period>? periods}) {
    return UserAccount(
      userId: map['id'],
      nickname: map['nickname'],
      photoUrl: map['photo_url'],
      periods: periods,
    );
  }
}
