import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/responsive_layout.dart';

import 'inline_shopping_cart_component.dart';

/// This widget can be used to display any content alongside the inline shopping
/// cart (if screen is large enough and inline cart is enabled). It is used for
/// example on the articles page, topping page and menu page.
class InlineCartScaffold extends StatelessWidget {
  /// a widget (normal, not sliver) to be displayed above the body and the inline
  /// cart (e.g. this is used on the articles page to show a banner)
  final Widget? header;

  /// must be a sliver-type widget, e.g. SliverList, SliverGrid etc (else just
  /// wrap it in a SliverToBoxAdapter)
  final Widget bodySliver;

  /// A widget (normal, not sliver) to be displayed below the body and the inline
  /// cart (e.g. this is used on the articles page to show the site footer)
  final Widget? footer;

  final double sidePadding;

  /// This is the minimum screen height when the inline cart should be displayed
  /// on the right side of the page. If minScreenHeightForInlineCart < 600 the
  /// inline cart is displayed in the appbar as an icon.
  static const int minScreenHeightForInlineCart = 600;

  /// This controls whether we display the buttons for editing articles and
  /// adding vouchers. Having the articles/vouchers editable may be undesirable
  /// in some states, for example when the user is already editing the article.
  final bool canEditArticlesOrAddVouchers;

  const InlineCartScaffold({
    Key? key,
    required this.bodySliver,
    this.sidePadding = 0,
    this.header,
    this.footer,
    this.canEditArticlesOrAddVouchers = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // TODO: create viewmodel and check for AppSettingsRepo.desktopShoppingCartIsInline
    final isLargeScreen = (ResponsiveLayout.isComputer(context) ||
            ResponsiveLayout.isLargeTablet(context)) &&
        screenHeight >= minScreenHeightForInlineCart;
    final double rightSidePadding = sidePadding +
        (isLargeScreen
            ? InlineShoppingCartComponent.shoppingCartWidth + sdPaddingMedium
            : 0);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: RawScrollbar(
        interactive: true,
        minThumbLength: 50,
        thickness: 8,
        radius: const Radius.circular(25),
        padding: EdgeInsets.only(
          right: rightSidePadding - 12,
          top: 10,
          bottom: 160,
        ),
        child: CustomScrollView(
          primary: true,
          slivers: [
            if (header != null) SliverToBoxAdapter(child: header),
            if (footer != null) SliverToBoxAdapter(child: footer),
          ],
        ),
      ),
    );
  }
}
