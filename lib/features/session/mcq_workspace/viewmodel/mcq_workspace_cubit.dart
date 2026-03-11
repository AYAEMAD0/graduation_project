import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/session/answer_mcq/answer_mcq_request_entity.dart';
import '../../../../../domain/usecase/session/answer_mcq/answer_mcq_usecase.dart';
import '../../../../domain/entities/session/interview_session/interview_session_entity.dart';

part 'mcq_workspace_state.dart';

@injectable
class McqWorkspaceCubit extends Cubit<McqWorkspaceState> {
  final AnswerMcqUseCase _answerMcqUseCase;

  McqWorkspaceCubit(this._answerMcqUseCase) : super(McqWorkspaceInitial());

  void init({
    required int? initialOptionId,
    required List<McqOptionEntity> options,
    required bool initialIsSaved,
  }) {
    if (initialIsSaved) {
      final index = initialOptionId != null
          ? options.indexWhere((o) => o.optionId == initialOptionId)
          : 0;
      emit(
        McqWorkspaceSaved(
          selectedIndex: index == -1 ? 0 : index,
          optionId: initialOptionId ?? 0,
        ),
      );
      return;
    }

    if (initialOptionId == null) return;
    final index = options.indexWhere((o) => o.optionId == initialOptionId);
    if (index == -1) return;

    emit(
      McqWorkspaceAnswerSelected(
        selectedIndex: index,
        optionId: initialOptionId,
      ),
    );
  }

  void selectAnswer({required int index, required int optionId}) {
    emit(McqWorkspaceAnswerSelected(selectedIndex: index, optionId: optionId));
  }

  Future<void> saveAnswer({
    required int sessionId,
    required int questionId,
  }) async {
    final currentIndex = _getSelectedIndex();
    final optionId = _getOptionId();
    if (currentIndex == null || optionId == null) return;

    emit(McqWorkspaceSaving(selectedIndex: currentIndex, optionId: optionId));
    try {
      await _answerMcqUseCase(
        sessionId: sessionId,
        entity: AnswerMcqRequestEntity(
          questionId: questionId,
          selectedOptionId: optionId,
        ),
      );
      emit(McqWorkspaceSaved(selectedIndex: currentIndex, optionId: optionId));
    } catch (e) {
      emit(
        McqWorkspaceError(
          selectedIndex: currentIndex,
          optionId: optionId,
          message: e.toString(),
        ),
      );
    }
  }

  int? _getSelectedIndex() {
    final s = state;
    if (s is McqWorkspaceAnswerSelected) return s.selectedIndex;
    if (s is McqWorkspaceSaving) return s.selectedIndex;
    if (s is McqWorkspaceSaved) return s.selectedIndex;
    if (s is McqWorkspaceError) return s.selectedIndex;
    return null;
  }

  int? _getOptionId() {
    final s = state;
    if (s is McqWorkspaceAnswerSelected) return s.optionId;
    if (s is McqWorkspaceSaving) return s.optionId;
    if (s is McqWorkspaceSaved) return s.optionId;
    if (s is McqWorkspaceError) return s.optionId;
    return null;
  }

  void resetToInitial(int? previousOptionId, List<McqOptionEntity> options) {
    if (previousOptionId == null) {
      emit(McqWorkspaceInitial());
      return;
    }
    final index = options.indexWhere((o) => o.optionId == previousOptionId);
    emit(McqWorkspaceAnswerSelected(
      selectedIndex: index == -1 ? 0 : index,
      optionId: previousOptionId,
    ));
  }
}
