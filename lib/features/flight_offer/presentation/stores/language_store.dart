import 'package:mobx/mobx.dart';
import 'package:travel_app/features/flight_offer/data/repositories_impl/service_api_impl.dart';

part 'language_store.g.dart';

class LanguageStore extends _LanguageStoreBase with _$LanguageStore {
  LanguageStore(ServiceApi languageRepositoryImpl)
      : super(languageRepositoryImpl);
}

abstract class _LanguageStoreBase with Store {
  _LanguageStoreBase(this._languageRepository);
  final ServiceApi _languageRepository;

  @observable
  String? selectedLanguage = 'en';

  @observable
  ObservableList<String> availableLanguages = ObservableList<String>();

// Ajoutez des méthodes pour gérer les devises, les paramètres de langue, etc.
}
