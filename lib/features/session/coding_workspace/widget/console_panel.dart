import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/run_code/run_code_cubit.dart';
import '../viewmodel/run_code/run_code_state.dart';

class ConsolePanel extends StatelessWidget {
  const ConsolePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunCodeCubit, RunCodeState>(
      builder: (context, state) {
        final isLoading = state is RunCodeLoading;

        final output = state is RunCodeSuccess
            ? '${state.response.status == 'Passed' ? '✅' : '❌'} ${state.response.status}\n'
                  '📤 Output: ${state.response.output}'
                  '${state.response.error != null ? '\n❗ Error: ${state.response.error}' : ''}'
            : state is RunCodeError
            ? '❌ ${state.message}'
            : '';

        return Container(
          height: 200,
          decoration: const BoxDecoration(
            color: Color(0xFF0E141E),
            border: Border(top: BorderSide(color: Colors.white24)),
          ),
          child: Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white54),
                    )
                  : Text(
                      output.isEmpty ? 'No output' : output,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
