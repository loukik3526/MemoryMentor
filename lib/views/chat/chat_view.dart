import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_input.dart';
import 'widgets/empty_chat.dart';
import 'widgets/message_bubble.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ChatAppBar(),
          Expanded(
            child: Obx(
              () => controller.messages.isEmpty
                  ? const EmptyChat()
                  : ListView.builder(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(
                          message: controller.messages[index],
                          isUser: true,
                        );
                      },
                    ),
            ),
          ),
          ChatInput(
            controller: controller.messageController,
            onSend: controller.sendMessage,
          ),
        ],
      ),
    );
  }
}
