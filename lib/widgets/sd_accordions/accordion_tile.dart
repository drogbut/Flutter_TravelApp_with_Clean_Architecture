import 'package:flutter/material.dart';

/// A single list tile that will be used to build an accordion list view.
class AccordionTile {
  AccordionTile({
    required this.header,
    required this.expanded,
    required this.isExpanded,
  });

  Widget expanded;
  Widget header;
  bool isExpanded;
}
