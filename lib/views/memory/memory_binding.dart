import 'package:get/get.dart';

import 'memory_controller.dart';

class MemoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemoryController>(() => MemoryController());
  }
}