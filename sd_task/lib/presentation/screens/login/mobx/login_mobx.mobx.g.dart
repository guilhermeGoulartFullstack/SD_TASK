// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_mobx.mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginMobx on LoginMobxBase, Store {
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
  String toString() {
    return '''
hasError: ${hasError},
isLoading: ${isLoading}
    ''';
  }
}
