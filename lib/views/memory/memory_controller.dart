import 'package:get/get.dart';
import '../../services/gemini_service.dart';
import '../../utils/app_config.dart';

class MemoryController extends GetxController {
  final RxList<Map<String, String>> memories = <Map<String, String>>[].obs;
  final RxString selectedFilter = 'All'.obs;

  Future<void> loadMemoriesFromText(String extractedText) async {
    try {
      final GeminiService service = GeminiService(AppConfig.geminiApiKey);
      final List<Map<String, String>> generatedMemories = 
          await service.generateMemories(extractedText);
      
      // Adding a dummy date since it's required by the view but not returned by the AI
      final String today = DateTime.now().toString().split(' ')[0];
      
      memories.value = generatedMemories.map((m) => {
        'title': m['title'] ?? 'Untitled',
        'description': m['description'] ?? '',
        'date': today,
      }).toList();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to generate memories: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
