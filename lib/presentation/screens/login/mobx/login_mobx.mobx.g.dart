// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_mobx.mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginMobx on LoginMobxBase, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: 'LoginMobxBase.canLogin'))
      .value;

  late final _$hasErrorAtom =
      Atom(name: 'LoginMobxBase.hasError', context: context);

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
      Atom(name: 'LoginMobxBase.isLoading', context: context);

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

  late final _$isEmailFilledAtom =
      Atom(name: 'LoginMobxBase.isEmailFilled', context: context);

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

  late final _$isPasswordFilledAtom =
      Atom(name: 'LoginMobxBase.isPasswordFilled', context: context);

  @override
  bool get isPasswordFilled {
    _$isPasswordFilledAtom.reportRead();
    return super.isPasswordFilled;
  }

  @override
  set isPasswordFilled(bool value) {
    _$isPasswordFilledAtom.reportWrite(value, super.isPasswordFilled, () {
      super.isPasswordFilled = value;
    });
  }

  late final _$LoginMobxBaseActionController =
      ActionController(name: 'LoginMobxBase', context: context);

  @override
  void setHasError(bool value) {
    final _$actionInfo = _$LoginMobxBaseActionController.startAction(
        name: 'LoginMobxBase.setHasError');
    try {
      return super.setHasError(value);
    } finally {
      _$LoginMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$LoginMobxBaseActionController.startAction(
        name: 'LoginMobxBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$LoginMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEmailFilled(bool value) {
    final _$actionInfo = _$LoginMobxBaseActionController.startAction(
        name: 'LoginMobxBase.setIsEmailFilled');
    try {
      return super.setIsEmailFilled(value);
    } finally {
      _$LoginMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsPasswordFilled(bool value) {
    final _$actionInfo = _$LoginMobxBaseActionController.startAction(
        name: 'LoginMobxBase.setIsPasswordFilled');
    try {
      return super.setIsPasswordFilled(value);
    } finally {
      _$LoginMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasError: ${hasError},
isLoading: ${isLoading},
isEmailFilled: ${isEmailFilled},
isPasswordFilled: ${isPasswordFilled},
canLogin: ${canLogin}
    ''';
  }
}
