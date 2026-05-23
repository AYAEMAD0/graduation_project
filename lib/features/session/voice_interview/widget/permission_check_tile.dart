import 'package:flutter/material.dart';

import '../../../../core/theme/app_style.dart';

class PermissionCheckTile extends StatelessWidget {
  final bool isAllowed;
  final bool isChecking;
  final String title;
  final String allowedSubtitle;
  final String deniedSubtitle;
  final IconData icon;
  final Color accentColor;
  final Future<void> Function() onAllow;

  const PermissionCheckTile({
    super.key,
    required this.isAllowed,
    required this.isChecking,
    required this.title,
    required this.allowedSubtitle,
    required this.deniedSubtitle,
    required this.icon,
    required this.accentColor,
    required this.onAllow,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff121624) : Colors.black12,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.04)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isAllowed
                  ? Colors.green.withValues(alpha: 0.2)
                  : accentColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isAllowed ? Icons.check_circle : icon,
              color: isAllowed ? Colors.green : accentColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAllowed ? '$title Ready' : '$title Access Required',
                  style: AppStyle.font18BlackSemiBold.copyWith(
                    fontSize: 16,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isAllowed ? allowedSubtitle : deniedSubtitle,
                  style: AppStyle.font12Black87.copyWith(
                    color: isDark
                        ? Colors.grey.shade400
                        : const Color(0xff475569),
                  ),
                ),
              ],
            ),
          ),
          if (!isAllowed)
            ElevatedButton(
              onPressed: isChecking ? null : onAllow,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              child: isChecking
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Allow',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
            ),
        ],
      ),
    );
  }
}
