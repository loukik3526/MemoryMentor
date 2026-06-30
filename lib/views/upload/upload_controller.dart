import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  final RxString selectedFileName = "".obs;
  final RxString selectedFileSize = "".obs;
  final RxString selectedFilePath = "".obs;

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
  }

  void uploadAndAnalyze() {
    // Logic for uploading and analyzing the PDF
  }
}
