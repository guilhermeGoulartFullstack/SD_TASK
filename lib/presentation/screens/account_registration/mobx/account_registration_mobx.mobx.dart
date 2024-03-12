import 'package:mobx/mobx.dart';

part 'account_registration_mobx.mobx.g.dart';

class AccountRegistrationMobx = AccountRegistrationMobxBase
    with _$AccountRegistrationMobx;

abstract class AccountRegistrationMobxBase with Store {
  @observable
  bool hasMessage = false;

  @action
  void setHasMessage(bool value) {
    hasMessage = value;
  }

  @observable
  bool hasError = false;

  @action
  void setHasError(bool value) {
    hasError = value;
  }

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @observable
  bool doesPasswordMatch = false;

  @action
  void setDoesPasswordMatch(bool value) {
    doesPasswordMatch = value;
  }

  @observable
  bool isEmailFilled = false;

  @action
  void setIsEmailFilled(bool value) {
    isEmailFilled = value;
  }

  @computed
  bool get canRegister {
    return isEmailFilled && doesPasswordMatch;
  }
}
