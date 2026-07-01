import 'package:get/get.dart';
import '../chat/chat_controller.dart';
import '../dashboard/dashboard_controller.dart';
import '../memory/memory_controller.dart';
import '../profile/profile_controller.dart';
import '../quiz/quiz_controller.dart';
import '../upload/upload_controller.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);
    Get.put(DashboardController(), permanent: true);
    Get.put(ChatController(), permanent: true);
    Get.put(MemoryController(), permanent: true);
    Get.put(QuizController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(UploadController(), permanent: true);
  }
}
