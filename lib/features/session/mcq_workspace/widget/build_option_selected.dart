import 'package:flutter/material.dart';

class BuildOptionSelected extends StatelessWidget {
  const BuildOptionSelected({
    super.key,
    required this.isSelected,
    required this.optionText,
    this.isDisabled = false,
  });

  final bool isSelected;
  final String optionText;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: isDisabled
                    ? [Color(0xffF8F8F8), Color(0xffF0F0F0)] // ← فاتح ناعم
                    : [Color(0xffF3EDFF), Color(0xffE8DEFF)],
              )
            : LinearGradient(
                colors: isDisabled
                    ? [Color(0xffFAFAFA), Color(0xffFAFAFA)] // ← أبيض شفاف
                    : [Colors.white, Colors.white],
              ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDisabled
              ? Color(0xffE0E0E0) // ← border رمادي فاتح للكل
              : isSelected
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
                  ? (isDisabled ? Color(0xffCCCCCC) : Color(0xffAA88F5))
                  : Colors.transparent,
              border: Border.all(
                color: isDisabled ? Color(0xffCCCCCC) : Color(0xffAA88F5),
                width: 4.68,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 18,
                      height: 18,
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
                fontSize: 22,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isDisabled ? Color(0xff9E9E9E) : Color(0xff111827),
              ),
            ),
          ),
          if (isSelected)
            Container(
              width: 40.66,
              height: 40.66,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDisabled ? Color(0xffCCCCCC) : Color(0xffAA88F5),
                  width: 5,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 25,
                  color: isDisabled ? Color(0xffCCCCCC) : Color(0xffAA88F5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
