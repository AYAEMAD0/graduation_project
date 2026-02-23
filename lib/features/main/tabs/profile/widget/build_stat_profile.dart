import 'package:flutter/material.dart';

class BuildStatProfile extends StatelessWidget {
  const BuildStatProfile({super.key, required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9B09E4),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Color(0xFFBD85F8)),
        ),
      ],
    );
  }
}
