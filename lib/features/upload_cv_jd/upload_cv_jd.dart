import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/features/upload_cv_jd/widget/btn_upload.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/theme/app_style.dart';
import '../../core/widget/arrow_button.dart';
import '../../core/widget/custom_button.dart';
import '../../core/widget/custom_toast.dart';

class UploadCvJd extends StatefulWidget {
  const UploadCvJd({super.key});

  @override
  State<UploadCvJd> createState() => _UploadCvJdState();
}

class _UploadCvJdState extends State<UploadCvJd> {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final double containerWidth = isMobile ? double.infinity : 700;

    final titleFontSize = isMobile ? 24.0 : 40.0;
    final textFontSize = isMobile ? 20.0 : 27.0;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArrowButton(),
                Center(
                  child: SizedBox(
                    width: containerWidth,
                    child: Column(
                      children: [
                        Text(
                          "Upload your CV and \nJob Description",
                          style: AppStyle.font40BlackSemiBold.copyWith(
                            fontSize: titleFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: isMobile ? 20 : 30),
                        BtnUpload(
                          text: "Upload CV (PDF / DOC)",
                          onTap: () => uploadFile(['pdf', 'doc', 'docx']),
                        ),
                        BtnUpload(
                          text: "Upload Job Description",
                          onTap: () => uploadFile(['txt']),
                        ),
                        SizedBox(height: isMobile ? 30 : 30),
                        Text(
                          "We’ll analyze your skills to generate \na personalized interview",
                          style: AppStyle.font27BlackLight.copyWith(
                            fontSize: textFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: isMobile ? 30 : 40),
                        CustomButton(
                          text: "Analyze Skills",
                          widthBtn: isMobile ? double.infinity : 500,
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.extractedSkill);
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadFile(List<String> extensions) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
    );
    if (!mounted) return;
    if (result != null) {
      PlatformFile file = result.files.first;
      debugPrint("File name: ${file.name}");
      debugPrint("File size: ${file.size}");
      debugPrint("File path: ${file.path}");
    } else {
      CustomToast.showToast(message: "User Canceled", context: context);
    }
  }
}
