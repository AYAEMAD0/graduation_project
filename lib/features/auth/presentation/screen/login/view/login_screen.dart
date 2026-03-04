import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/config/di.dart';
import 'package:mock_mate_ai/core/widget/custom_dialog.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/helper/jwt_helper.dart';
import '../../../../../../core/helper/shared_check_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_color.dart';
import '../viewModel/login_cubit.dart';
import '../viewModel/login_state.dart';
import '../widget/build_body_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final horizontalPadding = isMobile ? 20.0 : 60.0;

    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: IgnorePointer(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: isMobile ? -80 : -60,
                        left: isMobile ? -120 : -300,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 100,
                              sigmaY: 100),
                          child: Container(
                            width: isMobile ? 400 : 800,
                            height: isMobile ? 500 : 700,
                            decoration: BoxDecoration(
                              color: AppColor.homeEffectBlue.withValues(
                                alpha: 0.15,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: -100,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 300,
                              sigmaY: 100),
                          child: Container(
                            width: isMobile ? 300 : 600,
                            height: isMobile ? 300 : 600,
                            decoration: BoxDecoration(
                              color: Color(0xffE2ECF1).withValues(alpha: 0.90),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: -150,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 600,
                              sigmaY: 400),
                          child: Container(
                            width: isMobile ? 300 : 1500,
                            height: isMobile ? 300 : 900,
                            decoration: BoxDecoration(
                              color: AppColor.grayColor.withValues(alpha: 0.18),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -150,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 100,
                              sigmaY: 100),
                          child: Container(
                            width: isMobile ? 400 : 900,
                            height: isMobile ? 400 : 900,
                            decoration: BoxDecoration(
                              color: AppColor.purple.withValues(alpha: 0.16),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 500,
                      ),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) async {
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
                            await SharedCheckHelper.setValue(
                                SharedCheckHelper.keyAccessToken, token);
                            if (userId != null) {
                              await SharedCheckHelper.setValue(
                                  SharedCheckHelper.keyUserId, userId);
                            }
                            if (!context.mounted) return;
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
                          return BuildBodySection(viewmodel: viewmodel,);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
