import 'package:get/get.dart';
import '../../services/gemini_service.dart';
import '../../utils/app_config.dart';

class QuizController extends GetxController {
  final RxList<Map<String, dynamic>> questions = <Map<String, dynamic>>[].obs;
  final RxBool isGeneratingQuiz = false.obs;

  Future<void> generateQuizFromText(String extractedText) async {
    isGeneratingQuiz.value = true;
    try {
      final GeminiService service = GeminiService(AppConfig.geminiApiKey);
      final List<Map<String, dynamic>> generatedQuestions = 
          await service.generateQuiz(extractedText);
      
      questions.value = generatedQuestions;
    } catch (e) {
      Get.snackbar(
        "Quiz Generation Error",
        "Failed to generate quiz: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGeneratingQuiz.value = false;
    }
  }
}
