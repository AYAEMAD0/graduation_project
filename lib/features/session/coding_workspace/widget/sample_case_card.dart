import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class SampleCaseCard extends StatelessWidget {
  const SampleCaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.only(right: 20),
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
                "SAMPLE CASE 0",
                style: AppStyle.font16GrayRegular.copyWith(
                    fontSize: 10,
                  color: AppColor.slateGray,
                    fontWeight: FontWeight.bold
                ),
              ),
              _buildSuccessBadge(),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: _IOBox(title: "INPUT", value: "2"),
              ),
              SizedBox(width: 15),
              Expanded(
                child: _IOBox(title: "OUTPUT", value: "1"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.purple.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Success",
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
