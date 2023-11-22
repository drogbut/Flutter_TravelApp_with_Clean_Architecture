import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/colors/my_colors.dart';
import 'package:travel_app/features/flight_offer/presentation/stores/language_store.dart';
import 'package:travel_app/features/flight_offer/presentation/widgets/my_dropdown_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(),
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MyAppBarState extends State<MyAppBar> {
  late final LanguageStore _languageStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageStore = Provider.of<LanguageStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.primaryContainer,
      title: IconButton(
        onPressed: () {
          openRegionalSettingsDialog(context);
        },
        icon: const Icon(Icons.language),
      ),
    );
  }

  Future openRegionalSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Observer(builder: (context) {
              if (_languageStore.availableLanguages.isEmpty) {
                return const CircularProgressIndicator();
              } else {
                return Column(
                  children: [
                    MyDropDownMenu(
                      value: _languageStore.selectedLanguage,
                      items: _languageStore.availableLanguages
                          .map((lang) => DropdownMenuItem<String>(
                                value: lang,
                                child: Text(lang),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // Mettez à jour le paramètre de langue
                      },
                    )
                  ],
                );
              }
            }),
            actions: [
              ElevatedButton(onPressed: () {}, child: const Text('Save')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
            ],
          );
        });
  }
}
