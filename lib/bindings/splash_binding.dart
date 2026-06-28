import 'package:get/get.dart';

import '../views/splash/splash_controller.dart';

/// Provides splash-screen dependencies.
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(SplashController.new);
  }
}
