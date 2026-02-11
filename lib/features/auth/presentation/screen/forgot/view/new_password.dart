import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                ArrowButton(),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Set a new password",
                        style: AppStyle.font20BlackSemiBold,
                      ),
                      SizedBox(height: 18),
                      Text(
                        "Create a new password. Ensure it differs from \nprevious ones for security",
                        style: AppStyle.font16GrayMediumMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 38),

                      SizedBox(
                        width: 900,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password", style: AppStyle.font16BlackSemiBold),
                            SizedBox(height: 15),
                            BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                              builder: (context, state) {
                                return CustomTextField(
                                  hint: "Enter your new password",
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon: state.isPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  obscure: state.isPasswordObscure,
                                  onSuffixTap: () => context
                                      .read<ForgotPasswordCubit>()
                                      .togglePassword(),
                                );
                              },
                            ),
                            SizedBox(height: 35),

                            Text(
                              "Confirm Password",
                              style: AppStyle.font16BlackSemiBold,
                            ),
                            SizedBox(height: 15),
                            BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                              builder: (context, state) {
                                return CustomTextField(
                                  hint: "Re-enter password",
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon: state.isConfirmPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  obscure: state.isConfirmPasswordObscure,
                                  onSuffixTap: () => context
                                      .read<ForgotPasswordCubit>()
                                      .toggleConfirmPassword(),
                                );
                              },
                            ),
                            SizedBox(height: 62),
                          ],
                        ),
                      ),
                      CustomButton(
                        text: "Update Password",
                        onPressed: () {
                          // Handle Update Password button press
                          Navigator.pushNamed(context, AppRoutes.successful);
                        },
                      ),
                    ],
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
