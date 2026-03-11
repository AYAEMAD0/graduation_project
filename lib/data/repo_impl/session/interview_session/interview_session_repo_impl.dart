import 'package:injectable/injectable.dart';

import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import '../../../../domain/repo/session/interview_session/interview_session_repo.dart';
import '../../../data_source/remote/session/interview_session/interview_session_remote_data_source.dart';

@Injectable(as: InterviewSessionRepo)
class InterviewSessionRepoImpl implements InterviewSessionRepo {
  final InterviewSessionRemoteDataSource interviewSessionRemoteDataSource;

  InterviewSessionRepoImpl(this.interviewSessionRemoteDataSource);

  @override
  Future<InterviewSessionEntity> startInterview({
    required List<int> cvBytes,
    required String cvFileName,
    required String jobDescription,
  }) async {
    final dto = await interviewSessionRemoteDataSource.startInterviewSession(
      cvBytes: cvBytes,
      cvFileName: cvFileName,
      jobDescription: jobDescription,
    );

    return InterviewSessionEntity(
      interviewSessionId: dto.interviewSessionId ?? 0,
      codingQuestions: (dto.codingQuestions ?? []).map((q) {
        return CodingQuestionEntity(
          questionId: q.questionId ?? 0,
          quesTitle: q.quesTitle ?? '',
          questionText: q.questionText ?? '',
          testCases: (q.testCases ?? []).map((t) {
            return TestCaseEntity(
              testCaseId: t.testCaseId ?? 0,
              input: t.input ?? '',
              output: t.output ?? '',
            );
          }).toList(),
          templates: (q.templates ?? []).map((t) {
            return CodeTemplateEntity(
              languageId: t.languageId ?? 0,
              languageName: t.languageName ?? '',
              defaultCode: t.defualtCode ?? '',
            );
          }).toList(),
        );
      }).toList(),
      mcqQuestions: (dto.mcqQuestions ?? []).map((q) {
        return McqQuestionEntity(
          questionId: q.questionId ?? 0,
          questionText: q.questionText ?? '',
          options: (q.options ?? []).map((o) {
            return McqOptionEntity(
              optionId: o.optionId ?? 0,
              optionText: o.optionText ?? '',
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
