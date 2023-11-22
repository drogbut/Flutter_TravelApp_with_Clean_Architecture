// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageStore on _LanguageStoreBase, Store {
  late final _$selectedLanguageAtom =
      Atom(name: '_LanguageStoreBase.selectedLanguage', context: context);

  @override
  String? get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(String? value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  late final _$availableLanguagesAtom =
      Atom(name: '_LanguageStoreBase.availableLanguages', context: context);

  @override
  ObservableList<String> get availableLanguages {
    _$availableLanguagesAtom.reportRead();
    return super.availableLanguages;
  }

  @override
  set availableLanguages(ObservableList<String> value) {
    _$availableLanguagesAtom.reportWrite(value, super.availableLanguages, () {
      super.availableLanguages = value;
    });
  }

  @override
  String toString() {
    return '''
selectedLanguage: ${selectedLanguage},
availableLanguages: ${availableLanguages}
    ''';
  }
}
