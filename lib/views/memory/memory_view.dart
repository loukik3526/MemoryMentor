import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'memory_controller.dart';
import 'widgets/empty_memory.dart';
import 'widgets/memory_app_bar.dart';
import 'widgets/memory_card.dart';
import 'widgets/memory_filter_chip.dart';
import 'widgets/memory_search_bar.dart';

class MemoryView extends GetView<MemoryController> {
  const MemoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const MemoryAppBar(),
          const Padding(
            padding: EdgeInsets.all(AppConstants.space16),
            child: MemorySearchBar(),
          ),
          _buildFilters(),
          const SizedBox(height: AppConstants.space16),
          Expanded(
            child: Obx(() {
              // Assuming controller has 'memories' RxList
              if (controller.memories.isEmpty) {
                return const EmptyMemory();
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.space16),
                itemCount: controller.memories.length,
                itemBuilder: (context, index) {
                  final memory = controller.memories[index];
                  return MemoryCard(
                    title: memory['title'] ?? '',
                    description: memory['description'] ?? '',
                    date: memory['date'] ?? '',
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    final filters = ['All', 'Flutter', 'AI', 'DSA', 'College'];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.space16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Obx(() => MemoryFilterChip(
              label: filter,
              // Assuming controller has 'selectedFilter' RxString
              selected: controller.selectedFilter.value == filter,
              onTap: () => controller.selectedFilter.value = filter,
            )),
          );
        },
      ),
    );
  }
}
