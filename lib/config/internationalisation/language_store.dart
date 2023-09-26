import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  @observable
  Locale currentLocale = const Locale('en');

  @action
  void setLocale(Locale locale) {
    currentLocale = locale;
  }
}
