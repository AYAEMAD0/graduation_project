import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_style.dart';
import '../../../../../../core/widget/arrow_button.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../viewmodel/forgot_password_cubit.dart';
import '../viewmodel/forgot_password_state.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final email = args['email'] as String;
    final resetToken = args['resetToken'] as String;

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
            child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, state) {
                if (state.error != null) {
                  Fluttertoast.showToast(msg: state.error!);
                } else if (state.isSuccess) {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.successful, (route) => false);
                }
              },
              builder: (context, state) {
                return Column(
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
                                CustomTextField(
                                  hint: "Enter your new password",
                                  prefixIcon: Icons.lock_outline,
                                  controller: passwordController,
                                  suffixIcon: state.isPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  obscure: state.isPasswordObscure,
                                  onSuffixTap: () =>
                                      context
                                          .read<ForgotPasswordCubit>()
                                          .togglePassword(),
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
                                CustomTextField(
                                  hint: "Re-enter password",
                                  prefixIcon: Icons.lock_outline,
                                  controller: confirmPasswordController,
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
                                ),

                                SizedBox(height: spacingMedium),
                                state.isLoading
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      text: "Update Password",
                                      onPressed: () {
                                        if (passwordController.text.length < 8) {
                                          Fluttertoast.showToast(msg: "Password must be at least 8 characters long.");
                                          return;
                                        }
                                        if (passwordController.text != confirmPasswordController.text) {
                                          Fluttertoast.showToast(msg: "Passwords do not match.");
                                          return;
                                        }
                                        context.read<ForgotPasswordCubit>().submitNewPassword(email, resetToken, passwordController.text);
                                      },
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}