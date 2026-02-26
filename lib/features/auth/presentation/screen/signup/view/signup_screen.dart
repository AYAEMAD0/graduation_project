import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../../core/config/di.dart';
import '../../../../../../core/widget/custom_dialog.dart';
import '../viewmodel/signup_cubit.dart';
import '../widget/build_bottom_already.dart';
import '../widget/build_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final horizontalPadding = isMobile ? 15.0 : 50.0;
    final logoWidth = isMobile ? 150.0 : 188.0;
    final logoHeight = isMobile ? 105.0 : 115.0;
    final spacingSmall = isMobile ? 10.0 : 15.0;
    final spacingMedium = isMobile ? 15.0 : 20.0;
    final spacingLarge = isMobile ? 30.0 : 50.0;
    final titleFontSize = isMobile ? 24.0 : 34.0;

    return BlocProvider(
      create: (_) => getIt<SignupCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: spacingMedium,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 500,
                ),
                child: BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is SignupError) {
                      CustomDialog.hideLoading(context: context);
                      CustomDialog.showMessage(
                        context: context,
                        title: 'Error',
                        message: state.messageError,
                        nagActionName: 'Cancel',
                      );
                    } else if (state is SignupValidationError) {
                      final firstError = state.errors.values.first.first;
                      CustomDialog.hideLoading(context: context);
                      CustomDialog.showMessage(
                        context: context,
                        title: 'Validation Error',
                        message: firstError,
                        nagActionName: 'Cancel',
                      );
                    } else if (state is SignupLoading) {
                      CustomDialog.showLoading(context: context);
                    } else if (state is SignupSuccess) {
                      CustomDialog.hideLoading(context: context);
                      CustomDialog.showMessage(
                        context: context,
                        title: 'Successfully',
                        message: 'Signup Successfully',
                        posActionName: 'Ok',
                        posActionClick: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.home,
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    final viewmodel = context.read<SignupCubit>();
                    return Form(
                      key: viewmodel.formKey,
                      child: Column(
                        children: [
                          Image.asset(
                            AppAsset.logoAppImage,
                            width: logoWidth,
                            height: logoHeight,
                          ),
                          SizedBox(height: spacingSmall),
                          Text(
                            "Let’s Get Started!",
                            style: AppStyle.font24BlackBold.copyWith(
                              fontSize: titleFontSize,
                            ),
                          ),
                          SizedBox(height: spacingMedium),
                          BuildForm(viewmodel: viewmodel,),
                          SizedBox(height: spacingMedium),
                          CustomButton(
                            text: "CREATE ACCOUNT",
                            onPressed: () {
                              viewmodel.signup();
                            },
                          ),
                          SizedBox(height: spacingLarge),
                          BuildBottomAlready(),
                          SizedBox(height: spacingSmall),
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
