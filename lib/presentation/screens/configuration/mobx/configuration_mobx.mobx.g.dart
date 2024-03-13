// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_mobx.mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfigurationMobx on ConfigurationMobxBase, Store {
  late final _$isEditingNicknameAtom =
      Atom(name: 'ConfigurationMobxBase.isEditingNickname', context: context);

  @override
  bool get isEditingNickname {
    _$isEditingNicknameAtom.reportRead();
    return super.isEditingNickname;
  }

  @override
  set isEditingNickname(bool value) {
    _$isEditingNicknameAtom.reportWrite(value, super.isEditingNickname, () {
      super.isEditingNickname = value;
    });
  }

  late final _$isNewNicknameFilledAtom =
      Atom(name: 'ConfigurationMobxBase.isNewNicknameFilled', context: context);

  @override
  bool get isNewNicknameFilled {
    _$isNewNicknameFilledAtom.reportRead();
    return super.isNewNicknameFilled;
  }

  @override
  set isNewNicknameFilled(bool value) {
    _$isNewNicknameFilledAtom.reportWrite(value, super.isNewNicknameFilled, () {
      super.isNewNicknameFilled = value;
    });
  }

  late final _$ConfigurationMobxBaseActionController =
      ActionController(name: 'ConfigurationMobxBase', context: context);

  @override
  void setIsEditingNickname(bool value) {
    final _$actionInfo = _$ConfigurationMobxBaseActionController.startAction(
        name: 'ConfigurationMobxBase.setIsEditingNickname');
    try {
      return super.setIsEditingNickname(value);
    } finally {
      _$ConfigurationMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsNewNicknameFilled(bool value) {
    final _$actionInfo = _$ConfigurationMobxBaseActionController.startAction(
        name: 'ConfigurationMobxBase.setIsNewNicknameFilled');
    try {
      return super.setIsNewNicknameFilled(value);
    } finally {
      _$ConfigurationMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEditingNickname: ${isEditingNickname},
isNewNicknameFilled: ${isNewNicknameFilled}
    ''';
  }
}
