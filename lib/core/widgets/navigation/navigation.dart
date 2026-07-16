import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

/// ── BottomNavigation ──
class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: BorderSide(color: AppColors.glassBorder, width: 1.2),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: items,
            backgroundColor: AppColors.surfaceGlass,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textTertiary,
            selectedLabelStyle: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold),
            unselectedLabelStyle: GoogleFonts.inter(fontSize: 10),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

/// ── FloatingCenterFAB ──
class FloatingCenterFAB extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const FloatingCenterFAB({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(80),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: RawMaterialButton(
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}

/// ── TopGlassBar ──
class TopGlassBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget title;
  final List<Widget>? actions;
  final double height;

  const TopGlassBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
    this.height = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: AppColors.glassBorder, width: 1.0),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: AppBar(
            leading: leading,
            title: title,
            actions: actions,
            backgroundColor: AppColors.surfaceGlass,
            elevation: 0,
            centerTitle: true,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

/// ── SideDrawer ──
class SideDrawer extends StatelessWidget {
  final String replicaName;
  final List<Widget> children;

  const SideDrawer({
    super.key,
    required this.replicaName,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF03050A),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    replicaName,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'EternalMind AI double',
                    style: GoogleFonts.inter(
                      color: AppColors.secondary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.glassBorder, height: 1),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ── Breadcrumb ──
class Breadcrumb extends StatelessWidget {
  final List<String> paths;

  const Breadcrumb({
    super.key,
    required this.paths,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: List.generate(paths.length * 2 - 1, (index) {
          final isSegment = index % 2 == 0;
          final segmentIndex = index ~/ 2;
          if (isSegment) {
            final isLast = segmentIndex == paths.length - 1;
            return Text(
              paths[segmentIndex],
              style: GoogleFonts.inter(
                color: isLast ? Colors.white : AppColors.textTertiary,
                fontSize: 11,
                fontWeight: isLast ? FontWeight.bold : FontWeight.w500,
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary, size: 12),
            );
          }
        }),
      ),
    );
  }
}
