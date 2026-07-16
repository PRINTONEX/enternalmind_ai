import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../glass_card.dart';

/// A premium glassmorphic error screen shown when a system-wide or rendering anomaly is detected.
class GlobalErrorScreen extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onReset;

  const GlobalErrorScreen({
    super.key,
    required this.errorMessage,
    this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B16),
      body: Stack(
        children: [
          // Background Neon Red Radial Glow
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFEF4444).withAlpha(20),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7C3AED).withAlpha(15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: GlassCard(
                borderRadius: 28,
                padding: const EdgeInsets.all(32),
                glowColor: const Color(0xFFEF4444).withAlpha(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Anomaly Icon
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFEF4444).withAlpha(20),
                        border: Border.all(
                          color: const Color(0xFFEF4444).withAlpha(120),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.running_with_errors_rounded,
                          color: Color(0xFFEF4444),
                          size: 36,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Header
                    Text(
                      'SYSTEM ANOMALY',
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'The neural interface encountered a runtime failure.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Error Code Snippet
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF090D1A),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: SelectableText(
                        errorMessage,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.firaCode(
                          color: const Color(0xFFEF4444),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Action buttons
                    Row(
                      children: [
                        if (onReset != null) ...[
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF1E293B)),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: onReset,
                              child: Text(
                                'Restart Interface',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
