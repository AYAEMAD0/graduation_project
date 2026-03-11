import 'package:flutter/material.dart';

import '../../../core/constants/app_asset.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';
import '../model/session_arguments.dart';

class BuildSidebar extends StatefulWidget {
  const BuildSidebar({
    super.key,
    required this.args,
    required this.onTap,
    required this.onAllTap,
  });

  final SessionArguments args;
  final void Function(BuildContext, int) onTap;
  final void Function(BuildContext) onAllTap;

  @override
  State<BuildSidebar> createState() => _BuildSidebarState();
}

class _BuildSidebarState extends State<BuildSidebar> {
  final ScrollController _scrollController = ScrollController();
  static double itemHeight = 20.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentQuestion();
    });
  }

  @override
  void didUpdateWidget(BuildSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.args.currentQuestion != widget.args.currentQuestion) {
      _scrollToCurrentQuestion();
    }
  }

  void _scrollToCurrentQuestion() {
    final current = widget.args.currentQuestion;
    if (current <= 0) return;
    if (!_scrollController.hasClients) return;

    final offset = (current - 1) * itemHeight;
    _scrollController.animateTo(
      offset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xffF3F4F6)),
      child: Column(
        children: [
          Image.asset(AppAsset.logoAppImage, width: 60, height: 60),
          GestureDetector(
            onTap: () => widget.onAllTap(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: widget.args.currentQuestion == 0
                    ? const Color(0xffD5CDDD)
                    : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                "All",
                style: AppStyle.font16BlackSemiBold.copyWith(
                  color: widget.args.currentQuestion == 0
                      ? AppColor.primaryPurpleColor
                      : AppColor.grayMediumColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.args.totalQuestions,
              itemBuilder: (context, index) {
                final number = index + 1;
                final isActive = number == widget.args.currentQuestion;
                return GestureDetector(
                  onTap: () => widget.onTap(context, number),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    height: 50,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xffD5CDDD)
                          : Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "$number",
                      style: AppStyle.font16BlackSemiBold.copyWith(
                        color: isActive
                            ? AppColor.primaryPurpleColor
                            : AppColor.grayMediumColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}