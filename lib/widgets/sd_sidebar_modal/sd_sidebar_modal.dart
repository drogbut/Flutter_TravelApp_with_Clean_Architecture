import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// Displays a sidebar modal with [child] as content. This is useful for larger
/// screens, and is usually used instead of a bottom sheet modal. The modal can
/// be closed like other modals, with `Navigator.of(context).pop()`.
void showSidebarModal(BuildContext context, {required Widget child}) {
  final sidebarModal = SdSidebarModalController.maybeOf(context);
  if (sidebarModal == null) {
    debugPrint(
        'No SdSidebarModalController found in context, will not show modal.');
    return;
  }
  if (sidebarModal.isSidebarOpen) {
    debugPrint('Another sidebar is already open, will not show modal.');
    // We can implement this case if needed, we just need to define what is the
    // expected behavior – for example, should we close the existing modal and
    // open the new one, or just open the new one on top (this might be trickier
    // to implement).
    return;
  }
  sidebarModal.showSidebarModal(child);
}

/// This widget is used to display sidebar modals. It should be added to the
/// root of the tree, as a parent to the widget on top of which the sidebar
/// modals will need to be displayed.
class SdSidebarModalController extends StatefulWidget {
  final Widget child;

  const SdSidebarModalController({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  SdSidebarModalControllerState createState() =>
      SdSidebarModalControllerState();

  static SdSidebarModalControllerState? maybeOf(BuildContext context) {
    return context.findAncestorStateOfType<SdSidebarModalControllerState>();
  }
}

class SdSidebarModalControllerState extends State<SdSidebarModalController> {
  final GlobalKey<DrawerControllerState> _sidebarDrawerKey =
      GlobalKey<DrawerControllerState>();
  Widget? _sidebarChild;

  bool isSidebarOpen = false;

  void showSidebarModal(Widget child) {
    setState(() {
      _sidebarChild = child;
    });
    _sidebarDrawerKey.currentState?.open();
  }

  void closeSidebarModal() {
    _sidebarDrawerKey.currentState?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        DrawerController(
          key: _sidebarDrawerKey,
          alignment: DrawerAlignment.end,
          enableOpenDragGesture: false,
          drawerCallback: (isOpened) {
            setState(() {
              isSidebarOpen = isOpened;
              if (!isOpened) {
                _sidebarChild = null;
              }
            });
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(width: sdSidebarWidth),
            child: Material(child: _sidebarChild),
          ),
        ),
      ],
    );
  }
}
