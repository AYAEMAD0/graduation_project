import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../../core/widget/custom_dialog.dart';
import '../viewmodel/signup_cubit.dart';
import '../widget/build_bottom_already.dart';
import '../widget/build_form.dart';

class BuildBodySignupSection extends StatelessWidget {
  const BuildBodySignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final horizontalPadding = isMobile ? 15.0 : 50.0;
    final logoWidth = isMobile ? 150.0 : 170.0;
    final logoHeight = isMobile ? 105.0 : 105.0;
    final spacingMedium = isMobile ? 15.0 : 20.0;
    final spacingLarge = isMobile ? 30.0 : 25.0;
    final titleFontSize = isMobile ? 24.0 : 34.0;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 500,
            ),
            child: BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupError) {
                  CustomDialog.showMessage(
                    context: context,
                    title: 'Error',
                    message: state.messageError,
                    nagActionName: 'Cancel',
                  );
                } else if (state is SignupValidationError) {
                  final firstError = state.errors.values.first.first;
                  CustomDialog.showMessage(
                    context: context,
                    title: 'Validation Error',
                    message: firstError,
                    nagActionName: 'Cancel',
                  );
                } else if (state is SignupSuccess) {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
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
                      //   SizedBox(height: spacingSmall),
                      Text(
                        "Let’s Get Started!",
                        style: AppStyle.font24BlackBold.copyWith(
                          fontSize: titleFontSize,
                        ),
                      ),
                      SizedBox(height: spacingMedium),
                      BuildForm(viewmodel: viewmodel),
                      SizedBox(height: spacingLarge),
                    CustomButton(
                      text: state is SignupLoading ? "" : "CREATE ACCOUNT",
                      widthBtn: isMobile ? 250 : 380,
                      child: state is SignupLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                          : null,
                      onPressed: state is SignupLoading
                          ? null
                          : () {
                        viewmodel.signup();
                      },
                    ),
                      SizedBox(height: spacingMedium),
                      BuildBottomAlready(isLoading: state is SignupLoading),
                      SizedBox(height: spacingMedium),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
