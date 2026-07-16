import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelineEventModel {
  final String id;
  final int year;
  final String title;
  final String category; // Milestone, Education, Career, Personal
  final String description;
  final String dateStr;
  final String imageAsset;
  final Color dotColor;

  TimelineEventModel({
    required this.id,
    required this.year,
    required this.title,
    required this.category,
    required this.description,
    required this.dateStr,
    required this.imageAsset,
    required this.dotColor,
  });
}

class TimelineState {
  final List<TimelineEventModel> events;
  final String selectedCategory; // All, Milestones, Education, Career, Personal

  TimelineState({
    required this.events,
    this.selectedCategory = 'All',
  });

  List<TimelineEventModel> get filteredEvents {
    if (selectedCategory == 'All') return events;
    return events.where((e) {
      if (selectedCategory == 'Milestones') return e.category == 'Milestone';
      return e.category == selectedCategory;
    }).toList();
  }

  TimelineState copyWith({
    List<TimelineEventModel>? events,
    String? selectedCategory,
  }) {
    return TimelineState(
      events: events ?? this.events,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class TimelineNotifier extends StateNotifier<TimelineState> {
  TimelineNotifier() : super(TimelineState(events: [])) {
    state = TimelineState(
      events: [
        TimelineEventModel(
          id: '1',
          year: 1997,
          title: 'Born',
          category: 'Milestone',
          description: 'I was born on 04 December 1997 in Phoudel, Manipur.',
          dateStr: '04 Dec 1997',
          imageAsset: 'assets/illustrations/timeline_baby.png',
          dotColor: const Color(0xFFD946EF), // pink/magenta
        ),
        TimelineEventModel(
          id: '2',
          year: 2015,
          title: 'Completed Higher Secondary',
          category: 'Education',
          description: 'Completed my Higher Secondary from Nambol Higher Secondary School.',
          dateStr: 'March 2015',
          imageAsset: 'assets/illustrations/timeline_grad.png',
          dotColor: const Color(0xFF3B82F6), // blue
        ),
        TimelineEventModel(
          id: '3',
          year: 2019,
          title: 'Graduated BCA',
          category: 'Education',
          description: 'Graduated with a Bachelor of Computer Applications.',
          dateStr: 'May 2019',
          imageAsset: 'assets/illustrations/timeline_college.png',
          dotColor: const Color(0xFF06B6D4), // cyan
        ),
        TimelineEventModel(
          id: '4',
          year: 2020,
          title: 'Started Career',
          category: 'Career',
          description: 'Started my professional journey in the tech industry.',
          dateStr: 'July 2020',
          imageAsset: 'assets/illustrations/timeline_career.png',
          dotColor: const Color(0xFFEC4899), // red/pink
        ),
        TimelineEventModel(
          id: '5',
          year: 2022,
          title: 'Solo Trip to Manali',
          category: 'Personal',
          description: 'My first solo trip — a life changing experience.',
          dateStr: 'October 2022',
          imageAsset: 'assets/illustrations/timeline_manali.png',
          dotColor: const Color(0xFF8B5CF6), // purple
        ),
        TimelineEventModel(
          id: '6',
          year: 2024,
          title: 'Family Vacation',
          category: 'Personal',
          description: 'Amazing vacation with my family to Shimla.',
          dateStr: 'June 2024',
          imageAsset: 'assets/illustrations/timeline_family.png',
          dotColor: const Color(0xFFF59E0B), // orange
        ),
      ],
    );
  }

  void selectCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  void addEvent(TimelineEventModel event) {
    state = state.copyWith(events: [...state.events, event]..sort((a, b) => a.year.compareTo(b.year)));
  }
}

final timelineProvider = StateNotifierProvider<TimelineNotifier, TimelineState>((ref) {
  return TimelineNotifier();
});
