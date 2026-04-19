import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../../core/constants/app_asset.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_style.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../viewModel/login_cubit.dart';
import 'build_have_account_section.dart';

class BuildBodySection extends StatelessWidget {
  const BuildBodySection({
    super.key,
    required this.viewmodel,
    required this.isLoading,
  });

  final LoginCubit viewmodel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final logoWidth = isMobile ? 180.0 : 200.0;
    final spacingMedium = isMobile ? 25.0 : 30.0;
    final textFontSize = isMobile ? 24.0 : 40.0;
    return Form(
      key: viewmodel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAsset.logoAppImage,
            width: logoWidth,
            height: 120,
            fit: BoxFit.contain,
          ),
          Text(
            "Welcome back!",
            style: AppStyle.font24BlackBold.copyWith(fontSize: textFontSize),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacingMedium),
          CustomTextField(
            controller: viewmodel.emailController,
            hint: "Email",
            prefixIcon: Icons.email_outlined,
          ),
          SizedBox(height: spacingMedium),
          CustomTextField(
            controller: viewmodel.passwordController,
            hint: "Password",
            prefixIcon: Icons.lock_outline,
            obscure: !viewmodel.isShowPassword,
            onSuffixTap: () {
              //todo show password
              viewmodel.togglePassword();
            },
            suffixIcon: viewmodel.isShowPassword
                ? Icons.visibility
                : Icons.visibility_off_sharp,
          ),
          SizedBox(height: spacingMedium),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
              child: Text(
                "Forgot Password?",
                style: AppStyle.font14GrayMedium.copyWith(
                  fontSize: isMobile ? 14.0 : 16.0,
                ),
              ),
            ),
          ),
          SizedBox(height: spacingMedium),
          CustomButton(
            widthBtn: isMobile ? 250 : 380,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : null,
            text: isLoading ? "" : "LOG IN",
            onPressed: isLoading
                ? null
                : () {
                    viewmodel.login();
                  },
          ),
          SizedBox(height: spacingMedium),
          BuildHaveAccountSection(),
        ],
      ),
    );
  }
}
