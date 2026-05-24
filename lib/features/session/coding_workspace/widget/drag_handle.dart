import 'package:flutter/material.dart';

import 'handle_dots.dart';

class DragHandle extends StatefulWidget {
  const DragHandle({
    super.key,
    required this.axis,
    required this.thickness,
    required this.onDrag,
    this.color,
  });

  final Axis axis;
  final double thickness;
  final Color? color;
  final GestureDragUpdateCallback onDrag;

  @override
  State<DragHandle> createState() => DragHandleState();
}

class DragHandleState extends State<DragHandle> {
  bool _isHovered = false;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final isActive = _isHovered || _isDragging;
    final isHorizontal = widget.axis == Axis.horizontal;

    return MouseRegion(
      cursor: isHorizontal
          ? SystemMouseCursors.resizeColumn
          : SystemMouseCursors.resizeRow,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: isHorizontal ? widget.onDrag : null,
        onVerticalDragUpdate: isHorizontal ? null : widget.onDrag,
        onHorizontalDragStart: isHorizontal
            ? (_) => setState(() => _isDragging = true)
            : null,
        onHorizontalDragEnd: isHorizontal
            ? (_) => setState(() => _isDragging = false)
            : null,
        onVerticalDragStart: !isHorizontal
            ? (_) => setState(() => _isDragging = true)
            : null,
        onVerticalDragEnd: !isHorizontal
            ? (_) => setState(() => _isDragging = false)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: isHorizontal ? widget.thickness : double.infinity,
          height: isHorizontal ? double.infinity : widget.thickness,
          color: isActive
              ? (widget.color ?? Theme.of(context).primaryColor)
              : Colors.grey.shade300,
          child: Center(
            child: HandleDots(isHorizontal: isHorizontal, isActive: isActive),
          ),
        ),
      ),
    );
  }
}
