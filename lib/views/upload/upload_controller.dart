import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class UploadController extends GetxController {
  final RxString selectedFileName = "".obs;
  final RxString selectedFileSize = "".obs;
  final RxString selectedFilePath = "".obs;
  final RxString extractedText = "".obs;
  final RxInt pageCount = 0.obs;

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
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to extract text: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
