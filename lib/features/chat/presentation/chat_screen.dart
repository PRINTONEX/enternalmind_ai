import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../dashboard/providers/dashboard_providers.dart';
import '../providers/chat_providers.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    ref.read(chatProvider.notifier).sendMessage(text);
    _textController.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final messages = chatState.messages;

    // Listen to changes in message list to auto-scroll
    ref.listen(chatProvider, (previous, next) {
      if (previous?.messages.length != next.messages.length || next.isTyping) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Stack(
        children: [
          // ── Subtle radial glow in background ──
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF8B5CF6).withAlpha(12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF00E5FF).withAlpha(8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Main Content ──
          SafeArea(
            child: Column(
              children: [
                // 1. Header Bar (WhatsApp style)
                _buildHeader(context),

                // Date separator ("Today")
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 8),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Text(
                        'Today',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF64748B),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                // 3. Scrollable Message Stream
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.xs, Spacing.lg, Spacing.lg),
                    itemCount: messages.length + (chatState.isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length && chatState.isTyping) {
                        return _buildTypingIndicator();
                      }
                      final msg = messages[index];
                      return _buildMessageRow(msg);
                    },
                  ),
                ),

                // 4. Suggestions Row
                _buildSuggestionsRow(),

                // 5. Input Bar
                _buildInputBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final profileAsync = ref.watch(dashProfileProvider);
    final profile = profileAsync.valueOrNull;
    final name = profile?.fullName.isNotEmpty == true ? profile!.fullName : 'Aftab Shah';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'A';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF1E293B), width: 1.0),
        ),
      ),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),

          // Glowing Avatar (WhatsApp style)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(1.5),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF070B14),
              ),
              child: Center(
                child: Text(
                  initial,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name and Status (WhatsApp style)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF10B981),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: const Color(0xFF10B981),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Voice Call Icon Button
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Starting Voice Call with Digital Replica...'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: const Icon(
                Icons.call_rounded,
                color: Color(0xFF00E5FF),
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Video Call Icon Button
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Initializing Holographic Video Session...'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: const Icon(
                Icons.videocam_rounded,
                color: Color(0xFFC084FC),
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // More Settings Button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageRow(ChatMessage msg) {
    final timeStr = '${msg.timestamp.hour.toString().padLeft(2, '0')}:${msg.timestamp.minute.toString().padLeft(2, '0')} ${msg.timestamp.hour >= 12 ? 'PM' : 'AM'}';

    if (msg.isUser) {
      // User message on the right
      return Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Time stamp + Message bubble
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFF0369A1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        msg.text,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 13.5,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            timeStr,
                            style: GoogleFonts.inter(
                              color: Colors.white.withAlpha(160),
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.done_all_rounded,
                            color: Color(0xFF00E5FF),
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // AI message on the left
      return Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                ),
              ),
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF03050A),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/avatars/aftab.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.person_rounded, color: Color(0xFF64748B), size: 16),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Bubble
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 260),
                    decoration: BoxDecoration(
                      color: const Color(0xFF090D1A),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(16),
                      ),
                      border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg.text,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 13.5,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          timeStr,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Heart button
                  GestureDetector(
                    onTap: () {
                      ref.read(chatProvider.notifier).toggleLike(msg.id);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF090D1A),
                        border: Border.all(color: const Color(0xFF1E293B)),
                      ),
                      child: Icon(
                        msg.isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: msg.isLiked ? const Color(0xFFEC4899) : const Color(0xFF64748B),
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
              ),
            ),
            padding: const EdgeInsets.all(1.5),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF03050A),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/avatars/aftab.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF090D1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: 36,
              height: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF8B5CF6),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionsRow() {
    final suggestions = [
      ('Motivate me', Icons.auto_awesome_rounded),
      ('Give advice', Icons.chat_bubble_outline_rounded),
      ('Remember this', Icons.bookmark_outline_rounded),
      ('Inspire me', Icons.lightbulb_outline_rounded),
    ];

    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final s = suggestions[index];
          return GestureDetector(
            onTap: () {
              _textController.text = s.$1;
              _sendMessage();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF070B14),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Row(
                children: [
                  Icon(s.$2, color: const Color(0xFF8B5CF6), size: 14),
                  const SizedBox(width: 8),
                  Text(
                    s.$1,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.xs, Spacing.lg, Spacing.md),
      child: Row(
        children: [
          // Plus add button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
                color: const Color(0xFF090D1A),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Message input card
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
              ),
              padding: const EdgeInsets.only(left: 16, right: 6),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: GoogleFonts.inter(color: const Color(0xFF475569), fontSize: 14),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),

                  // Mic Icon circle
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF8B5CF6).withAlpha(20),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.mic_none_rounded,
                          color: Color(0xFF8B5CF6),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),

                  // Send button
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF00E5FF),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send_rounded,
                          color: Color(0xFF03050A),
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
