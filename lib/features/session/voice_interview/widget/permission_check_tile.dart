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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
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
                  style: AppStyle.font18BlackSemiBold,
                ),
                const SizedBox(height: 2),
                Text(
                  isAllowed ? allowedSubtitle : deniedSubtitle,
                  style: AppStyle.font12Black87,
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
