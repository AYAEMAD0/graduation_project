import '../../../../../../domain/entities/session/interview_session/interview_session_entity.dart';

abstract class CodeEditorState {}

class CodeEditorInitial extends CodeEditorState {}

class CodeEditorReady extends CodeEditorState {
  final CodeTemplateEntity selectedTemplate;
  final bool showConsole;

  CodeEditorReady({required this.selectedTemplate, this.showConsole = false});
}
