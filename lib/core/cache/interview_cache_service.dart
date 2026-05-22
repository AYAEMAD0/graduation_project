import 'package:hive/hive.dart';

class InterviewCacheService {
  static final Box _box = Hive.box('interviewBox');

  static const String sessionKey = 'interview_session';

  static Future<void> saveSession(Map<String, dynamic> data) async {
    await _box.put(sessionKey, data);
  }

  static Map<String, dynamic>? getSession() {
    final data = _box.get(sessionKey);

    if (data == null) {
      return null;
    }

    return Map<String, dynamic>.from(data);
  }

  static Future<void> clearSession() async {
    await _box.delete(sessionKey);
  }
}
