import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../services/gemini_service.dart';
import '../../utils/app_config.dart';
import '../memory/memory_controller.dart';
import '../quiz/quiz_controller.dart';

class UploadController extends GetxController {
  final RxString selectedFileName = "".obs;
  final RxString selectedFileSize = "".obs;
  final RxString selectedFilePath = "".obs;
  final RxString extractedText = "".obs;
  final RxInt pageCount = 0.obs;
  final RxBool isAnalyzing = false.obs;
  final RxString aiSummary = "".obs;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        selectedFileName.value = file.name;
        selectedFilePath.value = file.path ?? "";

        // Convert bytes to MB with two decimal places
        double sizeInMb = file.size / (1024 * 1024);
        selectedFileSize.value = "${sizeInMb.toStringAsFixed(2)} MB";
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick file: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeFile() {
    selectedFileName.value = "";
    selectedFileSize.value = "";
    selectedFilePath.value = "";
    extractedText.value = "";
    pageCount.value = 0;
    aiSummary.value = "";
  }

  Future<void> uploadAndAnalyze() async {
    if (selectedFilePath.value.isEmpty) {
      Get.snackbar(
        "No File Selected",
        "Please select a PDF file first to analyze.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final File file = File(selectedFilePath.value);
      final List<int> bytes = await file.readAsBytes();

      final PdfDocument document = PdfDocument(inputBytes: bytes);
      pageCount.value = document.pages.count;

      final PdfTextExtractor extractor = PdfTextExtractor(document);
      extractedText.value = extractor.extractText();

      document.dispose();

      if (extractedText.value.isEmpty) {
        Get.snackbar(
          "Analysis Error",
          "Could not extract any text from the PDF.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      isAnalyzing.value = true;
      final service = GeminiService(AppConfig.geminiApiKey);
      final summary = await service.generateSummary(extractedText.value);
      aiSummary.value = summary;

      // Integration with MemoryController
      try {
        final memoryController = Get.find<MemoryController>();
        await memoryController.loadMemoriesFromText(extractedText.value);
      } catch (e) {
        // MemoryController not found, silenty failing
      }

      // Integration with QuizController
      try {
        final quizController = Get.find<QuizController>();
        await quizController.generateQuizFromText(extractedText.value);
      } catch (e) {
        // QuizController not found, silenty failing
      }

      isAnalyzing.value = false;
    } catch (e) {
      isAnalyzing.value = false;
      Get.snackbar(
        "Error",
        "An error occurred during analysis: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
