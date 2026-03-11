import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'upload_cv_state.dart';

@injectable
class UploadCvCubit extends Cubit<UploadCvState> {
  UploadCvCubit() : super(const UploadCvState());

  void selectFile(PlatformFile file) => emit(UploadCvState(selectedFile: file));

  void removeFile() => emit(const UploadCvState());
}
