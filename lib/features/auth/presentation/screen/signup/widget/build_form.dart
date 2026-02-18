import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../viewmodel/signup_cubit.dart';

class BuildForm extends StatelessWidget {
  const BuildForm({super.key, required this.viewmodel});
  final SignupCubit viewmodel;
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final spacingMedium = isMobile ? 15.0 : 20.0;
    bool isShowPassword = viewmodel.isShowPassword;
    return Column(
      children: [
        CustomTextField(
          hint: "Name",
          controller: viewmodel.nameController,
          prefixIcon: Icons.person,
        ),
        SizedBox(height: spacingMedium),
        CustomTextField(
          hint: "User Name",
          controller: viewmodel.userNameController,
          prefixIcon: Icons.person_outline_sharp,
        ),
        SizedBox(height: spacingMedium),
        CustomTextField(
          hint: "Phone",
          controller: viewmodel.phoneController,
          keyboard: TextInputType.phone,
          prefixText: "+20 ",
          prefixIcon: Icons.phone,
        ),
        SizedBox(height: spacingMedium),
        CustomTextField(
          hint: "Email",
          controller: viewmodel.emailController,
          prefixIcon: Icons.email_outlined,
        ),
        SizedBox(height: spacingMedium),
        CustomTextField(
          hint: "Password",
          controller: viewmodel.passwordController,
          prefixIcon: Icons.lock_outline,
          onSuffixTap: () {
            //todo show password
            viewmodel.togglePassword();
          },
          suffixIcon: isShowPassword
              ? Icons.visibility
              : Icons.visibility_off_sharp,
          obscure: !isShowPassword,
        ),
      ],
    );
  }
}
