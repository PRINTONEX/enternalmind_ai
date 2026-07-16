import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FamilyMemberModel {
  final String id;
  final String name;
  final String relation; // Father, Mother, Brother, Sister, Son, Daughter
  final String birthDetails; // 1965 -, 04 Dec 1997, 6 Years
  final String imageAsset;
  final String gender; // Male, Female
  final Color colorTheme;
  final bool isYou;

  FamilyMemberModel({
    required this.id,
    required this.name,
    required this.relation,
    required this.birthDetails,
    required this.imageAsset,
    required this.gender,
    required this.colorTheme,
    this.isYou = false,
  });
}

class FamilyTreeState {
  final List<FamilyMemberModel> members;
  final String selectedTab; // Tree View, List View, Statistics

  FamilyTreeState({
    required this.members,
    this.selectedTab = 'Tree View',
  });

  FamilyTreeState copyWith({
    List<FamilyMemberModel>? members,
    String? selectedTab,
  }) {
    return FamilyTreeState(
      members: members ?? this.members,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}

class FamilyTreeNotifier extends StateNotifier<FamilyTreeState> {
  FamilyTreeNotifier() : super(FamilyTreeState(members: [])) {
    state = FamilyTreeState(
      members: [
        FamilyMemberModel(
          id: 'father',
          name: 'Mohammad Shah',
          relation: 'Father',
          birthDetails: '1965 -',
          imageAsset: 'assets/avatars/family_father.png',
          gender: 'Male',
          colorTheme: const Color(0xFF3B82F6), // blue
        ),
        FamilyMemberModel(
          id: 'mother',
          name: 'Shabana Begum',
          relation: 'Mother',
          birthDetails: '1968 -',
          imageAsset: 'assets/avatars/family_mother.png',
          gender: 'Female',
          colorTheme: const Color(0xFFEC4899), // pink
        ),
        FamilyMemberModel(
          id: 'you',
          name: 'Aftab Shah',
          relation: 'Son',
          birthDetails: '04 Dec 1997',
          imageAsset: 'assets/avatars/aftab.png',
          gender: 'Male',
          colorTheme: const Color(0xFF00E5FF), // cyan
          isYou: true,
        ),
        FamilyMemberModel(
          id: 'arif',
          name: 'Arif Shah',
          relation: 'Brother',
          birthDetails: '02 Mar 2000',
          imageAsset: 'assets/avatars/family_arif.png',
          gender: 'Male',
          colorTheme: const Color(0xFF3B82F6), // blue
        ),
        FamilyMemberModel(
          id: 'sara',
          name: 'Sara Shah',
          relation: 'Sister',
          birthDetails: '12 Aug 2003',
          imageAsset: 'assets/avatars/family_sara.png',
          gender: 'Female',
          colorTheme: const Color(0xFFEC4899), // pink
        ),
        FamilyMemberModel(
          id: 'armaan',
          name: 'Armaan Shah',
          relation: 'Son (Arif\'s)',
          birthDetails: '6 Years',
          imageAsset: 'assets/avatars/family_armaan.png',
          gender: 'Male',
          colorTheme: const Color(0xFF06B6D4), // cyan/blue
        ),
        FamilyMemberModel(
          id: 'yusuf',
          name: 'Yusuf Shah',
          relation: 'Son (Arif\'s)',
          birthDetails: '3.5 Years',
          imageAsset: 'assets/avatars/family_yusuf.png',
          gender: 'Male',
          colorTheme: const Color(0xFF06B6D4), // cyan/blue
        ),
      ],
    );
  }

  void selectTab(String tab) {
    state = state.copyWith(selectedTab: tab);
  }

  void addMember(FamilyMemberModel member) {
    state = state.copyWith(members: [...state.members, member]);
  }
}

final familyTreeProvider = StateNotifierProvider<FamilyTreeNotifier, FamilyTreeState>((ref) {
  return FamilyTreeNotifier();
});
