import 'package:sd_task/firebase/requests/period_request.firebase.dart';

abstract class UserAccountEvent {
  String userId;

  UserAccountEvent({required this.userId});
}

class LoadUserAccountEvent extends UserAccountEvent {
  LoadUserAccountEvent({required super.userId});
}

class AddUserAccountEvent extends UserAccountEvent {
  AddUserAccountEvent({
    required super.userId,
  });
}

class AddPeriodToUserAccountEvent extends UserAccountEvent {
  PeriodRequest request;

  AddPeriodToUserAccountEvent({
    required super.userId,
    required this.request,
  });
}

class EditUserAccontProfile extends UserAccountEvent {
  PeriodRequest request;

  EditUserAccontProfile({
    required super.userId,
    required this.request,
  });
}

class DeleteUserAccontProfile extends UserAccountEvent {
  DeleteUserAccontProfile({
    required super.userId,
  });
}
