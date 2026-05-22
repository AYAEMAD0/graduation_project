class InterviewSessionEntity {

  final int interviewSessionId;

  final List<CodingQuestionEntity>
  codingQuestions;

  final List<McqQuestionEntity>
  mcqQuestions;

  const InterviewSessionEntity({

    required this.interviewSessionId,

    required this.codingQuestions,

    required this.mcqQuestions,
  });

  Map<String, dynamic> toJson() {

    return {

      "interviewSessionId":
      interviewSessionId,

      "codingQuestions":
      codingQuestions
          .map((e) => e.toJson())
          .toList(),

      "mcqQuestions":
      mcqQuestions
          .map((e) => e.toJson())
          .toList(),
    };
  }

  factory InterviewSessionEntity
      .fromJson(
       dynamic json,
      ) {

    return InterviewSessionEntity(

      interviewSessionId:
      json["interviewSessionId"],

      codingQuestions:
      (json["codingQuestions"]
      as List)

          .map(
            (e) =>
            CodingQuestionEntity
                .fromJson(e),
      )

          .toList(),

      mcqQuestions:
      (json["mcqQuestions"]
      as List)

          .map(
            (e) =>
            McqQuestionEntity
                .fromJson(e),
      )

          .toList(),
    );
  }
}

class CodingQuestionEntity {

  final int questionId;

  final String quesTitle;

  final String questionText;

  final List<TestCaseEntity>
  testCases;

  final List<CodeTemplateEntity>
  templates;

  const CodingQuestionEntity({

    required this.questionId,

    required this.quesTitle,

    required this.questionText,

    required this.testCases,

    required this.templates,
  });

  Map<String, dynamic> toJson() {

    return {

      "questionId":
      questionId,

      "quesTitle":
      quesTitle,

      "questionText":
      questionText,

      "testCases":
      testCases
          .map((e) => e.toJson())
          .toList(),

      "templates":
      templates
          .map((e) => e.toJson())
          .toList(),
    };
  }

  factory CodingQuestionEntity
      .fromJson(
     dynamic json,
      ) {

    return CodingQuestionEntity(

      questionId:
      json["questionId"],

      quesTitle:
      json["quesTitle"],

      questionText:
      json["questionText"],

      testCases:
      (json["testCases"]
      as List)

          .map(
            (e) =>
            TestCaseEntity
                .fromJson(e),
      )

          .toList(),

      templates:
      (json["templates"]
      as List)

          .map(
            (e) =>
            CodeTemplateEntity
                .fromJson(e),
      )

          .toList(),
    );
  }
}

class McqQuestionEntity {

  final int questionId;

  final String questionText;

  final List<McqOptionEntity>
  options;

  const McqQuestionEntity({

    required this.questionId,

    required this.questionText,

    required this.options,
  });

  Map<String, dynamic> toJson() {

    return {

      "questionId":
      questionId,

      "questionText":
      questionText,

      "options":
      options
          .map((e) => e.toJson())
          .toList(),
    };
  }

  factory McqQuestionEntity
      .fromJson(
    dynamic json,
      ) {

    return McqQuestionEntity(

      questionId:
      json["questionId"],

      questionText:
      json["questionText"],

      options:
      (json["options"]
      as List)

          .map(
            (e) =>
            McqOptionEntity
                .fromJson(e),
      )

          .toList(),
    );
  }
}

class McqOptionEntity {

  final int optionId;

  final String optionText;

  const McqOptionEntity({

    required this.optionId,

    required this.optionText,
  });

  Map<String, dynamic> toJson() {

    return {

      "optionId":
      optionId,

      "optionText":
      optionText,
    };
  }

  factory McqOptionEntity
      .fromJson(
      dynamic json,
      ) {

    return McqOptionEntity(

      optionId:
      json["optionId"],

      optionText:
      json["optionText"],
    );
  }
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

  Map<String, dynamic> toJson() {

    return {

      "testCaseId":
      testCaseId,

      "input":
      input,

      "output":
      output,
    };
  }

  factory TestCaseEntity
      .fromJson(
     dynamic json,
      ) {

    return TestCaseEntity(

      testCaseId:
      json["testCaseId"],

      input:
      json["input"],

      output:
      json["output"],
    );
  }
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

  Map<String, dynamic> toJson() {

    return {

      "languageId":
      languageId,

      "languageName":
      languageName,

      "defaultCode":
      defaultCode,
    };
  }

  factory CodeTemplateEntity
      .fromJson(
    dynamic json,
      ) {

    return CodeTemplateEntity(

      languageId:
      json["languageId"],

      languageName:
      json["languageName"],

      defaultCode:
      json["defaultCode"],
    );
  }
}