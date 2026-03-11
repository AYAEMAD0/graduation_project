import 'package:flutter/material.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';

class CodeToolbar extends StatelessWidget {
  final List<CodeTemplateEntity> templates;
  final CodeTemplateEntity selectedTemplate;
  final void Function(CodeTemplateEntity) onChanged;

  const CodeToolbar({
    super.key,
    required this.templates,
    required this.selectedTemplate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0xFF1C2333),
      child: Row(
        children: [
          const Icon(Icons.settings_outlined, color: Colors.white54, size: 18),
          const SizedBox(width: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton<CodeTemplateEntity>(
              value: selectedTemplate,
              dropdownColor: const Color(0xFF1C2333),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white54,
                size: 16,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (t) {
                if (t != null) onChanged(t);
              },
              items: templates
                  .map(
                    (t) =>
                        DropdownMenuItem(value: t, child: Text(t.languageName)),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
