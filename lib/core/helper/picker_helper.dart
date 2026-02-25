// picker_helper.dart
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
      if (result != null) {
        return result.files.first;
      } else {
        CustomToast.showToast(message: "User Canceled", context: context);
        return null;
      }
    } catch (e) {
      CustomToast.showToast(message: "Error picking Image", context: context);
      return null;
    }
  }
}