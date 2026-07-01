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
                final extractedText = controller.extractedText.value;
                final isAnalyzing = controller.isAnalyzing.value;
                final aiSummary = controller.aiSummary.value;

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
                        onPressed: isAnalyzing ? null : controller.uploadAndAnalyze,
                        isLoading: isAnalyzing,
                      ),
                      if (extractedText.isNotEmpty && !isAnalyzing) ...[
                        const SizedBox(height: AppConstants.space32),
                        _buildAnalysisResult(),
                      ],
                      if (isAnalyzing) ...[
                        const SizedBox(height: AppConstants.space48),
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                        const SizedBox(height: AppConstants.space24),
                        const Text(
                          "Analyzing your study material...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      if (aiSummary.isNotEmpty && !isAnalyzing) ...[
                        const SizedBox(height: AppConstants.space32),
                        _buildAiSummaryCard(aiSummary),
                      ],
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

  Widget _buildAiSummaryCard(String summary) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.space20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppConstants.borderRadiusLg,
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text("🤖", style: TextStyle(fontSize: 24)),
              SizedBox(width: AppConstants.space12),
              Text(
                "AI Summary",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.space16),
          const Divider(color: AppColors.border),
          const SizedBox(height: AppConstants.space16),
          Text(
            summary,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisResult() {
    final previewText = controller.extractedText.value.length > 200
        ? controller.extractedText.value.substring(0, 200) + "..."
        : controller.extractedText.value;

    return Container(
      padding: const EdgeInsets.all(AppConstants.space16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppConstants.borderRadiusLg,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
              SizedBox(width: AppConstants.space8),
              Text(
                "PDF Analyzed",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.space16),
          _buildInfoRow("Pages:", controller.pageCount.value.toString()),
          const SizedBox(height: AppConstants.space8),
          _buildInfoRow("Characters:", controller.extractedText.value.length.toString()),
          const SizedBox(height: AppConstants.space16),
          const Text(
            "Text Preview:",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppConstants.space8),
          Container(
            padding: const EdgeInsets.all(AppConstants.space12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: AppConstants.borderRadiusMd,
            ),
            child: Text(
              previewText,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
