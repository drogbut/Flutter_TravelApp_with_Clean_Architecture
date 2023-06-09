import 'package:flutter/material.dart';
import 'package:travel_app/widgets/sd_accordions/accordion_tile.dart';

/// A component allows the user to show and hide sections of related content
/// on a page.
///
/// ```dart
/// const Padding(
///          padding: EdgeInsets.all(8.0),
///          child: SdAccordionListView(
///             children: ItemList.list,
///             ),
///        ),
/// ```
///
/// See also:
///
///  * [ExpansionPanel], A material expansion panel.
///  * [AccordionTile] A single list tile that will be used to build an
///     accordion list view.
///  * <https://material.io/design/components/lists.html#types>
class SdAccordionListView extends StatelessWidget {
  const SdAccordionListView({
    required this.children,
    required this.onItemExpanded,
    Key? key,
  }) : super(key: key);

  final List<AccordionTile> children;
  final Function(int index, bool isExpanded) onItemExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: onItemExpanded,
      elevation: 1.0,
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: Theme.of(context).dividerColor,
      children: children.map<ExpansionPanel>((accordionTile) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Align(
                  alignment: Alignment.centerLeft, child: accordionTile.header),
            );
          },
          body: accordionTile.expanded,
          isExpanded: accordionTile.isExpanded,
          canTapOnHeader: true,
        );
      }).toList(),
    );
  }
}
