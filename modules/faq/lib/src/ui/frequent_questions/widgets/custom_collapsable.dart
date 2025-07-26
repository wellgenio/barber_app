import 'package:flutter/material.dart';

class CustomCollapsable extends StatefulWidget {
  final CustomCollapsableHeaderContent headerContent;
  final Widget body;
  final bool initExpanded;
  final bool? expanded;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final double? indicatorIconSize;
  final ValueChanged<bool>? onToggle;
  final Color? indicatorIconColor;

  const CustomCollapsable({
    super.key,
    required this.headerContent,
    required this.body,
    this.padding,
    this.decoration,
    this.indicatorIconSize,
    this.initExpanded = true,
    this.expanded,
    this.onToggle,
    this.indicatorIconColor,
  });

  factory CustomCollapsable.withDefaultDecoratedContainer({
    required BuildContext context,
    required Text headerContent,
    Icon? leadingHeaderIcon,
    required Widget body,
    EdgeInsets? padding,
    Decoration? decoration,
    double? indicatorIconSize,
    bool initExpanded = true,
    ValueChanged<bool>? onToggle,
    Color? indicatorIconColor,
  }) => CustomCollapsable(
    headerContent: CustomCollapsableHeaderContent.withText(
      context: context,
      header: headerContent,
      leadingIcon: leadingHeaderIcon,
    ),
    body: body,
    onToggle: onToggle,
    padding: padding ?? EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    decoration:
        decoration ??
        BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
    indicatorIconSize: indicatorIconSize,
    initExpanded: initExpanded,
    indicatorIconColor: indicatorIconColor,
  );

  @override
  State<CustomCollapsable> createState() => _CustomCollapsableState();
}

class _CustomCollapsableState extends State<CustomCollapsable> {
  late bool _expanded;
  static const _duration = Duration(milliseconds: 300);

  @override
  void initState() {
    _expanded = widget.initExpanded;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomCollapsable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.expanded != widget.expanded && widget.expanded != null) {
      _expanded = widget.expanded!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      padding: widget.padding,
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: widget.headerContent.padding ?? EdgeInsets.zero,
              child: Row(
                crossAxisAlignment:
                    widget.headerContent.verticalAlign ??
                    CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: widget.headerContent.child),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0.0,
                    duration: _duration,
                    curve: Curves.ease,
                    child: Icon(
                      _expanded ? Icons.expand_less : Icons.expand_more,
                      size: widget.indicatorIconSize ?? 16.0,
                      color: widget.indicatorIconColor,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                _expanded = !_expanded;
                widget.onToggle?.call(_expanded);
              });
            },
          ),
          AnimatedSwitcher(
            duration: _duration,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: -1.0,
                  child: child,
                ),
              );
            },
            child: _expanded ? widget.body : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class CustomCollapsableHeaderContent {
  final Widget child;
  final EdgeInsets? padding;
  final CrossAxisAlignment? verticalAlign;

  CustomCollapsableHeaderContent({
    required this.child,
    this.padding,
    this.verticalAlign,
  });

  factory CustomCollapsableHeaderContent.withText({
    required BuildContext context,
    required Text header,
    Icon? leadingIcon,
  }) => CustomCollapsableHeaderContent(
    child: Row(
      children: [
        if (leadingIcon != null) ...[leadingIcon, SizedBox(width: 8)],
        header,
      ],
    ),
  );
}
