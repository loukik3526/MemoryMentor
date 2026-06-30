import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chat/chat_view.dart';
import '../dashboard/dashboard_view.dart';
import '../memory/memory_view.dart';
import '../profile/profile_view.dart';
import '../quiz/quiz_view.dart';

class MainController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    const ChatView(),
    const DashboardView(),
    const MemoryView(),
    const QuizView(),
    const ProfileView(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
