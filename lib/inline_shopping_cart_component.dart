import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// A shopping cart is the view that summarizes the articles selected and their
/// different prices by the customer.
///
/// See also:
///   * Sliver Row #56756: https://github.com/flutter/flutter/issues/56756
///   * sliver_tools https://pub.dev/packages/sliver_tools
///   * How to make CustomScrollView has 2 or multiple row https://stackoverflow.com/questions/65034208/how-to-make-customscrollview-has-2-or-multiple-row/72705975#72705975
class InlineShoppingCartComponent extends StatelessWidget {
  const InlineShoppingCartComponent({
    Key? key,
  }) : super(key: key);

  static const shoppingCartWidth = 380.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: shoppingCartWidth,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(sdPaddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
