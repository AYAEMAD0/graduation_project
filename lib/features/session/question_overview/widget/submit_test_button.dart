import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/core/widget/custom_button.dart';
import 'package:mock_mate_ai/core/widget/custom_toast.dart';
import 'package:mock_mate_ai/features/session/question_overview/viewmodel/submit_answer_cubit.dart';
import 'package:mock_mate_ai/features/session/question_overview/viewmodel/submit_answer_state.dart';

class SubmitTestButton extends StatelessWidget {
  final int sessionId;

  const SubmitTestButton({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubmitAnswerCubit, SubmitAnswerState>(
      listener: (context, state) {
        if (state is SubmitAnswerSuccess) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.feedback,
            arguments: sessionId, 
          );
        }
        if (state is SubmitAnswerError) {
          CustomToast.showToast(message: state.message, context: context);
        }
      },

      builder: (context, state) {
        return CustomButton(
          gradient: AppGradient.primaryGradient,
          onPressed: state is SubmitAnswerLoading
              ? null
              : () {
                  context.read<SubmitAnswerCubit>().submitAnswer(sessionId);
                },
          widthBtn: 300,
          height: 60,
          borderRadius: 20,
          hasShadow: true,
          child: state is SubmitAnswerLoading
              ? Center(child: const CircularProgressIndicator(color: Colors.white))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Submit Test", style: AppStyle.font18WhiteBold),
                    const SizedBox(width: 12),
                    const Icon(Icons.check_circle, color: Colors.white),
                  ],
                ),
        );
      },
    );
  }
}
