import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxString userName = 'Loukik'.obs;
  final RxDouble dailyProgress = 0.72.obs;
  final RxInt memoryCount = 250.obs;
  final RxInt sessionsCompleted = 18.obs;
  final RxDouble recallRate = 0.91.obs;
}
