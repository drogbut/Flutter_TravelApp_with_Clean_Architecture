import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_app/commons/formatters.dart';

class PriceTileWidget extends StatelessWidget {
  final double price;

  final String title;

  final TextStyle? titleStyle;
  final TextStyle? priceStyle;

  const PriceTileWidget({
    Key? key,
    required this.price,
    required this.title,
    this.titleStyle,
    this.priceStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          style: titleStyle ?? theme.textTheme.labelMedium,
        )),
        Observer(
          builder: (_) => Text(
            formattedPrice(price),
            style: priceStyle ?? theme.textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
