import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_dialog.dart';
import 'package:mock_mate_ai/core/widget/custom_text_field.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/viewModel/login_cubit.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/login/viewModel/login_state.dart';
import '../../../../../../core/helper/jwt_helper.dart';
import '../../../../../../core/helper/shared_check_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../widget/build_social_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final logoWidth = isMobile ? 180.0 : 200.0;
    final horizontalPadding = isMobile ? 20.0 : 60.0;
    final spacingMedium = isMobile ? 25.0 : 30.0;
    final spacingLarge = isMobile ? 30.0 : 50.0;
    final textFontSize = isMobile ? 24.0 : 34.0;

    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 500,
                ),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) async{
                    if (state is LoginLoading) {
                      CustomDialog.showLoading(context: context);
                    } else if (state is LoginError) {
                      CustomDialog.hideLoading(context: context);
                      CustomDialog.showMessage(
                        context: context,
                        message: state.messageError,
                        title: "Error",
                        nagActionName: "Cancel",
                      );
                    } else if (state is LoginValidationError) {
                      CustomDialog.hideLoading(context: context);
                      final firstError = state.errors.values.first.first;
                      CustomDialog.showMessage(
                        context: context,
                        message: firstError,
                        title: "Validation Error",
                        nagActionName: "Cancel",
                      );
                    } else if (state is LoginSuccess) {
                      final token = state.data.accessToken;
                      final userId = JwtHelper.getUserIdFromToken(token);
                      await SharedCheckHelper.setValue(SharedCheckHelper.keyAccessToken, token);
                      if (userId != null) {
                        await SharedCheckHelper.setValue(SharedCheckHelper.keyUserId, userId);
                      }
                      CustomDialog.hideLoading(context: context);
                      CustomDialog.showMessage(
                        context: context,
                        title: "Successfully",
                        message: "Login Successfully",
                        posActionName: "Ok",
                        posActionClick: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.home,
                            (route) => false,
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    final viewmodel = context.read<LoginCubit>();
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
                            style: AppStyle.font24BlackBold.copyWith(
                              fontSize: textFontSize,
                            ),
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
                            suffixIcon:viewmodel.isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off_sharp,
                          ),
                          SizedBox(height: spacingMedium),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.forgotPassword,
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: AppStyle.font14GrayMedium.copyWith(
                                  fontSize: isMobile ? 14.0 : 16.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: spacingLarge),
                          CustomButton(
                            text: "LOG IN",
                            onPressed: () {
                              viewmodel.login();
                            },
                          ),

                          SizedBox(height: spacingMedium),
                          BuildSocialSection(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
