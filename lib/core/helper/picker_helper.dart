import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../widget/custom_toast.dart';

class PickerHelper {
  static Future<PlatformFile?> pickFile(
      BuildContext context,
      List<String> extensions,
      ) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions,
        withData: true,
      );

      if (!context.mounted) return null;

      if (result != null) {
        return result.files.first;
      }
      return null;
    } catch (e) {
      if (!context.mounted) return null;
      CustomToast.showToast(message: "Error picking", context: context);
      return null;
    }
  }
}