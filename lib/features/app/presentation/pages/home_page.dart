import 'package:flutter/material.dart';
import 'package:travel_app/core/colors/my_colors.dart';

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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        return const AlertDialog(content: Placeholder()
            /*actions: [
              ElevatedButton(onPressed: () {}, child: const Text('Save')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),),
            ]*/
            );
      },
    );
  }
}
