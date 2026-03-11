import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/helper/picker_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/app_color.dart';
import '../viewmodel/upload_cv_cubit.dart';
import '../viewmodel/upload_cv_state.dart';
import 'build_success_content.dart';
import 'build_upload_content.dart';

class BuildUploadCvSection extends StatelessWidget {
  const BuildUploadCvSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocBuilder<UploadCvCubit, UploadCvState>(
      builder: (context, state) {
        final cubit = context.read<UploadCvCubit>();

        return InkWell(
          onTap: () async {
            final file = await PickerHelper.pickFile(context, ['pdf']);
            if (file != null) {
              cubit.selectFile(file);
              debugPrint("Picked file: ${file.name}, size: ${file.size}");
            }
          },
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [10, 5],
              strokeWidth: 2.5,
              color: state.hasFile ? AppColor.purple : const Color(0xffCBD5E1),
              radius: const Radius.circular(25),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 50),
              child: state.hasFile
                  ? BuildSuccessContent(
                      text: state.selectedFile!.name,
                      onRemove: cubit.removeFile,
                    )
                  : BuildUploadContent(),
            ),
          ),
        );
      },
    );
  }
}
