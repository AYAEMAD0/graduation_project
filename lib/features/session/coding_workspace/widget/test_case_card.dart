import 'package:flutter/material.dart';

import '../../../../domain/entities/session/run_code/run_code_response_entity.dart';

class TestCaseCard extends StatelessWidget {
  final TestCaseResultEntity testCase;

  const TestCaseCard({super.key, required this.testCase});

  @override
  Widget build(BuildContext context) {
    final isAccepted = testCase.status == 'Accepted';
    final borderColor = isAccepted
        ? Colors.greenAccent.withValues(alpha: 0.3)
        : Colors.redAccent.withValues(alpha: 0.3);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isAccepted ? Icons.check_circle : Icons.cancel,
                color: isAccepted ? Colors.greenAccent : Colors.redAccent,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                'Test #${testCase.testCaseId} — ${testCase.status}',
                style: TextStyle(
                  color: isAccepted ? Colors.greenAccent : Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _InfoRow(label: 'Input', value: testCase.input ?? 'Hidden'),
          _InfoRow(
            label: 'Expected',
            value: testCase.expectedOutput ?? 'Hidden',
          ),
          _InfoRow(
            label: 'Actual',
            value: testCase.actualOutput ?? '—',
            valueColor: isAccepted ? Colors.greenAccent : Colors.redAccent,
          ),
          if (testCase.compileOutput != null)
            _InfoRow(
              label: 'Compile',
              value: testCase.compileOutput!,
              valueColor: Colors.orangeAccent,
            ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  String formatValue(String text) {
    return text
        .replaceAll(r'\"', '"')
        .replaceAll(r'\n', '\n')
        .replaceAllMapped(
      RegExp(r'([{[]|[}\]])'),
          (m) => '${m.group(0)}\n',
    )
        .replaceAll(RegExp(r'^"|"$'), '')
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 65,
            child: Text(
              '$label:',
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: SelectableText(
                formatValue(value),
                style: TextStyle(
                  color: valueColor ?? Colors.white70,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
