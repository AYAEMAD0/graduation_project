import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_color.dart';

class BuildProfileAvatar extends StatelessWidget {
  final ImageProvider? currentImage;
  final VoidCallback onEditTap;

  const BuildProfileAvatar({
    super.key,
    required this.currentImage,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth * 0.35;
        if (size > 371) size = 371;
        if (size < 140) size = 140;
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size,
                height: size,
                padding: const EdgeInsets.all(6.62),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isMobile ? AppColor.transparentColor : const Color(0xA6A806F9),
                  boxShadow: [
                    BoxShadow(color: Color(0x40000000), blurRadius: 165, spreadRadius: -39, offset: Offset(0, 82)),
                    BoxShadow(color: Color(0x66A806F9), spreadRadius: isMobile ? 1 : 6.62),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xA6A806F9), width: size * 0.035),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColor.whiteColor,
                    backgroundImage: currentImage,
                    child: currentImage == null
                        ? Icon(Icons.person, color: AppColor.blackColor, size: isMobile ? 70 : 120)
                        : null,
                  ),
                ),
              ),
              Positioned(
                bottom: size * 0.05,
                right: size * 0.010,
                child: GestureDetector(
                  onTap: onEditTap,
                  child: Container(
                    width: size * 0.28,
                    height: size * 0.28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFA806F9),
                      border: Border.all(color: const Color(0xFFA806F9), width: size * 0.035),
                    ),
                    child: Icon(Icons.edit, color: Colors.white, size: size * 0.14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}