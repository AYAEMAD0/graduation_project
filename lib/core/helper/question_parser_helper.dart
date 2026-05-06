class QuestionParserHelper {
  static String cleanText(String text) {
    return text.replaceAll('**', '').replaceAll('`', '').trim();
  }

  static String description(String text) {
    final exampleIndex = text.toLowerCase().indexOf('example');
    final result = exampleIndex == -1
        ? text.trim()
        : text.substring(0, exampleIndex).trim();
    return cleanText(result);
  }

  static String exampleInput(String text) {
    final reg = RegExp(
      r'Input:\s*(.*?)(?=Output:)',
      dotAll: true,
      caseSensitive: false,
    );
    final match = reg.firstMatch(text);
    if (match != null) {
      return cleanText(match.group(1)!);
    }
    return '';
  }

  static String exampleOutput(String text) {
    final reg = RegExp(
      r'Output:\s*(.*?)(?=Explanation:|Constraints:|$)',
      dotAll: true,
      caseSensitive: false,
    );
    final match = reg.firstMatch(text);
    if (match != null) {
      return cleanText(match.group(1)!);
    }
    return '';
  }

  static String constraints(String text) {
    final reg = RegExp(
      r'Constraints:\s*(.*)$',
      dotAll: true,
      caseSensitive: false,
    );
    final match = reg.firstMatch(text);
    if (match != null) {
      return cleanText(match.group(1)!);
    }
    return '';
  }
}
