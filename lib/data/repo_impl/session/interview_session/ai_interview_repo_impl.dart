import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/data/data_source/remote/session/interview_session/ai_interview_remote_data_source.dart';
import 'package:mock_mate_ai/domain/entities/session/interview_session/interview_session_entity.dart';
import 'package:mock_mate_ai/domain/repo/session/interview_session/ai_interview_repo.dart';

@Injectable(as:AiInterviewRepo )
class AiInterviewRepoImpl implements AiInterviewRepo{
  final AiInterviewRemoteDataSource aiInterviewRemoteDataSource ;
  AiInterviewRepoImpl(this.aiInterviewRemoteDataSource);

  @override
  Future<InterviewSessionEntity> startAiInterview({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription
  })async {
    final dto = await aiInterviewRemoteDataSource.startAiInterviewSession(
        cvBytes: cvBytes,
        cvFileName: cvFileName,
        jobDescription: jobDescription
    );
    return InterviewSessionEntity(
      interviewSessionId: dto.interviewSessionId?.toInt() ?? 0,
      codingQuestions: (dto.codingQuestions ?? []).map((q) {
        return CodingQuestionEntity(
          questionId: q.questionId?.toInt() ?? 0,
          quesTitle: q.quesTitle ?? '',
          questionText: q.questionText ?? '',
          testCases: (q.testCases ?? []).map((t) => TestCaseEntity(
            testCaseId: t.testCaseId?.toInt() ?? 0,
            input: t.input ?? '',
            output: t.output ?? '',
          )).toList(),
          templates: (q.templates ?? []).map((t) => CodeTemplateEntity(
            languageId: t.languageId?.toInt() ?? 0,
            languageName: t.languageName ?? '',
            defaultCode: t.defualtCode ?? '',
          )).toList(),
        );
      }).toList(),
      mcqQuestions: (dto.mcqQuestions ?? []).map((q) {
        return McqQuestionEntity(
          questionId: q.questionId?.toInt() ?? 0,
          questionText: q.questionText ?? '',
          options: (q.options ?? []).map((o) => McqOptionEntity(
            optionId: o.optionId?.toInt() ?? 0,
            optionText: o.optionText ?? '',
          )).toList(),
        );
      }).toList(),
    );

  }
  
}