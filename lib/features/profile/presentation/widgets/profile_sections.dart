import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../database/app_database.dart';
import '../../../wizard/models/wizard_models.dart';

// ── Shared Helpers and Reusable Sub-Widgets ──

String _getMonthName(int month) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return months[month - 1];
}

Widget _emptyPlaceholder(String message, IconData icon) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Icon(icon, color: const Color(0xFF475569), size: 32),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 12, fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );
}

Widget _buildField({
  required String label,
  required String hint,
  required IconData icon,
  TextEditingController? controller,
  bool isMultiline = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.inter(
          color: const Color(0xFF94A3B8),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 6),
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFF090D1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1E293B)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: controller,
          maxLines: isMultiline ? 4 : 1,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 13),
            icon: Icon(icon, color: const Color(0xFF7C3AED), size: 18),
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}

Widget _buildTraitRow(String label, int? value) {
  final clamped = (value ?? 50).clamp(0, 100) / 100.0;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: clamped,
            backgroundColor: const Color(0xFF1E293B),
            color: const Color(0xFF7C3AED),
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        SizedBox(
          width: 30,
          child: Text(
            '$value',
            textAlign: TextAlign.right,
            style: GoogleFonts.inter(color: const Color(0xFF00E5FF), fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget _buildStyleRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInfoCard(String title, String content, Color color) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFF090D1A),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF1E293B)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(color: color, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          content,
          style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.4),
        ),
      ],
    ),
  );
}

Widget _buildDecisionBar(String label, int? value, Color color) {
  final clamped = ((value ?? 5).clamp(0, 10)) / 10.0;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
            ),
            Text(
              '$value/10',
              style: GoogleFonts.inter(color: color, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: clamped,
          backgroundColor: const Color(0xFF1E293B),
          color: color,
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
      ],
    ),
  );
}

Widget _buildDecisionStyle(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(
            value ?? '—',
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

// ── 1. Identity Section ──

class ProfileIdentitySection extends StatelessWidget {
  final ProfileModel? profile;
  final TextEditingController fullNameCtrl;
  final TextEditingController nicknameCtrl;
  final TextEditingController birthPlaceCtrl;
  final TextEditingController currentCityCtrl;
  final TextEditingController nationalityCtrl;
  final TextEditingController occupationCtrl;
  final TextEditingController quoteCtrl;
  final TextEditingController aboutCtrl;

  const ProfileIdentitySection({
    super.key,
    required this.profile,
    required this.fullNameCtrl,
    required this.nicknameCtrl,
    required this.birthPlaceCtrl,
    required this.currentCityCtrl,
    required this.nationalityCtrl,
    required this.occupationCtrl,
    required this.quoteCtrl,
    required this.aboutCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildField(
          label: 'Full Name',
          hint: 'Aftab Shah',
          icon: Icons.person_outline_rounded,
          controller: fullNameCtrl,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Nickname',
          hint: 'Aftab',
          icon: Icons.alternate_email_rounded,
          controller: nicknameCtrl,
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildField(
                label: 'Date of Birth',
                hint: profile?.birthDate != null
                    ? '${profile!.birthDate!.day.toString().padLeft(2, '0')} ${_getMonthName(profile!.birthDate!.month)} ${profile!.birthDate!.year}'
                    : '04 Dec 1997',
                icon: Icons.calendar_today_rounded,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildField(
                label: 'Gender',
                hint: profile?.gender ?? 'Male',
                icon: Icons.wc_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildField(
                label: 'Place of Birth',
                hint: profile?.birthPlace ?? 'Phoudel, Manipur',
                icon: Icons.location_on_outlined,
                controller: birthPlaceCtrl,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildField(
                label: 'Current City',
                hint: profile?.currentCity ?? 'Bangalore',
                icon: Icons.home_outlined,
                controller: currentCityCtrl,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Nationality',
          hint: profile?.nationality ?? 'Indian',
          icon: Icons.public_rounded,
          controller: nationalityCtrl,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Occupation',
          hint: profile?.occupation ?? 'Software Engineer',
          icon: Icons.work_outline_rounded,
          controller: occupationCtrl,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Favorite Quote',
          hint: profile?.favoriteQuotes ?? 'Curious programmer...',
          icon: Icons.format_quote_rounded,
          controller: quoteCtrl,
          isMultiline: true,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'About Me',
          hint: profile?.about ?? 'Curious programmer trying to map human memories with AI...',
          icon: Icons.info_outline_rounded,
          controller: aboutCtrl,
          isMultiline: true,
        ),
      ],
    );
  }
}

// ── 2. Life Stories Section ──

class ProfileLifeStoriesSection extends StatelessWidget {
  const ProfileLifeStoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final chapters = [
      ('Chapter 1', 'Childhood Memories', '1997 - 2010', Icons.child_care_rounded),
      ('Chapter 2', 'College Years', '2015 - 2019', Icons.school_outlined),
      ('Chapter 3', 'Professional Journey', '2020 - Present', Icons.laptop_mac_rounded),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Timeline Chapters',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...chapters.map((ch) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF090D1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: Row(
              children: [
                Icon(ch.$4, color: const Color(0xFF06B6D4), size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ch.$2,
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${ch.$1} • ${ch.$3}',
                        style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.edit_note_rounded, color: Color(0xFF06B6D4), size: 18),
              ],
            ),
          );
        }),
      ],
    );
  }
}

// ── 3. Guided Interview Section ──

class ProfileGuidedInterviewSection extends StatelessWidget {
  const ProfileGuidedInterviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E152A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEC4899).withAlpha(100)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Question 4 of 25',
                    style: GoogleFonts.inter(color: const Color(0xFFEC4899), fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.stars_rounded, color: Color(0xFFEC4899), size: 16),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'What was the most challenging event of your career and how did you resolve it?',
                style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, height: 1.4),
              ),
              const SizedBox(height: 14),
              _buildField(label: 'Your Answer', hint: 'Type your detailed answer here...', icon: Icons.border_color_outlined, isMultiline: true),
            ],
          ),
        ),
      ],
    );
  }
}

// ── 4. Daily Journal Section ──

class ProfileDailyJournalSection extends StatelessWidget {
  const ProfileDailyJournalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How is your mood today?',
          style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ['😊 Happy', '😐 Calm', '🔥 Motivated', '💤 Tired', '😔 Pensive'].map((mood) {
            final isSelected = mood.contains('Happy');
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF10B981).withAlpha(30) : const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isSelected ? const Color(0xFF10B981) : const Color(0xFF1E293B)),
              ),
              child: Text(
                mood,
                style: GoogleFonts.inter(color: isSelected ? Colors.white : const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        _buildField(label: 'Journal Entry', hint: 'Write today\'s memories...', icon: Icons.book_outlined, isMultiline: true),
      ],
    );
  }
}

// ── 5. Family Tree Section ──

class ProfileFamilyTreeSection extends StatelessWidget {
  const ProfileFamilyTreeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final family = [
      ('Father', 'L. Shah', '1968', 'Active'),
      ('Mother', 'K. Shah', '1973', 'Active'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...family.map((f) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF090D1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFF3B82F6),
                  radius: 18,
                  child: Icon(Icons.person, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        f.$2,
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${f.$1} • Born ${f.$3}',
                        style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right_rounded, color: Color(0xFF64748B)),
              ],
            ),
          );
        }),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF3B82F6), width: 1.2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add_rounded, color: Color(0xFF3B82F6), size: 16),
                const SizedBox(width: 6),
                Text(
                  'Add Family Member',
                  style: GoogleFonts.inter(color: const Color(0xFF3B82F6), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── 6. Life Map Section ──

class ProfileLifeMapSection extends StatelessWidget {
  const ProfileLifeMapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final places = [
      ('Birth Place', 'Phoudel, Manipur', '1997', Icons.location_on_outlined),
      ('Schooling', 'Imphal', '2003 - 2015', Icons.school_outlined),
      ('First Job', 'Bangalore, India', '2020 - Present', Icons.business_center_outlined),
    ];

    return Column(
      children: places.map((p) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Row(
            children: [
              Icon(p.$4, color: const Color(0xFFF59E0B), size: 18),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.$2,
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${p.$1} • ${p.$3}',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.pin_drop_outlined, color: Color(0xFFF59E0B), size: 16),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── 7. Memories Section ──

class ProfileMemoriesSection extends StatelessWidget {
  const ProfileMemoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF1E293B),
                ),
                child: const Icon(Icons.image_outlined, color: Color(0xFFD946EF), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Solo Hike in Western Ghats',
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Personal • High Priority',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.lock_outline_rounded, color: Color(0xFF64748B), size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

// ── 8. Photo Albums Section ──

class ProfilePhotoAlbumsSection extends StatelessWidget {
  const ProfilePhotoAlbumsSection({super.key});

  Widget _buildAlbumCard(String title, String count) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(Icons.folder_open_outlined, color: Color(0xFF00E5FF), size: 24),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            count,
            style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.2,
      children: [
        _buildAlbumCard('Family Gatherings', '24 Photos'),
        _buildAlbumCard('Travel Adventures', '48 Photos'),
      ],
    );
  }
}

// ── 9. Voice Vault Section ──

class ProfileVoiceVaultSection extends StatelessWidget {
  const ProfileVoiceVaultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Voice Synthesizer Status',
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Ready',
                    style: GoogleFonts.inter(color: const Color(0xFF10B981), fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(20, (index) {
                  final height = (index % 3 + 1) * 6.0;
                  return Container(
                    width: 3,
                    height: height,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C3AED),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── 10. Documents Section ──

class ProfileDocumentsSection extends StatelessWidget {
  const ProfileDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf_outlined, color: Color(0xFF10B981), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BCA Graduation Degree.pdf',
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Education • 1.2 MB',
                  style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Icon(Icons.download_rounded, color: Color(0xFF64748B), size: 16),
        ],
      ),
    );
  }
}

// ── 11. Legacy Messages Section ──

class ProfileLegacyMessagesSection extends StatelessWidget {
  const ProfileLegacyMessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField(label: 'To Recipient', hint: 'Select contact or email...', icon: Icons.alternate_email_rounded),
        const SizedBox(height: 14),
        _buildField(label: 'Message Content', hint: 'Your legacy message to be delivered...', icon: Icons.chat_bubble_outline_rounded, isMultiline: true),
      ],
    );
  }
}

// ── 12. Career Section ──

class ProfileCareerSection extends StatelessWidget {
  const ProfileCareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildField(label: 'Company Name', hint: 'EternalMind AI', icon: Icons.business_outlined),
        const SizedBox(height: 14),
        _buildField(label: 'Job Title', hint: 'Senior AI Engineer', icon: Icons.badge_outlined),
      ],
    );
  }
}

// ── 13. Education Section ──

class ProfileEducationSection extends StatelessWidget {
  const ProfileEducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildField(label: 'Institute', hint: 'Manipur University', icon: Icons.school_outlined),
        const SizedBox(height: 14),
        _buildField(label: 'Degree', hint: 'BCA (Computer Applications)', icon: Icons.verified_user_outlined),
      ],
    );
  }
}

// ── 14. Habits Section ──

class ProfileDailyHabitsSection extends StatelessWidget {
  final DailyHabitsTableData? habits;

  const ProfileDailyHabitsSection({super.key, required this.habits});

  Widget _habitPill(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _habitSection(String title, List<Widget> items) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...items,
        ],
      ),
    );
  }

  Widget _habitItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Color(0xFF10B981), size: 14),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = habits;
    if (h == null) {
      return _emptyPlaceholder('No daily habits recorded.', Icons.wb_sunny_outlined);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _habitPill(Icons.wb_sunny_outlined, 'Wake', h.wakeTime ?? '—', const Color(0xFFF59E0B)),
                  _habitPill(Icons.nightlight_round, 'Sleep', h.sleepTime ?? '—', const Color(0xFF3B82F6)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        if (h.prayer != null || h.teaCoffee != null || h.exercise != null) ...[
          _habitSection('🌄 Morning', [
            if (h.prayer != null) _habitItem('Prayer', h.prayer!),
            if (h.teaCoffee != null) _habitItem('Tea/Coffee', h.teaCoffee!),
            if (h.exercise != null) _habitItem('Exercise', h.exercise!),
          ]),
          const SizedBox(height: 8),
        ],

        if (h.reading != null || h.coding != null) ...[
          _habitSection('☀️ Day', [
            if (h.reading != null) _habitItem('Reading', h.reading!),
            if (h.coding != null) _habitItem('Coding', h.coding!),
          ]),
          const SizedBox(height: 8),
        ],

        if (h.meditationWalking != null || h.customHabits != null || h.smokingAlcohol != null) ...[
          _habitSection('🌆 Evening & Other', [
            if (h.meditationWalking != null) _habitItem('Meditation/Walking', h.meditationWalking!),
            if (h.smokingAlcohol != null) _habitItem('Smoking/Alcohol', h.smokingAlcohol!),
            if (h.customHabits != null) _habitItem('Custom Habits', h.customHabits!),
          ]),
        ],
      ],
    );
  }
}

// ── 15. Skills Section ──

class ProfileSkillsSection extends StatelessWidget {
  final List<SkillsTableData> skills;

  const ProfileSkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) {
      return _emptyPlaceholder('No skills added yet.', Icons.psychology_outlined);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((s) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF00E5FF)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                s.name,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ── 16. Interests Section ──

class ProfileInterestsSection extends StatelessWidget {
  final List<InterestsTableData> interests;

  const ProfileInterestsSection({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    if (interests.isEmpty) {
      return _emptyPlaceholder('No interests listed.', Icons.favorite_border_rounded);
    }
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: interests.map((i) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Text(
            i.name,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }
}

// ── 17. Goals Section ──

class ProfileGoalsSection extends StatelessWidget {
  final List<GoalsTableData> goals;

  const ProfileGoalsSection({super.key, required this.goals});

  @override
  Widget build(BuildContext context) {
    if (goals.isEmpty) {
      return _emptyPlaceholder('No goals set yet.', Icons.flag_outlined);
    }
    return Column(
      children: goals.map((g) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF00E5FF).withAlpha(20),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  g.type ?? 'Goal',
                  style: GoogleFonts.inter(color: const Color(0xFF00E5FF), fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                g.description ?? '',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.4),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── 18. Personality Section ──

class ProfilePersonalitySection extends StatelessWidget {
  final PersonalityTraitsTableData? traits;

  const ProfilePersonalitySection({super.key, required this.traits});

  @override
  Widget build(BuildContext context) {
    final t = traits;
    if (t == null) {
      return _emptyPlaceholder('No personality traits recorded.', Icons.track_changes_outlined);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personality Traits',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildTraitRow('Kindness', t.kindness),
        _buildTraitRow('Patience', t.patience),
        _buildTraitRow('Leadership', t.leadership),
        _buildTraitRow('Confidence', t.confidence),
        _buildTraitRow('Humor', t.humor),
        _buildTraitRow('Creativity', t.creativity),
        _buildTraitRow('Optimism', t.optimism),
        _buildTraitRow('Discipline', t.discipline),
        _buildTraitRow('Curiosity', t.curiosity),
        _buildTraitRow('Emotional', t.emotional),
        if (t.speakingStyle != null) ...[
          const SizedBox(height: 8),
          Text(
            'Speaking Style: ${t.speakingStyle}',
            style: GoogleFonts.inter(color: const Color(0xFF7C3AED), fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}

// ── 19. AI Personality Section ──

class ProfileAIPersonalitySection extends StatelessWidget {
  final ConversationStylesTableData? styles;

  const ProfileAIPersonalitySection({super.key, required this.styles});

  @override
  Widget build(BuildContext context) {
    final style = styles;
    if (style == null) {
      return _emptyPlaceholder('No conversation style configured.', Icons.android_outlined);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            children: [
              _buildStyleRow('Tone', style.tone ?? '—'),
              _buildStyleRow('Story Teller', style.storyTeller == 1 ? 'Yes' : 'No'),
              _buildStyleRow('Teacher Mode', style.teacherMode == 1 ? 'Yes' : 'No'),
              _buildStyleRow('Motivational', style.motivational == 1 ? 'Yes' : 'No'),
              _buildStyleRow('Reply Length', style.replyLength ?? '—'),
              _buildStyleRow('Emoji Usage', style.emojiUsage ?? '—'),
              _buildStyleRow('Local Language', style.localLanguage ?? '—'),
            ],
          ),
        ),
        if (style.favoriteGreetings != null && style.favoriteGreetings!.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            'Favorite Greetings',
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            style.favoriteGreetings!,
            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11),
          ),
        ],
      ],
    );
  }
}

// ── 20. Values & Beliefs Section ──

class ProfileValuesBeliefsSection extends StatelessWidget {
  final ValuesBeliefsTableData? values;

  const ProfileValuesBeliefsSection({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    final vb = values;
    if (vb == null) {
      return _emptyPlaceholder('No values & beliefs recorded.', Icons.auto_awesome_rounded);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (vb.religion != null && vb.religion!.isNotEmpty)
          _buildInfoCard(
            '🕌 Religion',
            vb.religion!,
            const Color(0xFF10B981),
          ),
        const SizedBox(height: 10),

        if (vb.coreValues != null && vb.coreValues!.isNotEmpty) ...[
          Text(
            '💎 Core Values',
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: vb.coreValues!.split(',').map((v) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF10B981), Color(0xFF059669)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  v.trim(),
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
        ],

        if (vb.lifePrinciples != null && vb.lifePrinciples!.isNotEmpty)
          _buildInfoCard('📜 Life Principles', vb.lifePrinciples!, const Color(0xFF7C3AED)),
        const SizedBox(height: 10),

        if (vb.ethics != null && vb.ethics!.isNotEmpty)
          _buildInfoCard('⚖️ Ethics', vb.ethics!, const Color(0xFFEC4899)),
        const SizedBox(height: 10),

        if ((vb.thingsAlwaysDo != null && vb.thingsAlwaysDo!.isNotEmpty) ||
            (vb.thingsNeverDo != null && vb.thingsNeverDo!.isNotEmpty)) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (vb.thingsAlwaysDo != null && vb.thingsAlwaysDo!.isNotEmpty)
                Expanded(
                  child: _buildInfoCard('✅ Always Do', vb.thingsAlwaysDo!, const Color(0xFF10B981)),
                ),
              if (vb.thingsAlwaysDo != null && vb.thingsAlwaysDo!.isNotEmpty &&
                  vb.thingsNeverDo != null && vb.thingsNeverDo!.isNotEmpty)
                const SizedBox(width: 8),
              if (vb.thingsNeverDo != null && vb.thingsNeverDo!.isNotEmpty)
                Expanded(
                  child: _buildInfoCard('❌ Never Do', vb.thingsNeverDo!, const Color(0xFFEF4444)),
                ),
            ],
          ),
          const SizedBox(height: 10),
        ],

        if (vb.politicalPreference != null && vb.politicalPreference!.isNotEmpty)
          _buildInfoCard('🗳️ Political', vb.politicalPreference!, const Color(0xFF3B82F6)),
      ],
    );
  }
}

// ── 21. Decision Profile Section ──

class ProfileDecisionProfileSection extends StatelessWidget {
  final DecisionProfilesTableData? decisions;

  const ProfileDecisionProfileSection({super.key, required this.decisions});

  @override
  Widget build(BuildContext context) {
    final dp = decisions;
    if (dp == null) {
      return _emptyPlaceholder('No decision profile recorded.', Icons.psychology_alt_rounded);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Decision Dimensions',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildDecisionBar('Logic', dp.logicLevel, const Color(0xFF3B82F6)),
        _buildDecisionBar('Emotion', dp.emotionLevel, const Color(0xFFEC4899)),
        _buildDecisionBar('Faith', dp.faithLevel, const Color(0xFF10B981)),
        _buildDecisionBar('Research', dp.researchLevel, const Color(0xFFF59E0B)),
        _buildDecisionBar('Experience', dp.experienceLevel, const Color(0xFF8B5CF6)),
        _buildDecisionBar('Friends Influence', dp.friendsInfluence, const Color(0xFF06B6D4)),
        _buildDecisionBar('Family Influence', dp.familyInfluence, const Color(0xFFD946EF)),
        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            children: [
              _buildDecisionStyle('Risk Level', dp.riskLevel),
              _buildDecisionStyle('Financial Style', dp.financialStyle),
              _buildDecisionStyle('Leadership', dp.leadershipStyle),
              _buildDecisionStyle('Conflict Handling', dp.conflictHandling),
            ],
          ),
        ),
      ],
    );
  }
}

// ── 22. Favorites Section ──

class ProfileFavoritesSection extends StatelessWidget {
  final List<FavoritesTableData> favorites;

  const ProfileFavoritesSection({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return _emptyPlaceholder('No favorites saved yet.', Icons.star_border_rounded);
    }
    final grouped = <String, List<FavoritesTableData>>{};
    for (final f in favorites) {
      grouped.putIfAbsent(f.type, () => []).add(f);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: grouped.entries.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.key,
                style: GoogleFonts.inter(color: const Color(0xFFEC4899), fontSize: 11, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              ...e.value.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '• ${f.value}',
                  style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.3),
                ),
              )),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── 23. Languages Section ──

class ProfileLanguagesSection extends StatelessWidget {
  final List<LanguagesTableData> languages;

  const ProfileLanguagesSection({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    if (languages.isEmpty) {
      return _emptyPlaceholder('No languages added.', Icons.translate_rounded);
    }
    return Column(
      children: languages.map((l) {
        final overall = ((l.readingRating ?? 0) + (l.writingRating ?? 0) + (l.speakingRating ?? 0)) / 15.0;
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l.language, style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('${(overall * 100).round()}%', style: GoogleFonts.inter(color: const Color(0xFF3B82F6), fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 6),
              LinearProgressIndicator(
                value: overall.clamp(0.0, 1.0),
                backgroundColor: const Color(0xFF1E293B),
                color: const Color(0xFF3B82F6),
                minHeight: 6,
                borderRadius: BorderRadius.circular(3),
              ),
              const SizedBox(height: 4),
              Text(
                'Reading: ${l.readingRating ?? 0}/5  Writing: ${l.writingRating ?? 0}/5  Speaking: ${l.speakingRating ?? 0}/5',
                style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 9, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── 24. Favorite Words Section ──

class ProfileFavoriteWordsSection extends StatelessWidget {
  final List<FavoriteWordsTableData> words;

  const ProfileFavoriteWordsSection({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return _emptyPlaceholder('No favorite words saved.', Icons.chat_bubble_outline_rounded);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${words.length} Cherished Words',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: words.map((w) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFD946EF).withAlpha(80),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD946EF).withAlpha(15),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.auto_awesome, color: const Color(0xFFD946EF), size: 12),
                  const SizedBox(width: 6),
                  Text(
                    w.word,
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ── 25. Privacy Section ──

class ProfilePrivacySection extends StatelessWidget {
  const ProfilePrivacySection({super.key});

  Widget _buildPrivacySwitch(String title, bool val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
        ),
        Switch.adaptive(
          value: val,
          onChanged: (v) {},
          activeThumbColor: const Color(0xFF00E5FF),
          activeTrackColor: const Color(0xFF00E5FF).withAlpha(100),
          inactiveThumbColor: const Color(0xFF64748B),
          inactiveTrackColor: const Color(0xFF1E293B),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPrivacySwitch('Local Enclave Encryption', true),
        const SizedBox(height: 12),
        _buildPrivacySwitch('Sync to Encrypted Cloud Backup', false),
        const SizedBox(height: 12),
        _buildPrivacySwitch('Anonymous Analytics Feedback', true),
      ],
    );
  }
}

// ── 26. Timeline Section ──

class ProfileTimelineSection extends StatelessWidget {
  final List<TimelineTableData> events;

  const ProfileTimelineSection({super.key, required this.events});

  String _emojiForEmotion(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy': case 'joy': case 'excited': return '😊';
      case 'sad': case 'sorrow': return '😢';
      case 'challenging': case 'difficult': case 'hard': return '😤';
      case 'neutral': case 'calm': return '😐';
      case 'proud': return '🥹';
      case 'grateful': return '🙏';
      case 'hopeful': return '🌟';
      case 'stressful': case 'anxious': return '😰';
      default: return '📌';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return _emptyPlaceholder('No timeline events recorded.', Icons.timeline_rounded);
    }

    return Column(
      children: [
        Text(
          '${events.length} Life Milestones',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...events.map((e) {
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 30,
                  child: Column(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF8B5CF6),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8B5CF6).withAlpha(80),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 1,
                          color: const Color(0xFF8B5CF6).withAlpha(40),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF090D1A),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF1E293B)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (e.year != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8B5CF6).withAlpha(20),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '${e.year}',
                                  style: GoogleFonts.inter(color: const Color(0xFF8B5CF6), fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              ),
                            if (e.emotion != null && e.emotion!.isNotEmpty) ...[
                              const SizedBox(width: 6),
                              Text(_emojiForEmotion(e.emotion!), style: const TextStyle(fontSize: 14)),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          e.title ?? 'Event',
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        if (e.location != null && e.location!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, color: Color(0xFF64748B), size: 12),
                              const SizedBox(width: 3),
                              Text(
                                e.location!,
                                style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                        if (e.description != null && e.description!.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            e.description!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.4),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
