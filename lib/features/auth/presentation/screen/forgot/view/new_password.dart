import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_style.dart';
import '../../../../../../core/widget/arrow_button.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../viewmodel/forgot_password_cubit.dart';
import '../viewmodel/forgot_password_state.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.isMobile;

    final horizontalPadding = isMobile ? 22.0 : 60.0;
    final verticalPadding = isMobile ? 24.0 : 40.0;
    final titleFontSize = isMobile ? 25.0 : 35.0;
    final descFontSize = isMobile ? 16.0 : 18.0;
    final fieldWidth = isMobile ? double.infinity : 500.0;
    final spacingMedium = isMobile ? 30.0 : 33.0;

    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ArrowButton(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: fieldWidth,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Set a new password",
                              style: AppStyle.font40BlackSemiBold
                                  .copyWith(fontSize: titleFontSize),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Create a new password. Ensure it differs from \nprevious ones for security",
                              style: AppStyle.font16GrayMediumMedium
                                  .copyWith(fontSize: descFontSize),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: spacingMedium),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: AppStyle.font16BlackSemiBold,
                              ),
                            ),
                            SizedBox(height: 12),
                            BlocBuilder<ForgotPasswordCubit,
                                ForgotPasswordState>(
                              builder: (context, state) {
                                return CustomTextField(
                                  hint: "Enter your new password",
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon: state.isPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  obscure: state.isPasswordObscure,
                                  onSuffixTap: () =>
                                      context
                                          .read<ForgotPasswordCubit>()
                                          .togglePassword(),
                                );
                              },
                            ),

                            SizedBox(height: spacingMedium),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Confirm Password",
                                style: AppStyle.font16BlackSemiBold,
                              ),
                            ),
                            SizedBox(height: 12),
                            BlocBuilder<ForgotPasswordCubit,
                                ForgotPasswordState>(
                              builder: (context, state) {
                                return CustomTextField(
                                  hint: "Re-enter password",
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon:
                                  state.isConfirmPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  obscure:
                                  state.isConfirmPasswordObscure,
                                  onSuffixTap: () =>
                                      context
                                          .read<ForgotPasswordCubit>()
                                          .toggleConfirmPassword(),
                                );
                              },
                            ),

                            SizedBox(height: spacingMedium),
                            CustomButton(
                              text: "Update Password",
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.successful);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}