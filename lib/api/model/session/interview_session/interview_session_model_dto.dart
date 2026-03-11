class InterviewSessionModelDto {
  InterviewSessionModelDto({
    this.interviewSessionId,
    this.mcqQuestions,
    this.codingQuestions,
  });

  InterviewSessionModelDto.fromJson(dynamic json) {
    interviewSessionId = json['interviewSessionId'];
    if (json['mcqQuestions'] != null) {
      mcqQuestions = [];
      json['mcqQuestions'].forEach((v) {
        mcqQuestions?.add(McqQuestionsModelDto.fromJson(v));
      });
    }
    if (json['codingQuestions'] != null) {
      codingQuestions = [];
      json['codingQuestions'].forEach((v) {
        codingQuestions?.add(CodingQuestionsModelDto.fromJson(v));
      });
    }
  }

  int? interviewSessionId;
  List<McqQuestionsModelDto>? mcqQuestions;
  List<CodingQuestionsModelDto>? codingQuestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['interviewSessionId'] = interviewSessionId;
    if (mcqQuestions != null) {
      map['mcqQuestions'] = mcqQuestions?.map((v) => v.toJson()).toList();
    }
    if (codingQuestions != null) {
      map['codingQuestions'] = codingQuestions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CodingQuestionsModelDto {
  CodingQuestionsModelDto({
    this.questionId,
    this.quesTitle,
    this.questionText,
    this.testCases,
    this.templates,
  });

  CodingQuestionsModelDto.fromJson(dynamic json) {
    questionId = json['questionId'];
    quesTitle = json['quesTitle'];
    questionText = json['questionText'];
    if (json['testCases'] != null) {
      testCases = [];
      json['testCases'].forEach((v) {
        testCases?.add(TestCasesModelDto.fromJson(v));
      });
    }
    if (json['templates'] != null) {
      templates = [];
      json['templates'].forEach((v) {
        templates?.add(TemplatesModelDto.fromJson(v));
      });
    }
  }

  int? questionId;
  String? quesTitle;
  String? questionText;
  List<TestCasesModelDto>? testCases;
  List<TemplatesModelDto>? templates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['quesTitle'] = quesTitle;
    map['questionText'] = questionText;
    if (testCases != null) {
      map['testCases'] = testCases?.map((v) => v.toJson()).toList();
    }
    if (templates != null) {
      map['templates'] = templates?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TemplatesModelDto {
  TemplatesModelDto({this.languageId, this.languageName, this.defualtCode});

  TemplatesModelDto.fromJson(dynamic json) {
    languageId = json['languageId'];
    languageName = json['languageName'];
    defualtCode = json['defualtCode'];
  }

  int? languageId;
  String? languageName;
  String? defualtCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['languageId'] = languageId;
    map['languageName'] = languageName;
    map['defualtCode'] = defualtCode;
    return map;
  }
}

class TestCasesModelDto {
  TestCasesModelDto({this.testCaseId, this.input, this.output});

  TestCasesModelDto.fromJson(dynamic json) {
    testCaseId = json['testCaseId'];
    input = json['input'];
    output = json['output'];
  }

  int? testCaseId;
  String? input;
  String? output;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['testCaseId'] = testCaseId;
    map['input'] = input;
    map['output'] = output;
    return map;
  }
}

class McqQuestionsModelDto {
  McqQuestionsModelDto({this.questionId, this.questionText, this.options});

  McqQuestionsModelDto.fromJson(dynamic json) {
    questionId = json['questionId'];
    questionText = json['questionText'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(OptionsModelDto.fromJson(v));
      });
    }
  }

  int? questionId;
  String? questionText;
  List<OptionsModelDto>? options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['questionText'] = questionText;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class OptionsModelDto {
  OptionsModelDto({this.optionId, this.optionText});

  OptionsModelDto.fromJson(dynamic json) {
    optionId = json['optionId'];
    optionText = json['optionText'];
  }

  int? optionId;
  String? optionText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['optionId'] = optionId;
    map['optionText'] = optionText;
    return map;
  }
}
