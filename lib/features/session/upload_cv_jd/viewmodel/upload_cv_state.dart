import 'package:file_picker/file_picker.dart';

class UploadCvState {
  final PlatformFile? selectedFile;

  const UploadCvState({this.selectedFile});

  bool get hasFile => selectedFile != null;
}
