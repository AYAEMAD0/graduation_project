import 'package:flutter/material.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import 'build_option_selected.dart';

class McqOptionsList extends StatelessWidget {
  final List<McqOptionEntity> options;
  final int? selectedIndex;
  final void Function({required int index, required int optionId}) onSelect;

  const McqOptionsList({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(options.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () =>
                onSelect(index: index, optionId: options[index].optionId),
            child: BuildOptionSelected(
              isSelected: selectedIndex == index,
              optionText: options[index].optionText,
            ),
          ),
        );
      }),
    );
  }
}
