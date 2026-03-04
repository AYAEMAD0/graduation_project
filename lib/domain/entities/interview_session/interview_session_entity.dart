class InterviewSessionEntity {
  final int interviewSessionId;
  final List<CodingQuestionEntity> codingQuestions;
  final List<McqQuestionEntity> mcqQuestions; // ← typed now

  const InterviewSessionEntity({
    required this.interviewSessionId,
    required this.codingQuestions,
    required this.mcqQuestions,
  });
}

class CodingQuestionEntity {
  final int questionId;
  final String quesTitle;
  final String questionText;
  final List<TestCaseEntity> testCases;
  final List<CodeTemplateEntity> templates;

  const CodingQuestionEntity({
    required this.questionId,
    required this.quesTitle,
    required this.questionText,
    required this.testCases,
    required this.templates,
  });
}

class McqQuestionEntity {
  final int questionId;
  final String questionText;
  final List<McqOptionEntity> options;

  const McqQuestionEntity({
    required this.questionId,
    required this.questionText,
    required this.options,
  });
}

class McqOptionEntity {
  final int optionId;
  final String optionText;

  const McqOptionEntity({required this.optionId, required this.optionText});
}

class TestCaseEntity {
  final int testCaseId;
  final String input;
  final String output;

  const TestCaseEntity({
    required this.testCaseId,
    required this.input,
    required this.output,
  });
}

class CodeTemplateEntity {
  final int languageId;
  final String languageName;
  final String defaultCode;

  const CodeTemplateEntity({
    required this.languageId,
    required this.languageName,
    required this.defaultCode,
  });
}
