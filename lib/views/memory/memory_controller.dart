import 'package:get/get.dart';

class MemoryController extends GetxController {
  final RxList<Map<String, String>> memories = <Map<String, String>>[
    {
      'title': 'Flutter Widgets',
      'description': 'A deep dive into Stateless and Stateful widgets, and how they build the UI.',
      'date': 'Oct 24, 2023',
    },
    {
      'title': 'Binary Trees',
      'description': 'Understanding tree traversal algorithms: In-order, Pre-order, and Post-order.',
      'date': 'Oct 22, 2023',
    },
    {
      'title': 'Operating Systems',
      'description': 'Exploring process scheduling, memory management, and file systems.',
      'date': 'Oct 20, 2023',
    },
  ].obs;

  final RxString selectedFilter = 'All'.obs;
}
