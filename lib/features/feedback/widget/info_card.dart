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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                SvgPicture.asset(headerIcon, width: 18, height: 18),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    height: 1.4,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...List.generate(
              descriptions.length,
                  (i) => Padding(
                padding: EdgeInsets.only(
                  bottom: i != descriptions.length - 1 ? 6 : 0,
                ),
                child: _InfoCardListItem(
                  iconColor: descriptionIconColor,
                  icon: descriptionIcon,
                  text: descriptions[i],
                  size: 14,
                ),
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
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 13,
              height: 1.2,
              color: Color(0xff3C473F),
            ),
          ),
        ),
      ],
    );
  }
}
