// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageStore on _LanguageStore, Store {
  late final _$currentLocaleAtom =
      Atom(name: '_LanguageStore.currentLocale', context: context);

  @override
  Locale get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(Locale value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
    });
  }

  late final _$_LanguageStoreActionController =
      ActionController(name: '_LanguageStore', context: context);

  @override
  void setLocale(Locale locale) {
    final _$actionInfo = _$_LanguageStoreActionController.startAction(
        name: '_LanguageStore.setLocale');
    try {
      return super.setLocale(locale);
    } finally {
      _$_LanguageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLocale: ${currentLocale}
    ''';
  }
}
