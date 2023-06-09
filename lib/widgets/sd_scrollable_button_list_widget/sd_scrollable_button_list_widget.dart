import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// Widget used to display a horizontal list with 2 additional arrow buttons
/// which help the user manually scroll the list. The arrow buttons only
/// appear on a non mobile environment.
class SdScrollableButtonListWidget extends StatefulWidget {
  ///Number of items of the list
  final int? itemCount;

  ///Item builder used to create the items of the list
  final IndexedWidgetBuilder? itemBuilder;

  ///Scrolling distance for when the user taps an arrow button
  final double movingOffset;

  /// List of items that we need to display and have horizontal scrolling
  final List<Widget>? itemList;

  ///Number of items of the list
  final Color? arrowColor;

  final Color? arrowBgColor;

  const SdScrollableButtonListWidget({
    Key? key,
    this.itemCount,
    this.itemBuilder,
    this.itemList,
    this.arrowColor,
    this.arrowBgColor,
    this.movingOffset = sdPaddingLarge * 3,
  }) : super(key: key);

  @override
  State<SdScrollableButtonListWidget> createState() =>
      _SdScrollableButtonListWidgetState();
}

class _SdScrollableButtonListWidgetState
    extends State<SdScrollableButtonListWidget> {
  final ScrollController _scrollController = ScrollController();

  bool showLeft = false;
  bool showRight = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _) {
      _checkListViewport();
      return Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: showLeft ? sdPaddingLarge : 0,
              right: showRight ? sdPaddingLarge : 0,
            ),
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (scrollEnd) {
                _checkListViewport();
                return true;
              },
              child: widget.itemList == null && widget.itemBuilder != null
                  ? ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      controller: _scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.itemCount,
                      itemBuilder: widget.itemBuilder!,
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.itemList!,
                      ),
                    ),
            ),
          ),
          if (showRight)
            widget.itemList != null
                ? Positioned(top: 200, right: 0, child: moveBackward())
                : Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: moveBackward(),
                  ),
          if (showLeft)
            widget.itemList != null
                ? Positioned(top: 200, child: moveForward())
                : Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: moveForward(),
                  ),
        ],
      );
    });
  }

  Widget moveForward() {
    return Container(
        decoration: BoxDecoration(
          color: widget.itemList != null
              ? Colors.transparent
              : widget.arrowBgColor ??
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(sdRadius)),
        ),
        child: _ShadowIcon(
          icon: Icons.arrow_left,
          color: widget.arrowColor ?? Theme.of(context).colorScheme.onSurface,
          onClicked: () {
            _scrollController.animateTo(
              widget.itemList != null
                  ? _scrollController.offset - widget.movingOffset * 3
                  : _scrollController.offset - widget.movingOffset,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          },
        ));
  }

  Widget moveBackward() {
    return Container(
      decoration: BoxDecoration(
        color: widget.itemList != null
            ? Colors.transparent
            : widget.arrowBgColor ??
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(sdRadius)),
      ),
      child: _ShadowIcon(
        icon: Icons.arrow_right,
        color: widget.arrowColor ?? Theme.of(context).colorScheme.onSurface,
        onClicked: () {
          late double position;
          if (widget.itemList != null) {
            position = _scrollController.offset + widget.movingOffset * 3;
          } else {
            position = _scrollController.offset + widget.movingOffset;
          }
          _scrollController.animateTo(
              position > _scrollController.position.maxScrollExtent
                  ? _scrollController.position.maxScrollExtent
                  : position,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn);
        },
      ),
    );
  }

  void _checkListViewport() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients) {
        if (_scrollController.position.pixels == 0) {
          if (showLeft ||
              showRight != (_scrollController.position.maxScrollExtent != 0)) {
            setState(() {
              showLeft = false;

              showRight = _scrollController.position.maxScrollExtent != 0;
            });
          }
        } else if (_scrollController.position.atEdge) {
          if (showRight || !showLeft) {
            setState(() {
              showRight = false;
              showLeft = true;
            });
          }
        } else {
          if (!showRight || !showLeft) {
            setState(() {
              showRight = true;
              showLeft = true;
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _ShadowIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onClicked;

  const _ShadowIcon({
    required this.icon,
    required this.color,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Icon(
        icon,
        color: color,
        size: sdIconSizeMedium,
      ),
    );
  }
}
