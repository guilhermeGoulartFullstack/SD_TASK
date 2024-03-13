import 'package:mobx/mobx.dart';

part 'configuration_mobx.mobx.g.dart';

class ConfigurationMobx = ConfigurationMobxBase with _$ConfigurationMobx;

abstract class ConfigurationMobxBase with Store {
  @observable
  bool isEditingNickname = false;

  @action
  void setIsEditingNickname(bool value) {
    isEditingNickname = value;
  }

  @observable
  bool isNewNicknameFilled = true;

  @action
  void setIsNewNicknameFilled(bool value) {
    isNewNicknameFilled = value;
  }
}
