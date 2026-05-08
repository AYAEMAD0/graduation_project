class AiInterviewSessionModel {
  AiInterviewSessionModel({
      this.interviewSessionId, 
      this.mcqQuestions, 
      this.codingQuestions,});

  AiInterviewSessionModel.fromJson(dynamic json) {
    interviewSessionId = json['interviewSessionId'];
    if (json['mcqQuestions'] != null) {
      mcqQuestions = [];
      json['mcqQuestions'].forEach((v) {
        mcqQuestions?.add(McqQuestions.fromJson(v));
      });
    }
    if (json['codingQuestions'] != null) {
      codingQuestions = [];
      json['codingQuestions'].forEach((v) {
        codingQuestions?.add(CodingQuestions.fromJson(v));
      });
    }
  }
  num? interviewSessionId;
  List<McqQuestions>? mcqQuestions;
  List<CodingQuestions>? codingQuestions;

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

class CodingQuestions {
  CodingQuestions({
      this.questionId, 
      this.quesTitle, 
      this.questionText, 
      this.testCases, 
      this.templates,});

  CodingQuestions.fromJson(dynamic json) {
    questionId = json['questionId'];
    quesTitle = json['quesTitle'];
    questionText = json['questionText'];
    if (json['testCases'] != null) {
      testCases = [];
      json['testCases'].forEach((v) {
        testCases?.add(TestCases.fromJson(v));
      });
    }
    if (json['templates'] != null) {
      templates = [];
      json['templates'].forEach((v) {
        templates?.add(Templates.fromJson(v));
      });
    }
  }
  num? questionId;
  String? quesTitle;
  String? questionText;
  List<TestCases>? testCases;
  List<Templates>? templates;

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

class Templates {
  Templates({
      this.languageId, 
      this.languageName, 
      this.defualtCode,});

  Templates.fromJson(dynamic json) {
    languageId = json['languageId'];
    languageName = json['languageName'];
    defualtCode = json['defualtCode'];
  }
  num? languageId;
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

class TestCases {
  TestCases({
      this.testCaseId, 
      this.input, 
      this.output,});

  TestCases.fromJson(dynamic json) {
    testCaseId = json['testCaseId'];
    input = json['input'];
    output = json['output'];
  }
  num? testCaseId;
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

class McqQuestions {
  McqQuestions({
      this.questionId, 
      this.questionText, 
      this.options,});

  McqQuestions.fromJson(dynamic json) {
    questionId = json['questionId'];
    questionText = json['questionText'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options.fromJson(v));
      });
    }
  }
  num? questionId;
  String? questionText;
  List<Options>? options;

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

class Options {
  Options({
      this.optionId, 
      this.optionText,});

  Options.fromJson(dynamic json) {
    optionId = json['optionId'];
    optionText = json['optionText'];
  }
  num? optionId;
  String? optionText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['optionId'] = optionId;
    map['optionText'] = optionText;
    return map;
  }

}