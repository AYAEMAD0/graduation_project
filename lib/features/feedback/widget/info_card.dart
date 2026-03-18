import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String headerIcon;
  final String title;
  final List<String> descriptions;
  final IconData descriptionIcon;
  final Color descriptionIconColor;
  final double descriptionIconSize;
  final Color borderLeftColor;
  final Color borderColor;
  final Color? backgroundColor;

  const InfoCard({
    super.key,
    required this.headerIcon,
    required this.title,
    required this.descriptions,
    required this.descriptionIcon,
    this.borderLeftColor = const Color(0x33A806F9),
    this.borderColor = const Color(0x33A806F9),
    this.backgroundColor,
    required this.descriptionIconColor, required this.descriptionIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(33.14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.57),
          border: Border(
            top: BorderSide(color: borderColor, width: 1.38),
            right: BorderSide(color: borderColor, width: 1.38),
            bottom: BorderSide(color: borderColor, width: 1.38),
            left: BorderSide(color: borderLeftColor, width: 5.52),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SvgPicture.asset(headerIcon, width: 23, height: 23),
                const SizedBox(width: 11.05),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 27.62,
                    height: 1.4,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33.14),
            ...List.generate(
              descriptions.length,
              (i) => Column(
                children: [
                  _InfoCardListItem(
                    iconColor: descriptionIconColor,
                    icon: descriptionIcon,
                    text: descriptions[i], size: descriptionIconSize,
                  ),
                  if (i != descriptions.length - 1)
                    const SizedBox(height: 22.09),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCardListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double size;
  const _InfoCardListItem({
    required this.icon,
    required this.text,
    required this.iconColor, required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: size, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 22.09,
              height: 1.5,
              color: Color(0xff3C473F),
            ),
          ),
        ),
      ],
    );
  }
}
