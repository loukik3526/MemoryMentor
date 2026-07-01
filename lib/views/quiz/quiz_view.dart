import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import 'quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Quiz Session'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isGeneratingQuiz.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.primary),
                SizedBox(height: 20),
                Text(
                  'Generating your custom quiz...',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          );
        }

        if (controller.questions.isEmpty) {
          return const Center(
            child: Text(
              "No quiz generated yet.",
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
          );
        }

        return _QuizContent(questions: controller.questions);
      }),
    );
  }
}

class _QuizContent extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  const _QuizContent({required this.questions});

  @override
  State<_QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<_QuizContent> {
  int _currentIndex = 0;
  int? _selectedAnswer;
  bool _showExplanation = false;

  void _onOptionSelected(int index) {
    if (_selectedAnswer != null) return;
    setState(() {
      _selectedAnswer = index;
      _showExplanation = true;
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
        _showExplanation = false;
      });
    } else {
      Get.back();
      Get.snackbar(
        "Quiz Completed",
        "You have finished the quiz! Great job.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.surface,
        colorText: AppColors.textPrimary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentIndex];
    final options = List<String>.from(question['options']);
    final correctAnswer = question['answer'] as int;
    final explanation = question['explanation'] as String;

    return Padding(
      padding: const EdgeInsets.all(AppConstants.space24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Question ${_currentIndex + 1} of ${widget.questions.length}",
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            question['question'],
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(options.length, (index) {
                    Color borderColor = AppColors.border;
                    IconData? icon;

                    if (_selectedAnswer != null) {
                      if (index == correctAnswer) {
                        borderColor = AppColors.success;
                        icon = Icons.check_circle;
                      } else if (index == _selectedAnswer) {
                        borderColor = AppColors.error;
                        icon = Icons.cancel;
                      }
                    }

                    return GestureDetector(
                      onTap: () => _onOptionSelected(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppConstants.borderRadiusMd,
                          border: Border.all(color: borderColor, width: 2),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                options[index],
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            if (icon != null) Icon(icon, color: borderColor),
                          ],
                        ),
                      ),
                    );
                  }),
                  if (_showExplanation) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.05),
                        borderRadius: AppConstants.borderRadiusMd,
                        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.info_outline, color: AppColors.primary, size: 18),
                              SizedBox(width: 8),
                              Text(
                                "Explanation",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            explanation,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      text: _currentIndex == widget.questions.length - 1
                          ? "Finish Quiz"
                          : "Next Question",
                      onPressed: _nextQuestion,
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
