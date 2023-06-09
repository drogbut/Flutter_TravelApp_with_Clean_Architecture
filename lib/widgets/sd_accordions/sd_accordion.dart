import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

enum AccordionState {
  collapsed,
  expanded,
}

enum AccordionDirection {
  upward,
  downward,
}

class SdAccordionContent extends StatefulWidget {
  const SdAccordionContent({
    required this.content,
    required Key key,
  }) : super(key: key);
  final Widget content;

  @override
  State<SdAccordionContent> createState() => SdAccordionContentState();
}

class SdAccordionContentState extends State<SdAccordionContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  void toggleExpansion() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void expand() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      child: widget.content,
    );
  }
}

class SdAccordionToggler extends StatefulWidget {
  const SdAccordionToggler({
    required this.expandableKeyState,
    required this.label,
    this.labelStyle,
    this.expandedLabel,
    this.inverted = false,
    this.alignment = WrapAlignment.start,
    this.onToggled,
    this.initialState = AccordionState.collapsed,
    Key? key,
  })  : child = null,
        expandedChild = null,
        assert(label != null),
        super(key: key);

  const SdAccordionToggler.custom({
    required this.expandableKeyState,
    required this.child,
    this.expandedChild,
    this.inverted = false,
    this.onToggled,
    this.initialState = AccordionState.collapsed,
    Key? key,
  })  : label = null,
        expandedLabel = null,
        labelStyle = null,
        alignment = WrapAlignment.start,
        assert(child != null),
        super(key: key);

  final String? expandedLabel;
  final String? label;
  final TextStyle? labelStyle;
  final Widget? child;
  final Widget? expandedChild;
  final bool inverted;
  final WrapAlignment alignment;
  final ValueChanged<bool>? onToggled;
  final AccordionState initialState;
  final GlobalKey<SdAccordionContentState> expandableKeyState;

  @override
  State<SdAccordionToggler> createState() => _SdAccordionTogglerState();
}

class _SdAccordionTogglerState extends State<SdAccordionToggler> {
  late bool isExpanded = widget.initialState == AccordionState.expanded;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (isExpanded) {
        widget.expandableKeyState.currentState?.expand();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (widget.label == null && widget.child != null) {
      return InkWell(
        onTap: _toggle,
        child: widget.child,
      );
    }
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: widget.alignment,
      children: [
        InkWell(
          onTap: _toggle,
          child: widget.label != null
              ? Text(
                  isExpanded
                      ? widget.expandedLabel ?? widget.label!
                      : widget.label!,
                  style: widget.labelStyle ?? theme.textTheme.titleMedium)
              : isExpanded
                  ? widget.expandedChild ?? widget.child!
                  : widget.child!,
        ),
        const SizedBox(
          width: sdPaddingMedium,
        ),
        IconButton(
          padding: const EdgeInsets.all(sdPaddingSmall),
          color: isExpanded
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.surface,
          icon: Icon(_getIconData()),
          onPressed: _toggle,
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      widget.expandableKeyState.currentState?.toggleExpansion();
      isExpanded = !isExpanded;
    });
    widget.onToggled?.call(isExpanded);
  }

  IconData _getIconData() {
    if (widget.inverted) {
      return isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up;
    }
    return isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down;
  }
}

class SdAccordion extends StatefulWidget {
  const SdAccordion({
    required this.title,
    required this.child,
    this.onToggled,
    this.titleStyle,
    this.initialState = AccordionState.collapsed,
    this.direction = AccordionDirection.downward,
    Key? key,
  })  : togglerContent = null,
        assert(title != null),
        super(key: key);

  const SdAccordion.customToggler({
    required this.child,
    required this.togglerContent,
    this.onToggled,
    this.initialState = AccordionState.collapsed,
    this.direction = AccordionDirection.downward,
    Key? key,
  })  : title = null,
        titleStyle = null,
        assert(togglerContent != null),
        super(key: key);

  final String? title;
  final Widget? togglerContent;
  final TextStyle? titleStyle;
  final Widget child;
  final AccordionState initialState;
  final AccordionDirection direction;
  final void Function(bool isExpanded)? onToggled;

  @override
  State<SdAccordion> createState() => _SdAccordionState();
}

class _SdAccordionState extends State<SdAccordion> {
  final GlobalKey<SdAccordionContentState> _expandableKey = GlobalKey();
  late bool isExpanded = widget.initialState == AccordionState.expanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.direction == AccordionDirection.upward)
          _buildExpansionContent(),
        if (widget.title != null)
          _buildToggler()
        else
          SdAccordionToggler.custom(
            initialState: widget.initialState,
            inverted: widget.direction == AccordionDirection.upward,
            onToggled: (value) {
              setState(() {
                isExpanded = value;
                widget.onToggled?.call(isExpanded);
              });
            },
            expandableKeyState: _expandableKey,
            child: widget.togglerContent,
          ),
        if (widget.direction == AccordionDirection.downward)
          _buildExpansionContent(),
      ],
    );
  }

  BorderRadius _getTogglerBorderRadius() {
    if (!isExpanded) {
      return BorderRadius.circular(sdPaddingSmall);
    }
    return widget.direction == AccordionDirection.downward
        ? const BorderRadius.only(
            topLeft: Radius.circular(sdPaddingSmall),
            topRight: Radius.circular(sdPaddingSmall),
          )
        : const BorderRadius.only(
            bottomLeft: Radius.circular(sdPaddingSmall),
            bottomRight: Radius.circular(sdPaddingSmall),
          );
  }

  BorderRadius _getExpansionBorderRadius() {
    return widget.direction == AccordionDirection.upward
        ? const BorderRadius.only(
            topLeft: Radius.circular(sdPaddingSmall),
            topRight: Radius.circular(sdPaddingSmall),
          )
        : const BorderRadius.only(
            bottomLeft: Radius.circular(sdPaddingSmall),
            bottomRight: Radius.circular(sdPaddingSmall),
          );
  }

  Widget _buildExpansionContent() {
    return SdAccordionContent(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: _getExpansionBorderRadius(),
        ),
        child: widget.child,
      ),
      key: _expandableKey,
    );
  }

  Widget _buildToggler() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: _getTogglerBorderRadius(),
      ),
      child: SdAccordionToggler(
        initialState: widget.initialState,
        inverted: widget.direction == AccordionDirection.upward,
        onToggled: (value) {
          setState(() {
            isExpanded = value;
            widget.onToggled?.call(isExpanded);
          });
        },
        label: widget.title,
        labelStyle: widget.titleStyle,
        expandableKeyState: _expandableKey,
        alignment: WrapAlignment.spaceBetween,
      ),
    );
  }
}
