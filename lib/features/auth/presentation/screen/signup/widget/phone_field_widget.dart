import 'package:flutter/material.dart';

import '../../../../../../core/helper/country_code_model.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import 'country_picker_sheet.dart';

class PhoneFieldWidget extends StatefulWidget {
  const PhoneFieldWidget({
    super.key,
    required this.controller,
    required this.onCountryChanged,
    this.initialCountryCode = "+20",
  });

  final TextEditingController controller;
  final ValueChanged<String> onCountryChanged;
  final String initialCountryCode;

  @override
  State<PhoneFieldWidget> createState() => _PhoneFieldWidgetState();
}

class _PhoneFieldWidgetState extends State<PhoneFieldWidget> {
  late CountryCodeModel _selected;

  @override
  void initState() {
    super.initState();
    _selected = countryCodes.firstWhere(
      (c) => c.code == widget.initialCountryCode,
      orElse: () => countryCodes.first,
    );
  }

  void _openPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.whiteDarkColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => CountryPickerSheet(
        selected: _selected,
        onSelect: (country) {
          setState(() => _selected = country);
          widget.onCountryChanged(country.code);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Phone Number",
      controller: widget.controller,
      keyboard: TextInputType.phone,
      prefixWidget: GestureDetector(
        // ← prefixWidget مش prefixIcon
        onTap: _openPicker,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_selected.flag, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 4),
              Text(
                _selected.code,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(Icons.arrow_drop_down, size: 18),
              Container(
                width: 1,
                height: 24,
                margin: const EdgeInsets.only(left: 8),
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
