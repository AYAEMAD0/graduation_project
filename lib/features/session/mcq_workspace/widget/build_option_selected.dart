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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
          colors: [Color(0xffF3EDFF), Color(0xffE8DEFF)],
              )
            : LinearGradient(
          colors: [Colors.white, Colors.white],
              ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected
              ? Color(0xffAA88F5)
              : const Color(0x1AA806F9),
          width: 2,
        ),
        boxShadow: [
          if (isSelected)
            const BoxShadow(
              color: Color(0x227B5BEE),
              blurRadius: 12,
              offset: Offset(0, 6),
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
              color: isSelected
                  ? Color(0xffAA88F5)
                  : Colors.transparent,
              border: Border.all(
                color: Color(0xffAA88F5),
                width: 4.68,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
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
                color: Color(0xff111827),
              ),
            ),
          ),
          if (isSelected)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xffAA88F5),
                  width: 5,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 22,
                  color: Color(0xffAA88F5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
