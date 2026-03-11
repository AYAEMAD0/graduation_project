import 'package:flutter/material.dart';

class SummaryChip extends StatelessWidget {
  final bool isPassed;
  final int passed;
  final int total;

  const SummaryChip({
    super.key,
    required this.isPassed,
    required this.passed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPassed ? Colors.greenAccent : Colors.orangeAccent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPassed ? Icons.check_circle_outline : Icons.cancel_outlined,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            isPassed
                ? 'All Passed ($passed/$total)'
                : 'Failed ($passed/$total passed)',
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
