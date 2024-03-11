import 'package:sd_task/domain/user_account.domain.dart';

abstract class UserAccountState {
  UserAccount? userAccount;

  UserAccountState({
    this.userAccount,
  });
}

class UserAccountInitialState extends UserAccountState {
  UserAccountInitialState() : super(userAccount: null);
}

class UserAccountLoadingState extends UserAccountState {}

class UserAccountSuccessState extends UserAccountState {
  UserAccountSuccessState({required UserAccount userAccount})
      : super(userAccount: userAccount);
}

class UserAccountErrorState extends UserAccountState {
  final String error;

  UserAccountErrorState({required this.error});
}
