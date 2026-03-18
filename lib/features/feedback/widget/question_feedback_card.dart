import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/font_weight_helper.dart';

class QuestionFeedbackCard extends StatefulWidget {
  final int number;
  final String title;
  final String status;
  final String feedback;
  final String suggestion;
  final Color baseColor;


  const QuestionFeedbackCard({
    super.key,
    required this.number,
    required this.title,
    required this.status,
    required this.feedback,
    required this.suggestion,
    required this.baseColor,
  
  });

  @override
  State<QuestionFeedbackCard> createState() => _QuestionFeedbackCardState();
}

class _QuestionFeedbackCardState extends State<QuestionFeedbackCard> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //  height: 382,
      padding: const EdgeInsets.all(33.14),
      decoration: BoxDecoration(
        color: const Color(0xffA806F9).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16.57),
        border: Border.all(
          color: const Color(0xffA806F9).withValues(alpha: 0.20),
          width: 1.38,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: widget.baseColor.withValues(alpha: 0.20),
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.number.toString().padLeft(2, '0'),
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: widget.baseColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.title,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff1A1A2E),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: widget.baseColor.withValues(alpha: 0.20),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  widget.status,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: widget.baseColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                  color: const Color(0xff7C6BAE),
                ),
              ),
            ],
          ),
          if (_expanded) ...[
            const SizedBox(height: 24),
            Text(
              widget.feedback,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 22.09,
                height: 33.14 / 22.09,
                color: const Color(0xff3C473F),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFA806F9).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
                border: const Border(
                  left: BorderSide(color: Color(0xffA806F9), width: 4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppAsset.suggestion),
                      const SizedBox(width: 8),
                      Text(
                        "SUGGESTION",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeightHelper.bold,
                          letterSpacing: 1.5,
                          color: const Color(0xffA806F9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.suggestion,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.33,
                      height: 27.62 / 19.33,
                      color: const Color(0xff3C473F),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
