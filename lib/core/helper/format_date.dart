class FormatDate {
  static String formatDate(String dateStr) {
    if (dateStr.isEmpty) return "-";

    try {
      final date = DateTime.parse("${dateStr}Z").toLocal();
      //todo final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.isNegative) {
        return "${date.day}/${date.month}/${date.year}";
      }

      if (difference.inMinutes < 1) {
        return "Just now";
      } else if (difference.inMinutes < 60) {
        return "${difference.inMinutes}m ago";
      } else if (difference.inHours < 24) {
        return "${difference.inHours}h ago";
      } else if (difference.inDays < 7) {
        return "${difference.inDays}d ago";
      } else {
        return "${date.day}/${date.month}/${date.year}";
      }
    } catch (e) {
      return "-";
    }
  }
}