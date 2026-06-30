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
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<MemoryController>(() => MemoryController());
    Get.lazyPut<QuizController>(() => QuizController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<UploadController>(() => UploadController());
  }
}
