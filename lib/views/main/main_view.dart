import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';
import 'widgets/custom_bottom_nav.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.pages[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNav(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
        ),
      ),
    );
  }
}
