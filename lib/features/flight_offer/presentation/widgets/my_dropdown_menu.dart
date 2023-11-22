import 'package:flutter/material.dart';

class MyDropDownMenu extends StatelessWidget {
  const MyDropDownMenu(
      {super.key,
      required this.value,
      required this.items,
      required this.onChanged});

  final String? value;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
