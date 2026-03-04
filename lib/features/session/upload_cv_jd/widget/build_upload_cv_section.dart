import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/helper/picker_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_style.dart';

class BuildUploadCvSection extends StatefulWidget {
  final void Function(PlatformFile? file) onFileSelected;

  const BuildUploadCvSection({super.key, required this.onFileSelected});

  @override
  State<BuildUploadCvSection> createState() => _BuildUploadCvSectionState();
}

class _BuildUploadCvSectionState extends State<BuildUploadCvSection> {
  PlatformFile? selectedFile;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return InkWell(
      onTap: () async {
        final file = await PickerHelper.pickFile(context, ['pdf']);
        if (file != null) {
          setState(() => selectedFile = file);
          widget.onFileSelected(file);
          debugPrint("Picked file: ${file.name}, size: ${file.size}");
        }
      },
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 5],
          strokeWidth: 2.5,
          color: selectedFile != null
              ? AppColor.purple
              : const Color(0xffCBD5E1),
          radius: const Radius.circular(25),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 50),
          child: selectedFile == null
              ? _buildUploadContent(isMobile)
              : _buildSuccessContent(isMobile),
        ),
      ),
    );
  }

  Widget _buildUploadContent(bool isMobile) {
    return Column(
      children: [
        Icon(
          Icons.cloud_upload,
          size: isMobile ? 30 : 70,
          color: AppColor.grayMediumColor,
        ),
        SizedBox(height: isMobile ? 12 : 22),
        Text(
          "Upload CV (PDF)",
          style: AppStyle.font16BlackSemiBold.copyWith(
            fontSize: isMobile ? 16 : 25,
          ),
        ),
        SizedBox(height: isMobile ? 6 : 12),
        Text(
          "or drag and drop here",
          style: AppStyle.font14GrayRegular.copyWith(
            fontSize: isMobile ? 14 : 20,
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessContent(bool isMobile) {
    return Column(
      children: [
        Icon(
          Icons.check_circle,
          size: isMobile ? 35 : 75,
          color: AppColor.purple,
        ),
        const SizedBox(height: 15),
        Text(
          "CV Uploaded Successfully",
          style: AppStyle.font16BlackSemiBold.copyWith(
            fontSize: isMobile ? 16 : 22,
            color: AppColor.purple,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          selectedFile!.name,
          style: AppStyle.font14GrayRegular.copyWith(
            fontSize: isMobile ? 13 : 18,
          ),
        ),
        const SizedBox(height: 25),
        TextButton.icon(
          onPressed: () {
            setState(() => selectedFile = null);
            widget.onFileSelected(null);
          },
          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
          label: const Text(
            "Remove File",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
