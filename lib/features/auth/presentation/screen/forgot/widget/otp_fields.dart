import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OtpFields extends StatefulWidget {
  final int? otpLength;
  const OtpFields({super.key, this.otpLength});

  @override
  State<OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> {
  int get otpLength => widget.otpLength ?? 6;

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      _pasteCode(value);
      return;
    }
    if (value.isNotEmpty && index < otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void _pasteCode(String code) {
    for (int i = 0; i < otpLength; i++) {
      controllers[i].text = i < code.length ? code[i] : '';
    }
    focusNodes.last.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final fontSize = isMobile ? 16.0 : 18.0;
    final fieldHeight = isMobile ? 50.0 : 75.0;

    return Row(
      children: List.generate(
        otpLength,
            (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8: 14),
            child: _otpField(index, fieldHeight, fontSize),
          ),
        ),
      ),
    );
  }


  Widget _otpField(int index, double height, double fontSize) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: AppStyle.font18BlackRegular.copyWith(fontSize: fontSize),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (value) => _onChanged(value, index),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColor.unactiveBorder,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColor.primaryBlueColor,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
