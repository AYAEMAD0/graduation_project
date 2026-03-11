class QuestionParserHelper {
  static String description(String questionText) {
    final idx = questionText.indexOf('**Example');
    return idx != -1 ? questionText.substring(0, idx).trim() : questionText;
  }

  static String exampleInput(String questionText) {
    final reg = RegExp(r'Input:\s*(.+?)\s*Output:', dotAll: true);
    return reg.firstMatch(questionText)?.group(1)?.trim() ?? '';
  }

  static String exampleOutput(String questionText) {
    final reg = RegExp(
      r'Output:\s*(.+?)(?:\*\*|Explanation:|Constraints:|$)',
      dotAll: true,
    );
    return reg.firstMatch(questionText)?.group(1)?.trim() ?? '';
  }

  static String constraints(String questionText) {
    final reg = RegExp(r'\*\*Constraints:\*\*(.+?)$', dotAll: true);
    return reg.firstMatch(questionText)?.group(1)?.trim() ?? '';
  }
}
