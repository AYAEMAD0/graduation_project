import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/session/run_code/run_code_response_entity.dart';
import '../viewmodel/run_code/run_code_cubit.dart';
import '../viewmodel/run_code/run_code_state.dart';
import 'error_banner.dart';
import 'summary_chip.dart';
import 'test_case_card.dart';

class ConsolePanel extends StatefulWidget {
  const ConsolePanel({super.key});

  @override
  State<ConsolePanel> createState() => _ConsolePanelState();
}

class _ConsolePanelState extends State<ConsolePanel> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunCodeCubit, RunCodeState>(
      builder: (context, state) => Container(
        //todo height: 220,
        decoration: const BoxDecoration(
          color: Color(0xFF0E141E),
          border: Border(top: BorderSide(color: Colors.white24)),
        ),
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all(Colors.white30),
            trackColor: WidgetStateProperty.all(Colors.white10),
            radius: const Radius.circular(4),
            thickness: WidgetStateProperty.all(4),
          ),
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
              child: _buildContent(state),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(RunCodeState state) {
    if (state is RunCodeLoading) {
      return const SizedBox(
        height: 80,
        child: Center(child: CircularProgressIndicator(color: Colors.white54)),
      );
    }
    if (state is RunCodeError) return ErrorBanner(message: state.message);
    if (state is RunCodeSuccess) return _ResultsView(response: state.response);
    return const _EmptyConsole();
  }
}

class _EmptyConsole extends StatelessWidget {
  const _EmptyConsole();

  @override
  Widget build(BuildContext context) => const Center(
    child: Text(
      'Run your code to see output here',
      style: TextStyle(color: Colors.white38, fontSize: 13),
    ),
  );
}

class _ResultsView extends StatelessWidget {
  final RunCodeResponseEntity response;

  const _ResultsView({required this.response});

  @override
  Widget build(BuildContext context) {
    final isPassed = response.status == 'Passed';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryChip(
          isPassed: isPassed,
          passed: response.passedTestCases,
          total: response.totalTestCases,
        ),
        const SizedBox(height: 10),
        ...response.testCaseResults.map((t) => TestCaseCard(testCase: t)),
      ],
    );
  }
}
