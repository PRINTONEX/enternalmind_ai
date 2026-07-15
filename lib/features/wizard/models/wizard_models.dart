/// Domain models for the Profile Wizard.
///
/// These are clean Dart models that map to/from Drift generated types.
library;

import 'package:drift/drift.dart';
import '../../../database/app_database.dart';

/// Clean domain model for a Human profile.
class ProfileModel {
  ProfileModel({
    this.id,
    this.photoPath,
    required this.fullName,
    this.nickname,
    this.birthDate,
    this.birthPlace,
    this.currentCity,
    this.nationality,
    this.religion,
    this.gender,
    this.maritalStatus,
    this.occupation,
    this.about,
    this.favoriteQuotes,
    this.lifePhilosophy,
    this.hobbies,
    this.languages,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final int? id;
  final String? photoPath;
  final String fullName;
  final String? nickname;
  final DateTime? birthDate;
  final String? birthPlace;
  final String? currentCity;
  final String? nationality;
  final String? religion;
  final String? gender;
  final String? maritalStatus;
  final String? occupation;
  final String? about;
  final String? favoriteQuotes;
  final String? lifePhilosophy;
  final String? hobbies;
  final String? languages;
  final DateTime createdAt;
  final DateTime updatedAt;

  HumansTableCompanion toCompanion() {
    return HumansTableCompanion.insert(
      fullName: fullName,
      photoPath: Value(photoPath),
      nickname: Value(nickname),
      birthDate: Value(birthDate),
      birthPlace: Value(birthPlace),
      currentCity: Value(currentCity),
      nationality: Value(nationality),
      religion: Value(religion),
      gender: Value(gender),
      maritalStatus: Value(maritalStatus),
      occupation: Value(occupation),
      about: Value(about),
      favoriteQuotes: Value(favoriteQuotes),
      lifePhilosophy: Value(lifePhilosophy),
      hobbies: Value(hobbies),
      languages: Value(languages),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  HumansTableCompanion toUpdateCompanion() {
    return HumansTableCompanion(
      photoPath: Value(photoPath),
      fullName: Value(fullName),
      nickname: Value(nickname),
      birthDate: Value(birthDate),
      birthPlace: Value(birthPlace),
      currentCity: Value(currentCity),
      nationality: Value(nationality),
      religion: Value(religion),
      gender: Value(gender),
      maritalStatus: Value(maritalStatus),
      occupation: Value(occupation),
      about: Value(about),
      favoriteQuotes: Value(favoriteQuotes),
      lifePhilosophy: Value(lifePhilosophy),
      hobbies: Value(hobbies),
      languages: Value(languages),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProfileModel.fromDrift(HumansTableData data) {
    return ProfileModel(
      id: data.id,
      photoPath: data.photoPath,
      fullName: data.fullName,
      nickname: data.nickname,
      birthDate: data.birthDate,
      birthPlace: data.birthPlace,
      currentCity: data.currentCity,
      nationality: data.nationality,
      religion: data.religion,
      gender: data.gender,
      maritalStatus: data.maritalStatus,
      occupation: data.occupation,
      about: data.about,
      favoriteQuotes: data.favoriteQuotes,
      lifePhilosophy: data.lifePhilosophy,
      hobbies: data.hobbies,
      languages: data.languages,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  ProfileModel copyWith({
    int? id,
    String? photoPath,
    String? fullName,
    String? nickname,
    DateTime? birthDate,
    String? birthPlace,
    String? currentCity,
    String? nationality,
    String? religion,
    String? gender,
    String? maritalStatus,
    String? occupation,
    String? about,
    String? favoriteQuotes,
    String? lifePhilosophy,
    String? hobbies,
    String? languages,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      photoPath: photoPath ?? this.photoPath,
      fullName: fullName ?? this.fullName,
      nickname: nickname ?? this.nickname,
      birthDate: birthDate ?? this.birthDate,
      birthPlace: birthPlace ?? this.birthPlace,
      currentCity: currentCity ?? this.currentCity,
      nationality: nationality ?? this.nationality,
      religion: religion ?? this.religion,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      occupation: occupation ?? this.occupation,
      about: about ?? this.about,
      favoriteQuotes: favoriteQuotes ?? this.favoriteQuotes,
      lifePhilosophy: lifePhilosophy ?? this.lifePhilosophy,
      hobbies: hobbies ?? this.hobbies,
      languages: languages ?? this.languages,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Domain model for a Family member.
class FamilyMemberModel {
  FamilyMemberModel({
    this.id,
    required this.humanId,
    required this.name,
    this.relationship,
    this.birthYear,
    this.description,
    this.photoPath,
    this.gender,
    this.closeness,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final int? id;
  final int humanId;
  final String name;
  final String? relationship;
  final int? birthYear;
  final String? description;
  final String? photoPath;
  final String? gender;
  final int? closeness;
  final DateTime createdAt;
  final DateTime updatedAt;

  FamilyMembersTableCompanion toCompanion() {
    return FamilyMembersTableCompanion.insert(
      humanId: humanId,
      name: name,
      relationship: Value(relationship),
      birthYear: Value(birthYear),
      description: Value(description),
      photoPath: Value(photoPath),
      gender: Value(gender),
      closeness: Value(closeness),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  FamilyMembersTableCompanion toUpdateCompanion() {
    return FamilyMembersTableCompanion(
      name: Value(name),
      relationship: Value(relationship),
      birthYear: Value(birthYear),
      description: Value(description),
      photoPath: Value(photoPath),
      gender: Value(gender),
      closeness: Value(closeness),
      updatedAt: Value(updatedAt),
    );
  }

  factory FamilyMemberModel.fromDrift(FamilyMembersTableData data) {
    return FamilyMemberModel(
      id: data.id,
      humanId: data.humanId,
      name: data.name,
      relationship: data.relationship,
      birthYear: data.birthYear,
      description: data.description,
      photoPath: data.photoPath,
      gender: data.gender,
      closeness: data.closeness,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  FamilyMemberModel copyWith({
    int? id,
    int? humanId,
    String? name,
    String? relationship,
    int? birthYear,
    String? description,
    String? photoPath,
    String? gender,
    int? closeness,
  }) {
    return FamilyMemberModel(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      name: name ?? this.name,
      relationship: relationship ?? this.relationship,
      birthYear: birthYear ?? this.birthYear,
      description: description ?? this.description,
      photoPath: photoPath ?? this.photoPath,
      gender: gender ?? this.gender,
      closeness: closeness ?? this.closeness,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}

/// Domain model for an Education record.
class EducationModel {
  EducationModel({
    this.id,
    required this.humanId,
    this.type,
    this.course,
    this.degree,
    this.school,
    this.startYear,
    this.endYear,
    this.achievements,
    this.certificatePath,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final int? id;
  final int humanId;
  final String? type;
  final String? course;
  final String? degree;
  final String? school;
  final int? startYear;
  final int? endYear;
  final String? achievements;
  final String? certificatePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  EducationTableCompanion toCompanion() {
    return EducationTableCompanion.insert(
      humanId: humanId,
      type: Value(type),
      course: Value(course),
      degree: Value(degree),
      school: Value(school),
      startYear: Value(startYear),
      endYear: Value(endYear),
      achievements: Value(achievements),
      certificatePath: Value(certificatePath),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  EducationTableCompanion toUpdateCompanion() {
    return EducationTableCompanion(
      type: Value(type),
      course: Value(course),
      degree: Value(degree),
      school: Value(school),
      startYear: Value(startYear),
      endYear: Value(endYear),
      achievements: Value(achievements),
      certificatePath: Value(certificatePath),
      updatedAt: Value(updatedAt),
    );
  }

  factory EducationModel.fromDrift(EducationTableData data) {
    return EducationModel(
      id: data.id,
      humanId: data.humanId,
      type: data.type,
      course: data.course,
      degree: data.degree,
      school: data.school,
      startYear: data.startYear,
      endYear: data.endYear,
      achievements: data.achievements,
      certificatePath: data.certificatePath,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  EducationModel copyWith({
    int? id,
    int? humanId,
    String? type,
    String? course,
    String? degree,
    String? school,
    int? startYear,
    int? endYear,
    String? achievements,
    String? certificatePath,
  }) {
    return EducationModel(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      type: type ?? this.type,
      course: course ?? this.course,
      degree: degree ?? this.degree,
      school: school ?? this.school,
      startYear: startYear ?? this.startYear,
      endYear: endYear ?? this.endYear,
      achievements: achievements ?? this.achievements,
      certificatePath: certificatePath ?? this.certificatePath,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
