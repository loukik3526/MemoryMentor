import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import 'upload_controller.dart';
import 'widgets/selected_pdf_card.dart';
import 'widgets/upload_drop_zone.dart';
import 'widgets/upload_header.dart';

class UploadView extends GetView<UploadController> {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const UploadHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.space24),
              child: Obx(() {
                final fileName = controller.selectedFileName.value;
                final fileSize = controller.selectedFileSize.value;
                final hasFile = fileName.isNotEmpty;

                return Column(
                  children: [
                    if (!hasFile)
                      UploadDropZone(
                        onTap: controller.pickFile,
                      )
                    else ...[
                      SelectedPdfCard(
                        fileName: fileName,
                        fileSize: fileSize,
                        onDelete: controller.removeFile,
                      ),
                      const SizedBox(height: AppConstants.space32),
                      PrimaryButton(
                        text: "Analyze PDF",
                        onPressed: controller.uploadAndAnalyze,
                      ),
                    ],
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
