import 'package:flutter/material.dart';

class BuildOptionSelected extends StatelessWidget {
  const BuildOptionSelected({
    super.key,
    required this.isSelected,
    required this.optionText,
  });

  final bool isSelected;
  final String optionText;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: isDark
                    ? [const Color(0xff2A1B4E), const Color(0xff1F123D)]
                    : [const Color(0xffF3EDFF), const Color(0xffE8DEFF)],
              )
            : LinearGradient(
                colors: isDark
                    ? [Theme.of(context).cardColor, Theme.of(context).cardColor]
                    : [Colors.white, Colors.white],
              ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected
              ? const Color(0xffAA88F5)
              : (isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : const Color(0x1AA806F9)),
          width: 2,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: isDark ? const Color(0x55000000) : const Color(0x227B5BEE),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xffAA88F5) : Colors.transparent,
              border: Border.all(
                color: isDark && !isSelected
                    ? Colors.white.withValues(alpha: 0.3)
                    : const Color(0xffAA88F5),
                width: 4.68,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? const Color(0xff1F123D) : Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              optionText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isDark ? Colors.white : const Color(0xff111827),
              ),
            ),
          ),
          if (isSelected)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffAA88F5), width: 5),
              ),
              child: const Center(
                child: Icon(Icons.check, size: 22, color: Color(0xffAA88F5)),
              ),
            ),
        ],
      ),
    );
  }
}
