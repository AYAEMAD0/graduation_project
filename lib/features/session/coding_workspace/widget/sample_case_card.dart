import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';

class SampleCaseCard extends StatelessWidget {
  final List<TestCaseEntity> testCases;

  const SampleCaseCard({super.key, required this.testCases});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: testCases
          .asMap()
          .entries
          .map((entry) {
        final index = entry.key;
        final testCase = entry.value;
        return Container(
          margin: EdgeInsets.only(right: 15, bottom: 6, top: 6),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SAMPLE CASE $index",
                    style: AppStyle.font16GrayRegular.copyWith(
                      fontSize: 10,
                      color: AppColor.slateGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildBadge(),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: _IOBox(title: "INPUT", value: testCase.input)),
                  const SizedBox(width: 15),
                  Expanded(
                      child: _IOBox(title: "OUTPUT", value: testCase.output)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.purple.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Sample",
        style: TextStyle(
          color: Colors.purple,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _IOBox extends StatelessWidget {
  final String title, value;
  const _IOBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.font16GrayRegular.copyWith(
              fontSize: 10,
            color: AppColor.slateGray,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: AppStyle.font16WhiteBold.copyWith(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
