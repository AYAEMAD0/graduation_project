import 'package:flutter/material.dart';

import 'drag_handle.dart';

class ResizablePanel extends StatefulWidget {
  const ResizablePanel({
    super.key,
    required this.first,
    required this.second,
    this.axis = Axis.horizontal,
    this.initialFraction = 0.5,
    this.minFraction = 0.15,
    this.maxFraction = 0.85,
    this.dividerColor,
    this.dividerThickness = 4.0,
  });

  final Widget first;
  final Widget second;
  final Axis axis;
  final double initialFraction;
  final double minFraction;
  final double maxFraction;
  final Color? dividerColor;
  final double dividerThickness;

  @override
  State<ResizablePanel> createState() => _ResizablePanelState();
}

class _ResizablePanelState extends State<ResizablePanel> {
  late double _fraction;

  @override
  void initState() {
    super.initState();
    _fraction = widget.initialFraction;
  }

  void _onDrag(DragUpdateDetails details, double totalSize) {
    final delta = widget.axis == Axis.horizontal
        ? details.delta.dx
        : details.delta.dy;

    setState(() {
      _fraction = (_fraction + delta / totalSize).clamp(
        widget.minFraction,
        widget.maxFraction,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalSize = widget.axis == Axis.horizontal
            ? constraints.maxWidth
            : constraints.maxHeight;

        final firstSize = totalSize * _fraction;
        final secondSize =
            totalSize * (1 - _fraction) - widget.dividerThickness;

        final children = [
          SizedBox(
            width: widget.axis == Axis.horizontal ? firstSize : double.infinity,
            height: widget.axis == Axis.vertical ? firstSize : double.infinity,
            child: widget.first,
          ),
          DragHandle(
            axis: widget.axis,
            thickness: widget.dividerThickness,
            color: widget.dividerColor,
            onDrag: (details) => _onDrag(details, totalSize),
          ),

          SizedBox(
            width: widget.axis == Axis.horizontal
                ? secondSize
                : double.infinity,
            height: widget.axis == Axis.vertical ? secondSize : double.infinity,
            child: widget.second,
          ),
        ];

        return widget.axis == Axis.horizontal
            ? Row(children: children)
            : Column(children: children);
      },
    );
  }
}
