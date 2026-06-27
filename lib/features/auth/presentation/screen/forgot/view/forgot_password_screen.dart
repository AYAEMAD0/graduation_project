import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/arrow_button.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../viewmodel/forgot_password_cubit.dart';
import '../viewmodel/forgot_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final horizontalPadding = isMobile ? 22.0 : 60.0;
    final titleFontSize = isMobile ? 25.0 : 35.0;
    final subtitleFontSize = isMobile ? 16.0 : 23.0;
    final spacingSmall = isMobile ? 15.0 : 20.0;
    final spacingMedium = isMobile ? 30.0 : 50.0;
    final fieldWidth = isMobile ? double.infinity : 700.0;

    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: horizontalPadding,
            ),
            child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, state) {
                if (state.error != null) {
                  Fluttertoast.showToast(msg: state.error!);
                } else if (state.isSuccess) {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.forgotOtp,
                    arguments: emailController.text,
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ArrowButton(),
                    SizedBox(height: spacingSmall),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Forgot password",
                                style: AppStyle.font40BlackSemiBold
                                    .copyWith(fontSize: titleFontSize),
                              ),
                              SizedBox(height: spacingSmall),
                              Text(
                                "Please enter your email to reset the password",
                                style: AppStyle.font25GrayMediumSemiBold
                                    .copyWith(fontSize: subtitleFontSize),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: spacingMedium),
                              SizedBox(
                                width: fieldWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: AppStyle.font20BlackSemiBold
                                          .copyWith(fontSize: subtitleFontSize),
                                    ),
                                    SizedBox(height: spacingSmall),
                                    CustomTextField(
                                      hint: "Enter your email address",
                                      prefixIcon: Icons.email_outlined,
                                      controller: emailController,
                                    ),
                                    SizedBox(height: spacingMedium),
                                  ],
                                ),
                              ),
                              state.isLoading
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      text: "Reset Password",
                                      onPressed: () {
                                        if (emailController.text.isNotEmpty) {
                                          context.read<ForgotPasswordCubit>().sendOtp(emailController.text);
                                        }
                                      },
                                    ),
                            ],
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
