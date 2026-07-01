import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/gemini_service.dart';
import '../../utils/app_config.dart';
import '../upload/upload_controller.dart';

class ChatController extends GetxController {
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final RxBool isTyping = false.obs;

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    // Add user message to messages list
    messages.add({
      "role": "user",
      "text": text,
    });
    messageController.clear();
    _scrollToBottom();

    // Obtain UploadController to get extracted text
    late UploadController uploadController;
    try {
      uploadController = Get.find<UploadController>();
    } catch (e) {
      messages.add({
        "role": "assistant",
        "text": "An error occurred accessing the study material.",
      });
      _scrollToBottom();
      return;
    }

    final extractedText = uploadController.extractedText.value;
    if (extractedText.isEmpty) {
      messages.add({
        "role": "assistant",
        "text": "Please upload and analyze a PDF first.",
      });
      _scrollToBottom();
      return;
    }

    isTyping.value = true;
    try {
      final GeminiService service = GeminiService(AppConfig.geminiApiKey);
      final response = await service.askQuestion(
        documentText: extractedText,
        userQuestion: text,
      );

      messages.add({
        "role": "assistant",
        "text": response,
      });
      _scrollToBottom();
    } catch (e) {
      messages.add({
        "role": "assistant",
        "text": "I encountered an error while processing your request: $e",
      });
      _scrollToBottom();
    } finally {
      isTyping.value = false;
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
