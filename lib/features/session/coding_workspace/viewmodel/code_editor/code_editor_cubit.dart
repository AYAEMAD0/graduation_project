import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import 'code_editor_state.dart';

@injectable
class CodeEditorCubit extends Cubit<CodeEditorState> {
  CodeEditorCubit() : super(CodeEditorInitial());

  void init(CodeTemplateEntity template) {
    emit(CodeEditorReady(selectedTemplate: template));
  }

  void changeTemplate(CodeTemplateEntity template) {
    final current = state as CodeEditorReady;
    emit(
      CodeEditorReady(
        selectedTemplate: template,
        showConsole: current.showConsole,
      ),
    );
  }

  void toggleConsole() {
    final current = state as CodeEditorReady;
    emit(
      CodeEditorReady(
        selectedTemplate: current.selectedTemplate,
        showConsole: !current.showConsole,
      ),
    );
  }

  void showConsolePanel() {
    final current = state as CodeEditorReady;
    emit(
      CodeEditorReady(
        selectedTemplate: current.selectedTemplate,
        showConsole: true,
      ),
    );
  }
}
