import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sd_task/firebase/requests/period_request.firebase.dart';

abstract class UserAccountEvent {
  User? user;

  UserAccountEvent({this.user});
}

class LoadUserAccountEvent extends UserAccountEvent {
  LoadUserAccountEvent({super.user});
}

class AddUserAccountEvent extends UserAccountEvent {
  AddUserAccountEvent({
    super.user,
  });
}

class AddPeriodToUserAccountEvent extends UserAccountEvent {
  PeriodRequest request;

  AddPeriodToUserAccountEvent({
    super.user,
    required this.request,
  });
}

class EditUserAccontPeriodEvent extends UserAccountEvent {
  PeriodRequest request;

  EditUserAccontPeriodEvent({
    super.user,
    required this.request,
  });
}

class EditUserAccountNicknameEvent extends UserAccountEvent {
  String newNickname;

  EditUserAccountNicknameEvent({
    super.user,
    required this.newNickname,
  });
}

class EditUserAccountPhotoEvent extends UserAccountEvent {
  XFile file;

  EditUserAccountPhotoEvent({
    super.user,
    required this.file,
  });
}

class DeletePeriodFromUserAccountEvent extends UserAccountEvent {
  String id;

  DeletePeriodFromUserAccountEvent({
    super.user,
    required this.id,
  });
}
