// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_registration_mobx.mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountRegistrationMobx on AccountRegistrationMobxBase, Store {
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: 'AccountRegistrationMobxBase.canRegister'))
          .value;

  late final _$hasMessageAtom =
      Atom(name: 'AccountRegistrationMobxBase.hasMessage', context: context);

  @override
  bool get hasMessage {
    _$hasMessageAtom.reportRead();
    return super.hasMessage;
  }

  @override
  set hasMessage(bool value) {
    _$hasMessageAtom.reportWrite(value, super.hasMessage, () {
      super.hasMessage = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: 'AccountRegistrationMobxBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AccountRegistrationMobxBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$doesPasswordMatchAtom = Atom(
      name: 'AccountRegistrationMobxBase.doesPasswordMatch', context: context);

  @override
  bool get doesPasswordMatch {
    _$doesPasswordMatchAtom.reportRead();
    return super.doesPasswordMatch;
  }

  @override
  set doesPasswordMatch(bool value) {
    _$doesPasswordMatchAtom.reportWrite(value, super.doesPasswordMatch, () {
      super.doesPasswordMatch = value;
    });
  }

  late final _$isEmailFilledAtom =
      Atom(name: 'AccountRegistrationMobxBase.isEmailFilled', context: context);

  @override
  bool get isEmailFilled {
    _$isEmailFilledAtom.reportRead();
    return super.isEmailFilled;
  }

  @override
  set isEmailFilled(bool value) {
    _$isEmailFilledAtom.reportWrite(value, super.isEmailFilled, () {
      super.isEmailFilled = value;
    });
  }

  late final _$AccountRegistrationMobxBaseActionController =
      ActionController(name: 'AccountRegistrationMobxBase', context: context);

  @override
  void setHasMessage(bool value) {
    final _$actionInfo = _$AccountRegistrationMobxBaseActionController
        .startAction(name: 'AccountRegistrationMobxBase.setHasMessage');
    try {
      return super.setHasMessage(value);
    } finally {
      _$AccountRegistrationMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError(bool value) {
    final _$actionInfo = _$AccountRegistrationMobxBaseActionController
        .startAction(name: 'AccountRegistrationMobxBase.setHasError');
    try {
      return super.setHasError(value);
    } finally {
      _$AccountRegistrationMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$AccountRegistrationMobxBaseActionController
        .startAction(name: 'AccountRegistrationMobxBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$AccountRegistrationMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDoesPasswordMatch(bool value) {
    final _$actionInfo = _$AccountRegistrationMobxBaseActionController
        .startAction(name: 'AccountRegistrationMobxBase.setDoesPasswordMatch');
    try {
      return super.setDoesPasswordMatch(value);
    } finally {
      _$AccountRegistrationMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEmailFilled(bool value) {
    final _$actionInfo = _$AccountRegistrationMobxBaseActionController
        .startAction(name: 'AccountRegistrationMobxBase.setIsEmailFilled');
    try {
      return super.setIsEmailFilled(value);
    } finally {
      _$AccountRegistrationMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasMessage: ${hasMessage},
hasError: ${hasError},
isLoading: ${isLoading},
doesPasswordMatch: ${doesPasswordMatch},
isEmailFilled: ${isEmailFilled},
canRegister: ${canRegister}
    ''';
  }
}
