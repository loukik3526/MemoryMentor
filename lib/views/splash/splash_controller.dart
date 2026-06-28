import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/app_constants.dart';

/// Handles splash timing and first-route selection.
class SplashController extends GetxController {
  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    print("===== SplashController started =====");

    Future.delayed(const Duration(seconds: 2), () {
      print("===== 2 seconds completed =====");

      Get.offAllNamed('/onboarding');
    });
  }
}
