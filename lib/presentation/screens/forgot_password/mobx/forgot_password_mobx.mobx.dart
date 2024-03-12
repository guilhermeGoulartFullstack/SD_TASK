import 'package:mobx/mobx.dart';

part 'forgot_password_mobx.mobx.g.dart';

class ForgotPasswordMobx = ForgotPasswordMobxBase with _$ForgotPasswordMobx;

abstract class ForgotPasswordMobxBase with Store {
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
  bool isEmailFilled = false;

  @action
  void setIsEmailFilled(bool value) {
    isEmailFilled = value;
  }
}
