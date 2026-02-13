import 'package:flutter/material.dart';
import '../../../core/theme/app_style.dart';
import 'custom_switch.dart';

class BuildSkillRow extends StatelessWidget {
  const BuildSkillRow({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });
  final String title;
  final bool isSelected;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Text(title, style: AppStyle.font25WhiteBold),
          const Spacer(),
          CustomSwitch(
            // value: isSelected,
            // onChanged: (val) {
            //   setState(() {
            //     selectedSkill = val ? widget.title : "";
            //   });
            // },
            value: isSelected,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
