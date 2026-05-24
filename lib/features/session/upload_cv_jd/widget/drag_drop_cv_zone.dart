import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/picker_helper.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custom_toast.dart';
import '../viewmodel/upload_cv_cubit.dart';
import '../viewmodel/upload_cv_state.dart';
import 'build_success_content.dart';
import 'build_upload_content.dart';

class DragDropCvZone extends StatefulWidget {
  const DragDropCvZone({super.key});

  @override
  State<DragDropCvZone> createState() => _DragDropCvZoneState();
}

class _DragDropCvZoneState extends State<DragDropCvZone> {
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadCvCubit, UploadCvState>(
      builder: (context, state) {
        final cubit = context.read<UploadCvCubit>();

        return DropTarget(
          onDragDone: (details) async {
            setState(() {
              _dragging = false;
            });

            if (details.files.isEmpty) {
              return;
            }

            final droppedFile = details.files.first;

            if (!droppedFile.name.toLowerCase().endsWith('.pdf')) {
              CustomToast.showToast(
                message: "Only PDF files allowed",
                context: context,
              );

              return;
            }
            final bytes = await droppedFile.readAsBytes();

            final platformFile = PlatformFile(
              name: droppedFile.name,

              size: bytes.length,

              bytes: bytes,

              path: droppedFile.path,
            );
            cubit.selectFile(platformFile);

            if (!context.mounted) return;
            CustomToast.showToast(
              message: "CV uploaded successfully",
              context: context,
            );
          },

          onDragEntered: (_) {
            setState(() {
              _dragging = true;
            });
          },

          onDragExited: (_) {
            setState(() {
              _dragging = false;
            });
          },

          child: InkWell(
            onTap: () async {
              final file = await PickerHelper.pickFile(context, ['pdf']);

              if (file != null) {
                cubit.selectFile(file);
              }
            },

            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                dashPattern: [10, 5],

                strokeWidth: 2.5,

                color: _dragging
                    ? Colors.green
                    : state.hasFile
                    ? AppColor.purple
                    : const Color(0xffCBD5E1),

                radius: const Radius.circular(25),
              ),

              child: Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(vertical: 20),

                color: _dragging
                    ? Colors.green.withValues(alpha: 0.08)
                    : Colors.transparent,

                child: state.hasFile
                    ? BuildSuccessContent(
                        text: state.selectedFile!.name,

                        onRemove: cubit.removeFile,
                      )
                    : const BuildUploadContent(),
              ),
            ),
          ),
        );
      },
    );
  }
}
