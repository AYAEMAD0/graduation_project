import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/widget/main_background.dart';
import 'package:mock_mate_ai/core/widget/scroll_animate.dart';
import 'package:mock_mate_ai/features/main/tabs/faq/data/faq_model.dart';
import 'package:mock_mate_ai/features/main/tabs/faq/widget/card_faq.dart';

class FaqTab extends StatelessWidget {
  const FaqTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScrollAnimate(
              direction: SlideDirection.up,
              child: const Text(
                "FAQ",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 6),

            ScrollAnimate(
              direction: SlideDirection.up,
              delay: const Duration(milliseconds: 100),
              child: const Text(
                "Choose the format that best matches your upcoming interview. You can switch modes later.",
                style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  color: Color(0xff64748B),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: List.generate(FaqModel.data.length, (index) {
                final fromLeft = index % 2 == 0;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ScrollAnimate(
                    direction: fromLeft
                        ? SlideDirection.left
                        : SlideDirection.right,
                    delay: Duration(milliseconds: 80 * index),
                    child: CardFaq(
                      title: FaqModel.data[index].title,
                      desc: FaqModel.data[index].des,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
