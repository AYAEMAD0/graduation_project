import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/session/interview_session/interview_session_entity.dart';
import 'code_editor_state.dart';

@injectable
class CodeEditorCubit extends Cubit<CodeEditorState> {
  CodeEditorCubit() : super(CodeEditorInitial());

  CodeEditorReady get _ready => state as CodeEditorReady;

  void init(CodeTemplateEntity template) =>
      emit(CodeEditorReady(selectedTemplate: template));

  void changeTemplate(CodeTemplateEntity template) =>
      emit(_ready.copyWith(selectedTemplate: template));

  void toggleConsole() =>
      emit(_ready.copyWith(showConsole: !_ready.showConsole));

  void showConsolePanel() => emit(_ready.copyWith(showConsole: true));
}