import 'package:mobx/mobx.dart';

part 'login_mobx.mobx.g.dart';

class LoginMobx = LoginMobxBase with _$LoginMobx;

abstract class LoginMobxBase with Store {
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

  @observable
  bool isPasswordFilled = false;

  @action
  void setIsPasswordFilled(bool value) {
    isPasswordFilled = value;
  }

  @computed
  bool get canLogin {
    return isEmailFilled && isPasswordFilled;
  }
}
