part of 'mcq_workspace_cubit.dart';

abstract class McqWorkspaceState {}

class McqWorkspaceInitial extends McqWorkspaceState {}

class McqWorkspaceAnswerSelected extends McqWorkspaceState {
  final int selectedIndex;
  final int optionId;

  McqWorkspaceAnswerSelected({
    required this.selectedIndex,
    required this.optionId,
  });
}

class McqWorkspaceSaving extends McqWorkspaceState {
  final int selectedIndex;
  final int optionId;

  McqWorkspaceSaving({required this.selectedIndex, required this.optionId});
}

class McqWorkspaceSaved extends McqWorkspaceState {
  final int selectedIndex;
  final int optionId;

  McqWorkspaceSaved({required this.selectedIndex, required this.optionId});
}

class McqWorkspaceError extends McqWorkspaceState {
  final int selectedIndex;
  final int optionId;
  final String message;

  McqWorkspaceError({
    required this.selectedIndex,
    required this.optionId,
    required this.message,
  });
}
