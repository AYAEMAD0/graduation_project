class RunCodeResponseEntity {
  final String status;
  final String output;
  final String? error;

  const RunCodeResponseEntity({
    required this.status,
    required this.output,
    this.error,
  });
}
