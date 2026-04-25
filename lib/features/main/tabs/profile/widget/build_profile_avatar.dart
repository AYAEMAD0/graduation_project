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
        double size = constraints.maxWidth * 0.25;
        if (size > 190) size = 100;
        if (size < 140) size = 100;
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size,
                height: size,
                padding: const EdgeInsets.all(5.62),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isMobile
                      ? AppColor.transparentColor
                      : const Color(0xA6A806F9),
                ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.whiteColor,
                    backgroundImage: currentImage,
                    child: currentImage == null
                        ? Icon(
                            Icons.person,
                            color: AppColor.blackColor,
                            size: isMobile ? 60 : 50,
                          )
                        : null,
                  ),
                ),
              Positioned(
                bottom: size * 0.07,
                right: size * 0.040,
                child: GestureDetector(
                  onTap: onEditTap,
                  child: Container(
                    width: size * 0.25,
                    height: size * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFA806F9),
                      border: Border.all(
                        color: const Color(0xFFA806F9),
                        width: size * 0.035,
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: size * 0.12,
                    ),
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
