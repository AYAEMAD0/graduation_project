import 'package:flutter/material.dart';

class TimerBadge extends StatelessWidget {
  final int remainingSeconds;

  const TimerBadge({super.key, required this.remainingSeconds});

  String get _formattedTime {
    final minutes = (remainingSeconds / 60).floor().toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final isWarning = remainingSeconds < 60;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isWarning
            ? Colors.redAccent.withValues(alpha: 0.2)
            : Colors.white10,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isWarning
              ? Colors.redAccent.withValues(alpha: 0.5)
              : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: isWarning ? Colors.redAccent : Colors.red,
            size: 12,
          ),
          const SizedBox(width: 8),
          Text(
            _formattedTime,
            style: TextStyle(
              color: isWarning ? Colors.redAccent : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
