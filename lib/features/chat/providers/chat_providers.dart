import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isLiked;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isLiked = false,
  });

  ChatMessage copyWith({
    String? id,
    String? text,
    bool? isUser,
    DateTime? timestamp,
    bool? isLiked,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      timestamp: timestamp ?? this.timestamp,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}

class ChatState {
  final List<ChatMessage> messages;
  final bool isTyping;

  ChatState({
    required this.messages,
    this.isTyping = false,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isTyping,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(messages: [])) {
    // Initial messages matching the screenshot exactly
    state = ChatState(
      messages: [
        ChatMessage(
          id: '1',
          text: "Hi Aftab! 👋\n\nHow are you feeling today? Anything on your mind that you’d like to talk about?",
          isUser: false,
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        ChatMessage(
          id: '2',
          text: "I’m working on a new project. Need some motivation!",
          isUser: true,
          timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
        ),
        ChatMessage(
          id: '3',
          text: "That’s great! 🚀 Remember, every big achievement starts with a single step. Stay focused, take breaks, and believe in yourself. You’ve got this! 💪",
          isUser: false,
          timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
        ),
      ],
    );
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    state = state.copyWith(
      messages: [...state.messages, userMsg],
      isTyping: true,
    );

    // Simulate AI response after 1.5 seconds
    Future.delayed(const Duration(milliseconds: 1500), () {
      final responseText = _getAIResponse(text);
      final aiMsg = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: responseText,
        isUser: false,
        timestamp: DateTime.now(),
      );
      state = state.copyWith(
        messages: [...state.messages, aiMsg],
        isTyping: false,
      );
    });
  }

  void toggleLike(String messageId) {
    state = state.copyWith(
      messages: state.messages.map((m) {
        if (m.id == messageId) {
          return m.copyWith(isLiked: !m.isLiked);
        }
        return m;
      }).toList(),
    );
  }

  String _getAIResponse(String userInput) {
    final lower = userInput.toLowerCase();
    if (lower.contains('motivate') || lower.contains('motivation')) {
      return "The only way to do great work is to love what you do. Keep pushing forward, Aftab! The future belongs to those who build it. 🌟";
    } else if (lower.contains('advice') || lower.contains('help')) {
      return "My advice is to focus on one thing at a time. Break your project into small tasks, celebrate each completion, and maintain consistency. 🎯";
    } else if (lower.contains('remember')) {
      return "I have committed this to my memory bank. I will remember your thoughts about this project. 🧠";
    }
    return "I hear you, Aftab. Tell me more about what you are building. I am here to help you brainstorm and keep track of your ideas! 🚀";
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});
