import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_style.dart';
import '../../../../../core/widget/custom_text_field.dart';

class BuildPersonInfoSection extends StatelessWidget {
  const BuildPersonInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Personal Information",
                style: AppStyle.font24BlackBold.copyWith(
                  color: Color(0xFFA806F9,),
                  fontSize: isMobile?20:24
                ),
              ),
              Text(
                "Edit",
                style: AppStyle.font16BlackMedium.copyWith(
                  fontSize: isMobile?16:20,
                  color: Color(0xFFA806F9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(
            thickness: 1.2,
            color: Colors.black.withValues(alpha: .1),
          ),
          const SizedBox(height: 20),
          Text(
            "Full Name",
            style: AppStyle.font18BlackRegular.copyWith(
              fontSize: 20,
              color: Color(0xffBD85F8),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "Alex Chen",
            fillColor: Color(0x80C0BFC0),
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 18),
          Text(
            "Phone Number",
            style: AppStyle.font18BlackRegular.copyWith(
              fontSize: 20,
              color: Color(0xffBD85F8),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "+2011*****53",
            fillColor: Color(0x80C0BFC0),
            prefixIcon: Icons.phone,
            keyboard: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
