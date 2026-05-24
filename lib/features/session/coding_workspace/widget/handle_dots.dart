import 'package:flutter/material.dart';

class HandleDots extends StatelessWidget {
  const HandleDots({
    super.key,
    required this.isHorizontal,
    required this.isActive,
  });

  final bool isHorizontal;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: isHorizontal ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (_) => Padding(
          padding: const EdgeInsets.all(2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.grey.shade500,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
