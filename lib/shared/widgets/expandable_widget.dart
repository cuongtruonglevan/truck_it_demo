import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final Widget child;
  final bool expand;

  ExpandableWidget({this.expand = false, required this.child});

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    handleAnimations();
  }

  @override
  void didUpdateWidget(ExpandableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    handleAnimations();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }

  void initAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.easeInOutBack,
    );
  }

  void handleAnimations() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }
}
