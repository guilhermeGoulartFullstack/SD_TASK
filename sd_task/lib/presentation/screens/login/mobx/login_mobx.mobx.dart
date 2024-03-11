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
}
