import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/widget/custom_text_field.dart';

class BuildProfilePersonalInfo extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneController;

  const BuildProfilePersonalInfo({
    super.key,
    required this.fullNameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff121624) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.04) : Colors.transparent,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: .4)
                : Colors.black.withValues(alpha: .1),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Information",
            style: AppStyle.font24BlackBold.copyWith(
              color: isDark ? Colors.white : const Color(0xFFA806F9),
              fontSize: isMobile ? 20 : 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Full Name",
            style: AppStyle.font18BlackRegular.copyWith(
              fontSize: 20,
              color: isDark ? Colors.white : const Color(0xffBD85F8),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "Name",
            controller: fullNameController,
            fillColor: isDark
                ? const Color(0xff1A1F31)
                : const Color(0x80C0BFC0),
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 18),
          Text(
            "Phone Number",
            style: AppStyle.font18BlackRegular.copyWith(
              fontSize: 20,
              color: isDark ? Colors.white : const Color(0xffBD85F8),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "+20 11*****53",
            controller: phoneController,
            fillColor: isDark
                ? const Color(0xff1A1F31)
                : const Color(0x80C0BFC0),
            prefixIcon: Icons.phone,
            keyboard: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}