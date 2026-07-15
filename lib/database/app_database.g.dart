// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HumansTableTable extends HumansTable
    with TableInfo<$HumansTableTable, HumansTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HumansTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthPlaceMeta = const VerificationMeta(
    'birthPlace',
  );
  @override
  late final GeneratedColumn<String> birthPlace = GeneratedColumn<String>(
    'birth_place',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentCityMeta = const VerificationMeta(
    'currentCity',
  );
  @override
  late final GeneratedColumn<String> currentCity = GeneratedColumn<String>(
    'current_city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nationalityMeta = const VerificationMeta(
    'nationality',
  );
  @override
  late final GeneratedColumn<String> nationality = GeneratedColumn<String>(
    'nationality',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _religionMeta = const VerificationMeta(
    'religion',
  );
  @override
  late final GeneratedColumn<String> religion = GeneratedColumn<String>(
    'religion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maritalStatusMeta = const VerificationMeta(
    'maritalStatus',
  );
  @override
  late final GeneratedColumn<String> maritalStatus = GeneratedColumn<String>(
    'marital_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occupationMeta = const VerificationMeta(
    'occupation',
  );
  @override
  late final GeneratedColumn<String> occupation = GeneratedColumn<String>(
    'occupation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aboutMeta = const VerificationMeta('about');
  @override
  late final GeneratedColumn<String> about = GeneratedColumn<String>(
    'about',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _favoriteQuotesMeta = const VerificationMeta(
    'favoriteQuotes',
  );
  @override
  late final GeneratedColumn<String> favoriteQuotes = GeneratedColumn<String>(
    'favorite_quotes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lifePhilosophyMeta = const VerificationMeta(
    'lifePhilosophy',
  );
  @override
  late final GeneratedColumn<String> lifePhilosophy = GeneratedColumn<String>(
    'life_philosophy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hobbiesMeta = const VerificationMeta(
    'hobbies',
  );
  @override
  late final GeneratedColumn<String> hobbies = GeneratedColumn<String>(
    'hobbies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languagesMeta = const VerificationMeta(
    'languages',
  );
  @override
  late final GeneratedColumn<String> languages = GeneratedColumn<String>(
    'languages',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    photoPath,
    fullName,
    nickname,
    birthDate,
    birthPlace,
    currentCity,
    nationality,
    religion,
    gender,
    maritalStatus,
    occupation,
    about,
    favoriteQuotes,
    lifePhilosophy,
    hobbies,
    languages,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'humans';
  @override
  VerificationContext validateIntegrity(
    Insertable<HumansTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('birth_place')) {
      context.handle(
        _birthPlaceMeta,
        birthPlace.isAcceptableOrUnknown(data['birth_place']!, _birthPlaceMeta),
      );
    }
    if (data.containsKey('current_city')) {
      context.handle(
        _currentCityMeta,
        currentCity.isAcceptableOrUnknown(
          data['current_city']!,
          _currentCityMeta,
        ),
      );
    }
    if (data.containsKey('nationality')) {
      context.handle(
        _nationalityMeta,
        nationality.isAcceptableOrUnknown(
          data['nationality']!,
          _nationalityMeta,
        ),
      );
    }
    if (data.containsKey('religion')) {
      context.handle(
        _religionMeta,
        religion.isAcceptableOrUnknown(data['religion']!, _religionMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('marital_status')) {
      context.handle(
        _maritalStatusMeta,
        maritalStatus.isAcceptableOrUnknown(
          data['marital_status']!,
          _maritalStatusMeta,
        ),
      );
    }
    if (data.containsKey('occupation')) {
      context.handle(
        _occupationMeta,
        occupation.isAcceptableOrUnknown(data['occupation']!, _occupationMeta),
      );
    }
    if (data.containsKey('about')) {
      context.handle(
        _aboutMeta,
        about.isAcceptableOrUnknown(data['about']!, _aboutMeta),
      );
    }
    if (data.containsKey('favorite_quotes')) {
      context.handle(
        _favoriteQuotesMeta,
        favoriteQuotes.isAcceptableOrUnknown(
          data['favorite_quotes']!,
          _favoriteQuotesMeta,
        ),
      );
    }
    if (data.containsKey('life_philosophy')) {
      context.handle(
        _lifePhilosophyMeta,
        lifePhilosophy.isAcceptableOrUnknown(
          data['life_philosophy']!,
          _lifePhilosophyMeta,
        ),
      );
    }
    if (data.containsKey('hobbies')) {
      context.handle(
        _hobbiesMeta,
        hobbies.isAcceptableOrUnknown(data['hobbies']!, _hobbiesMeta),
      );
    }
    if (data.containsKey('languages')) {
      context.handle(
        _languagesMeta,
        languages.isAcceptableOrUnknown(data['languages']!, _languagesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HumansTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HumansTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      birthPlace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birth_place'],
      ),
      currentCity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_city'],
      ),
      nationality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nationality'],
      ),
      religion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}religion'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      maritalStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marital_status'],
      ),
      occupation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occupation'],
      ),
      about: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}about'],
      ),
      favoriteQuotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}favorite_quotes'],
      ),
      lifePhilosophy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_philosophy'],
      ),
      hobbies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hobbies'],
      ),
      languages: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}languages'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $HumansTableTable createAlias(String alias) {
    return $HumansTableTable(attachedDatabase, alias);
  }
}

class HumansTableData extends DataClass implements Insertable<HumansTableData> {
  final int id;
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
  const HumansTableData({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || birthPlace != null) {
      map['birth_place'] = Variable<String>(birthPlace);
    }
    if (!nullToAbsent || currentCity != null) {
      map['current_city'] = Variable<String>(currentCity);
    }
    if (!nullToAbsent || nationality != null) {
      map['nationality'] = Variable<String>(nationality);
    }
    if (!nullToAbsent || religion != null) {
      map['religion'] = Variable<String>(religion);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || maritalStatus != null) {
      map['marital_status'] = Variable<String>(maritalStatus);
    }
    if (!nullToAbsent || occupation != null) {
      map['occupation'] = Variable<String>(occupation);
    }
    if (!nullToAbsent || about != null) {
      map['about'] = Variable<String>(about);
    }
    if (!nullToAbsent || favoriteQuotes != null) {
      map['favorite_quotes'] = Variable<String>(favoriteQuotes);
    }
    if (!nullToAbsent || lifePhilosophy != null) {
      map['life_philosophy'] = Variable<String>(lifePhilosophy);
    }
    if (!nullToAbsent || hobbies != null) {
      map['hobbies'] = Variable<String>(hobbies);
    }
    if (!nullToAbsent || languages != null) {
      map['languages'] = Variable<String>(languages);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  HumansTableCompanion toCompanion(bool nullToAbsent) {
    return HumansTableCompanion(
      id: Value(id),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      fullName: Value(fullName),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      birthPlace: birthPlace == null && nullToAbsent
          ? const Value.absent()
          : Value(birthPlace),
      currentCity: currentCity == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCity),
      nationality: nationality == null && nullToAbsent
          ? const Value.absent()
          : Value(nationality),
      religion: religion == null && nullToAbsent
          ? const Value.absent()
          : Value(religion),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      maritalStatus: maritalStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(maritalStatus),
      occupation: occupation == null && nullToAbsent
          ? const Value.absent()
          : Value(occupation),
      about: about == null && nullToAbsent
          ? const Value.absent()
          : Value(about),
      favoriteQuotes: favoriteQuotes == null && nullToAbsent
          ? const Value.absent()
          : Value(favoriteQuotes),
      lifePhilosophy: lifePhilosophy == null && nullToAbsent
          ? const Value.absent()
          : Value(lifePhilosophy),
      hobbies: hobbies == null && nullToAbsent
          ? const Value.absent()
          : Value(hobbies),
      languages: languages == null && nullToAbsent
          ? const Value.absent()
          : Value(languages),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory HumansTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HumansTableData(
      id: serializer.fromJson<int>(json['id']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      fullName: serializer.fromJson<String>(json['fullName']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      birthPlace: serializer.fromJson<String?>(json['birthPlace']),
      currentCity: serializer.fromJson<String?>(json['currentCity']),
      nationality: serializer.fromJson<String?>(json['nationality']),
      religion: serializer.fromJson<String?>(json['religion']),
      gender: serializer.fromJson<String?>(json['gender']),
      maritalStatus: serializer.fromJson<String?>(json['maritalStatus']),
      occupation: serializer.fromJson<String?>(json['occupation']),
      about: serializer.fromJson<String?>(json['about']),
      favoriteQuotes: serializer.fromJson<String?>(json['favoriteQuotes']),
      lifePhilosophy: serializer.fromJson<String?>(json['lifePhilosophy']),
      hobbies: serializer.fromJson<String?>(json['hobbies']),
      languages: serializer.fromJson<String?>(json['languages']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'photoPath': serializer.toJson<String?>(photoPath),
      'fullName': serializer.toJson<String>(fullName),
      'nickname': serializer.toJson<String?>(nickname),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'birthPlace': serializer.toJson<String?>(birthPlace),
      'currentCity': serializer.toJson<String?>(currentCity),
      'nationality': serializer.toJson<String?>(nationality),
      'religion': serializer.toJson<String?>(religion),
      'gender': serializer.toJson<String?>(gender),
      'maritalStatus': serializer.toJson<String?>(maritalStatus),
      'occupation': serializer.toJson<String?>(occupation),
      'about': serializer.toJson<String?>(about),
      'favoriteQuotes': serializer.toJson<String?>(favoriteQuotes),
      'lifePhilosophy': serializer.toJson<String?>(lifePhilosophy),
      'hobbies': serializer.toJson<String?>(hobbies),
      'languages': serializer.toJson<String?>(languages),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  HumansTableData copyWith({
    int? id,
    Value<String?> photoPath = const Value.absent(),
    String? fullName,
    Value<String?> nickname = const Value.absent(),
    Value<DateTime?> birthDate = const Value.absent(),
    Value<String?> birthPlace = const Value.absent(),
    Value<String?> currentCity = const Value.absent(),
    Value<String?> nationality = const Value.absent(),
    Value<String?> religion = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> maritalStatus = const Value.absent(),
    Value<String?> occupation = const Value.absent(),
    Value<String?> about = const Value.absent(),
    Value<String?> favoriteQuotes = const Value.absent(),
    Value<String?> lifePhilosophy = const Value.absent(),
    Value<String?> hobbies = const Value.absent(),
    Value<String?> languages = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => HumansTableData(
    id: id ?? this.id,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    fullName: fullName ?? this.fullName,
    nickname: nickname.present ? nickname.value : this.nickname,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    birthPlace: birthPlace.present ? birthPlace.value : this.birthPlace,
    currentCity: currentCity.present ? currentCity.value : this.currentCity,
    nationality: nationality.present ? nationality.value : this.nationality,
    religion: religion.present ? religion.value : this.religion,
    gender: gender.present ? gender.value : this.gender,
    maritalStatus: maritalStatus.present
        ? maritalStatus.value
        : this.maritalStatus,
    occupation: occupation.present ? occupation.value : this.occupation,
    about: about.present ? about.value : this.about,
    favoriteQuotes: favoriteQuotes.present
        ? favoriteQuotes.value
        : this.favoriteQuotes,
    lifePhilosophy: lifePhilosophy.present
        ? lifePhilosophy.value
        : this.lifePhilosophy,
    hobbies: hobbies.present ? hobbies.value : this.hobbies,
    languages: languages.present ? languages.value : this.languages,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  HumansTableData copyWithCompanion(HumansTableCompanion data) {
    return HumansTableData(
      id: data.id.present ? data.id.value : this.id,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      birthPlace: data.birthPlace.present
          ? data.birthPlace.value
          : this.birthPlace,
      currentCity: data.currentCity.present
          ? data.currentCity.value
          : this.currentCity,
      nationality: data.nationality.present
          ? data.nationality.value
          : this.nationality,
      religion: data.religion.present ? data.religion.value : this.religion,
      gender: data.gender.present ? data.gender.value : this.gender,
      maritalStatus: data.maritalStatus.present
          ? data.maritalStatus.value
          : this.maritalStatus,
      occupation: data.occupation.present
          ? data.occupation.value
          : this.occupation,
      about: data.about.present ? data.about.value : this.about,
      favoriteQuotes: data.favoriteQuotes.present
          ? data.favoriteQuotes.value
          : this.favoriteQuotes,
      lifePhilosophy: data.lifePhilosophy.present
          ? data.lifePhilosophy.value
          : this.lifePhilosophy,
      hobbies: data.hobbies.present ? data.hobbies.value : this.hobbies,
      languages: data.languages.present ? data.languages.value : this.languages,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HumansTableData(')
          ..write('id: $id, ')
          ..write('photoPath: $photoPath, ')
          ..write('fullName: $fullName, ')
          ..write('nickname: $nickname, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthPlace: $birthPlace, ')
          ..write('currentCity: $currentCity, ')
          ..write('nationality: $nationality, ')
          ..write('religion: $religion, ')
          ..write('gender: $gender, ')
          ..write('maritalStatus: $maritalStatus, ')
          ..write('occupation: $occupation, ')
          ..write('about: $about, ')
          ..write('favoriteQuotes: $favoriteQuotes, ')
          ..write('lifePhilosophy: $lifePhilosophy, ')
          ..write('hobbies: $hobbies, ')
          ..write('languages: $languages, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    photoPath,
    fullName,
    nickname,
    birthDate,
    birthPlace,
    currentCity,
    nationality,
    religion,
    gender,
    maritalStatus,
    occupation,
    about,
    favoriteQuotes,
    lifePhilosophy,
    hobbies,
    languages,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HumansTableData &&
          other.id == this.id &&
          other.photoPath == this.photoPath &&
          other.fullName == this.fullName &&
          other.nickname == this.nickname &&
          other.birthDate == this.birthDate &&
          other.birthPlace == this.birthPlace &&
          other.currentCity == this.currentCity &&
          other.nationality == this.nationality &&
          other.religion == this.religion &&
          other.gender == this.gender &&
          other.maritalStatus == this.maritalStatus &&
          other.occupation == this.occupation &&
          other.about == this.about &&
          other.favoriteQuotes == this.favoriteQuotes &&
          other.lifePhilosophy == this.lifePhilosophy &&
          other.hobbies == this.hobbies &&
          other.languages == this.languages &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HumansTableCompanion extends UpdateCompanion<HumansTableData> {
  final Value<int> id;
  final Value<String?> photoPath;
  final Value<String> fullName;
  final Value<String?> nickname;
  final Value<DateTime?> birthDate;
  final Value<String?> birthPlace;
  final Value<String?> currentCity;
  final Value<String?> nationality;
  final Value<String?> religion;
  final Value<String?> gender;
  final Value<String?> maritalStatus;
  final Value<String?> occupation;
  final Value<String?> about;
  final Value<String?> favoriteQuotes;
  final Value<String?> lifePhilosophy;
  final Value<String?> hobbies;
  final Value<String?> languages;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const HumansTableCompanion({
    this.id = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nickname = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.birthPlace = const Value.absent(),
    this.currentCity = const Value.absent(),
    this.nationality = const Value.absent(),
    this.religion = const Value.absent(),
    this.gender = const Value.absent(),
    this.maritalStatus = const Value.absent(),
    this.occupation = const Value.absent(),
    this.about = const Value.absent(),
    this.favoriteQuotes = const Value.absent(),
    this.lifePhilosophy = const Value.absent(),
    this.hobbies = const Value.absent(),
    this.languages = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  HumansTableCompanion.insert({
    this.id = const Value.absent(),
    this.photoPath = const Value.absent(),
    required String fullName,
    this.nickname = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.birthPlace = const Value.absent(),
    this.currentCity = const Value.absent(),
    this.nationality = const Value.absent(),
    this.religion = const Value.absent(),
    this.gender = const Value.absent(),
    this.maritalStatus = const Value.absent(),
    this.occupation = const Value.absent(),
    this.about = const Value.absent(),
    this.favoriteQuotes = const Value.absent(),
    this.lifePhilosophy = const Value.absent(),
    this.hobbies = const Value.absent(),
    this.languages = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : fullName = Value(fullName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<HumansTableData> custom({
    Expression<int>? id,
    Expression<String>? photoPath,
    Expression<String>? fullName,
    Expression<String>? nickname,
    Expression<DateTime>? birthDate,
    Expression<String>? birthPlace,
    Expression<String>? currentCity,
    Expression<String>? nationality,
    Expression<String>? religion,
    Expression<String>? gender,
    Expression<String>? maritalStatus,
    Expression<String>? occupation,
    Expression<String>? about,
    Expression<String>? favoriteQuotes,
    Expression<String>? lifePhilosophy,
    Expression<String>? hobbies,
    Expression<String>? languages,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (photoPath != null) 'photo_path': photoPath,
      if (fullName != null) 'full_name': fullName,
      if (nickname != null) 'nickname': nickname,
      if (birthDate != null) 'birth_date': birthDate,
      if (birthPlace != null) 'birth_place': birthPlace,
      if (currentCity != null) 'current_city': currentCity,
      if (nationality != null) 'nationality': nationality,
      if (religion != null) 'religion': religion,
      if (gender != null) 'gender': gender,
      if (maritalStatus != null) 'marital_status': maritalStatus,
      if (occupation != null) 'occupation': occupation,
      if (about != null) 'about': about,
      if (favoriteQuotes != null) 'favorite_quotes': favoriteQuotes,
      if (lifePhilosophy != null) 'life_philosophy': lifePhilosophy,
      if (hobbies != null) 'hobbies': hobbies,
      if (languages != null) 'languages': languages,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  HumansTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? photoPath,
    Value<String>? fullName,
    Value<String?>? nickname,
    Value<DateTime?>? birthDate,
    Value<String?>? birthPlace,
    Value<String?>? currentCity,
    Value<String?>? nationality,
    Value<String?>? religion,
    Value<String?>? gender,
    Value<String?>? maritalStatus,
    Value<String?>? occupation,
    Value<String?>? about,
    Value<String?>? favoriteQuotes,
    Value<String?>? lifePhilosophy,
    Value<String?>? hobbies,
    Value<String?>? languages,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return HumansTableCompanion(
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (birthPlace.present) {
      map['birth_place'] = Variable<String>(birthPlace.value);
    }
    if (currentCity.present) {
      map['current_city'] = Variable<String>(currentCity.value);
    }
    if (nationality.present) {
      map['nationality'] = Variable<String>(nationality.value);
    }
    if (religion.present) {
      map['religion'] = Variable<String>(religion.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (maritalStatus.present) {
      map['marital_status'] = Variable<String>(maritalStatus.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(occupation.value);
    }
    if (about.present) {
      map['about'] = Variable<String>(about.value);
    }
    if (favoriteQuotes.present) {
      map['favorite_quotes'] = Variable<String>(favoriteQuotes.value);
    }
    if (lifePhilosophy.present) {
      map['life_philosophy'] = Variable<String>(lifePhilosophy.value);
    }
    if (hobbies.present) {
      map['hobbies'] = Variable<String>(hobbies.value);
    }
    if (languages.present) {
      map['languages'] = Variable<String>(languages.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HumansTableCompanion(')
          ..write('id: $id, ')
          ..write('photoPath: $photoPath, ')
          ..write('fullName: $fullName, ')
          ..write('nickname: $nickname, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthPlace: $birthPlace, ')
          ..write('currentCity: $currentCity, ')
          ..write('nationality: $nationality, ')
          ..write('religion: $religion, ')
          ..write('gender: $gender, ')
          ..write('maritalStatus: $maritalStatus, ')
          ..write('occupation: $occupation, ')
          ..write('about: $about, ')
          ..write('favoriteQuotes: $favoriteQuotes, ')
          ..write('lifePhilosophy: $lifePhilosophy, ')
          ..write('hobbies: $hobbies, ')
          ..write('languages: $languages, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FamilyMembersTableTable extends FamilyMembersTable
    with TableInfo<$FamilyMembersTableTable, FamilyMembersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamilyMembersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _humanIdMeta = const VerificationMeta(
    'humanId',
  );
  @override
  late final GeneratedColumn<int> humanId = GeneratedColumn<int>(
    'human_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES humans(id) ON DELETE CASCADE',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relationshipMeta = const VerificationMeta(
    'relationship',
  );
  @override
  late final GeneratedColumn<String> relationship = GeneratedColumn<String>(
    'relationship',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthYearMeta = const VerificationMeta(
    'birthYear',
  );
  @override
  late final GeneratedColumn<int> birthYear = GeneratedColumn<int>(
    'birth_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _closenessMeta = const VerificationMeta(
    'closeness',
  );
  @override
  late final GeneratedColumn<int> closeness = GeneratedColumn<int>(
    'closeness',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    name,
    relationship,
    birthYear,
    description,
    photoPath,
    gender,
    closeness,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'family_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<FamilyMembersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('human_id')) {
      context.handle(
        _humanIdMeta,
        humanId.isAcceptableOrUnknown(data['human_id']!, _humanIdMeta),
      );
    } else if (isInserting) {
      context.missing(_humanIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
        _relationshipMeta,
        relationship.isAcceptableOrUnknown(
          data['relationship']!,
          _relationshipMeta,
        ),
      );
    }
    if (data.containsKey('birth_year')) {
      context.handle(
        _birthYearMeta,
        birthYear.isAcceptableOrUnknown(data['birth_year']!, _birthYearMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('closeness')) {
      context.handle(
        _closenessMeta,
        closeness.isAcceptableOrUnknown(data['closeness']!, _closenessMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FamilyMembersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FamilyMembersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      relationship: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship'],
      ),
      birthYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_year'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      closeness: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}closeness'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $FamilyMembersTableTable createAlias(String alias) {
    return $FamilyMembersTableTable(attachedDatabase, alias);
  }
}

class FamilyMembersTableData extends DataClass
    implements Insertable<FamilyMembersTableData> {
  final int id;
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
  const FamilyMembersTableData({
    required this.id,
    required this.humanId,
    required this.name,
    this.relationship,
    this.birthYear,
    this.description,
    this.photoPath,
    this.gender,
    this.closeness,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || relationship != null) {
      map['relationship'] = Variable<String>(relationship);
    }
    if (!nullToAbsent || birthYear != null) {
      map['birth_year'] = Variable<int>(birthYear);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || closeness != null) {
      map['closeness'] = Variable<int>(closeness);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FamilyMembersTableCompanion toCompanion(bool nullToAbsent) {
    return FamilyMembersTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      name: Value(name),
      relationship: relationship == null && nullToAbsent
          ? const Value.absent()
          : Value(relationship),
      birthYear: birthYear == null && nullToAbsent
          ? const Value.absent()
          : Value(birthYear),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      closeness: closeness == null && nullToAbsent
          ? const Value.absent()
          : Value(closeness),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory FamilyMembersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FamilyMembersTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      name: serializer.fromJson<String>(json['name']),
      relationship: serializer.fromJson<String?>(json['relationship']),
      birthYear: serializer.fromJson<int?>(json['birthYear']),
      description: serializer.fromJson<String?>(json['description']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      gender: serializer.fromJson<String?>(json['gender']),
      closeness: serializer.fromJson<int?>(json['closeness']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'name': serializer.toJson<String>(name),
      'relationship': serializer.toJson<String?>(relationship),
      'birthYear': serializer.toJson<int?>(birthYear),
      'description': serializer.toJson<String?>(description),
      'photoPath': serializer.toJson<String?>(photoPath),
      'gender': serializer.toJson<String?>(gender),
      'closeness': serializer.toJson<int?>(closeness),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FamilyMembersTableData copyWith({
    int? id,
    int? humanId,
    String? name,
    Value<String?> relationship = const Value.absent(),
    Value<int?> birthYear = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<int?> closeness = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => FamilyMembersTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    name: name ?? this.name,
    relationship: relationship.present ? relationship.value : this.relationship,
    birthYear: birthYear.present ? birthYear.value : this.birthYear,
    description: description.present ? description.value : this.description,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    gender: gender.present ? gender.value : this.gender,
    closeness: closeness.present ? closeness.value : this.closeness,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  FamilyMembersTableData copyWithCompanion(FamilyMembersTableCompanion data) {
    return FamilyMembersTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      name: data.name.present ? data.name.value : this.name,
      relationship: data.relationship.present
          ? data.relationship.value
          : this.relationship,
      birthYear: data.birthYear.present ? data.birthYear.value : this.birthYear,
      description: data.description.present
          ? data.description.value
          : this.description,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      gender: data.gender.present ? data.gender.value : this.gender,
      closeness: data.closeness.present ? data.closeness.value : this.closeness,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FamilyMembersTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('relationship: $relationship, ')
          ..write('birthYear: $birthYear, ')
          ..write('description: $description, ')
          ..write('photoPath: $photoPath, ')
          ..write('gender: $gender, ')
          ..write('closeness: $closeness, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    name,
    relationship,
    birthYear,
    description,
    photoPath,
    gender,
    closeness,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FamilyMembersTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.name == this.name &&
          other.relationship == this.relationship &&
          other.birthYear == this.birthYear &&
          other.description == this.description &&
          other.photoPath == this.photoPath &&
          other.gender == this.gender &&
          other.closeness == this.closeness &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FamilyMembersTableCompanion
    extends UpdateCompanion<FamilyMembersTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> name;
  final Value<String?> relationship;
  final Value<int?> birthYear;
  final Value<String?> description;
  final Value<String?> photoPath;
  final Value<String?> gender;
  final Value<int?> closeness;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const FamilyMembersTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.name = const Value.absent(),
    this.relationship = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.description = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.gender = const Value.absent(),
    this.closeness = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FamilyMembersTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String name,
    this.relationship = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.description = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.gender = const Value.absent(),
    this.closeness = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : humanId = Value(humanId),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<FamilyMembersTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? name,
    Expression<String>? relationship,
    Expression<int>? birthYear,
    Expression<String>? description,
    Expression<String>? photoPath,
    Expression<String>? gender,
    Expression<int>? closeness,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (name != null) 'name': name,
      if (relationship != null) 'relationship': relationship,
      if (birthYear != null) 'birth_year': birthYear,
      if (description != null) 'description': description,
      if (photoPath != null) 'photo_path': photoPath,
      if (gender != null) 'gender': gender,
      if (closeness != null) 'closeness': closeness,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FamilyMembersTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? name,
    Value<String?>? relationship,
    Value<int?>? birthYear,
    Value<String?>? description,
    Value<String?>? photoPath,
    Value<String?>? gender,
    Value<int?>? closeness,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return FamilyMembersTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      name: name ?? this.name,
      relationship: relationship ?? this.relationship,
      birthYear: birthYear ?? this.birthYear,
      description: description ?? this.description,
      photoPath: photoPath ?? this.photoPath,
      gender: gender ?? this.gender,
      closeness: closeness ?? this.closeness,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (humanId.present) {
      map['human_id'] = Variable<int>(humanId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<String>(relationship.value);
    }
    if (birthYear.present) {
      map['birth_year'] = Variable<int>(birthYear.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (closeness.present) {
      map['closeness'] = Variable<int>(closeness.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilyMembersTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('relationship: $relationship, ')
          ..write('birthYear: $birthYear, ')
          ..write('description: $description, ')
          ..write('photoPath: $photoPath, ')
          ..write('gender: $gender, ')
          ..write('closeness: $closeness, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EducationTableTable extends EducationTable
    with TableInfo<$EducationTableTable, EducationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EducationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _humanIdMeta = const VerificationMeta(
    'humanId',
  );
  @override
  late final GeneratedColumn<int> humanId = GeneratedColumn<int>(
    'human_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES humans(id) ON DELETE CASCADE',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _courseMeta = const VerificationMeta('course');
  @override
  late final GeneratedColumn<String> course = GeneratedColumn<String>(
    'course',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _degreeMeta = const VerificationMeta('degree');
  @override
  late final GeneratedColumn<String> degree = GeneratedColumn<String>(
    'degree',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _schoolMeta = const VerificationMeta('school');
  @override
  late final GeneratedColumn<String> school = GeneratedColumn<String>(
    'school',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startYearMeta = const VerificationMeta(
    'startYear',
  );
  @override
  late final GeneratedColumn<int> startYear = GeneratedColumn<int>(
    'start_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endYearMeta = const VerificationMeta(
    'endYear',
  );
  @override
  late final GeneratedColumn<int> endYear = GeneratedColumn<int>(
    'end_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _achievementsMeta = const VerificationMeta(
    'achievements',
  );
  @override
  late final GeneratedColumn<String> achievements = GeneratedColumn<String>(
    'achievements',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _certificatePathMeta = const VerificationMeta(
    'certificatePath',
  );
  @override
  late final GeneratedColumn<String> certificatePath = GeneratedColumn<String>(
    'certificate_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    type,
    course,
    degree,
    school,
    startYear,
    endYear,
    achievements,
    certificatePath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'education';
  @override
  VerificationContext validateIntegrity(
    Insertable<EducationTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('human_id')) {
      context.handle(
        _humanIdMeta,
        humanId.isAcceptableOrUnknown(data['human_id']!, _humanIdMeta),
      );
    } else if (isInserting) {
      context.missing(_humanIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('course')) {
      context.handle(
        _courseMeta,
        course.isAcceptableOrUnknown(data['course']!, _courseMeta),
      );
    }
    if (data.containsKey('degree')) {
      context.handle(
        _degreeMeta,
        degree.isAcceptableOrUnknown(data['degree']!, _degreeMeta),
      );
    }
    if (data.containsKey('school')) {
      context.handle(
        _schoolMeta,
        school.isAcceptableOrUnknown(data['school']!, _schoolMeta),
      );
    }
    if (data.containsKey('start_year')) {
      context.handle(
        _startYearMeta,
        startYear.isAcceptableOrUnknown(data['start_year']!, _startYearMeta),
      );
    }
    if (data.containsKey('end_year')) {
      context.handle(
        _endYearMeta,
        endYear.isAcceptableOrUnknown(data['end_year']!, _endYearMeta),
      );
    }
    if (data.containsKey('achievements')) {
      context.handle(
        _achievementsMeta,
        achievements.isAcceptableOrUnknown(
          data['achievements']!,
          _achievementsMeta,
        ),
      );
    }
    if (data.containsKey('certificate_path')) {
      context.handle(
        _certificatePathMeta,
        certificatePath.isAcceptableOrUnknown(
          data['certificate_path']!,
          _certificatePathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EducationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EducationTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      course: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course'],
      ),
      degree: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}degree'],
      ),
      school: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school'],
      ),
      startYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_year'],
      ),
      endYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_year'],
      ),
      achievements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievements'],
      ),
      certificatePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certificate_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $EducationTableTable createAlias(String alias) {
    return $EducationTableTable(attachedDatabase, alias);
  }
}

class EducationTableData extends DataClass
    implements Insertable<EducationTableData> {
  final int id;
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
  const EducationTableData({
    required this.id,
    required this.humanId,
    this.type,
    this.course,
    this.degree,
    this.school,
    this.startYear,
    this.endYear,
    this.achievements,
    this.certificatePath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || course != null) {
      map['course'] = Variable<String>(course);
    }
    if (!nullToAbsent || degree != null) {
      map['degree'] = Variable<String>(degree);
    }
    if (!nullToAbsent || school != null) {
      map['school'] = Variable<String>(school);
    }
    if (!nullToAbsent || startYear != null) {
      map['start_year'] = Variable<int>(startYear);
    }
    if (!nullToAbsent || endYear != null) {
      map['end_year'] = Variable<int>(endYear);
    }
    if (!nullToAbsent || achievements != null) {
      map['achievements'] = Variable<String>(achievements);
    }
    if (!nullToAbsent || certificatePath != null) {
      map['certificate_path'] = Variable<String>(certificatePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  EducationTableCompanion toCompanion(bool nullToAbsent) {
    return EducationTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      course: course == null && nullToAbsent
          ? const Value.absent()
          : Value(course),
      degree: degree == null && nullToAbsent
          ? const Value.absent()
          : Value(degree),
      school: school == null && nullToAbsent
          ? const Value.absent()
          : Value(school),
      startYear: startYear == null && nullToAbsent
          ? const Value.absent()
          : Value(startYear),
      endYear: endYear == null && nullToAbsent
          ? const Value.absent()
          : Value(endYear),
      achievements: achievements == null && nullToAbsent
          ? const Value.absent()
          : Value(achievements),
      certificatePath: certificatePath == null && nullToAbsent
          ? const Value.absent()
          : Value(certificatePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory EducationTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EducationTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      type: serializer.fromJson<String?>(json['type']),
      course: serializer.fromJson<String?>(json['course']),
      degree: serializer.fromJson<String?>(json['degree']),
      school: serializer.fromJson<String?>(json['school']),
      startYear: serializer.fromJson<int?>(json['startYear']),
      endYear: serializer.fromJson<int?>(json['endYear']),
      achievements: serializer.fromJson<String?>(json['achievements']),
      certificatePath: serializer.fromJson<String?>(json['certificatePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'type': serializer.toJson<String?>(type),
      'course': serializer.toJson<String?>(course),
      'degree': serializer.toJson<String?>(degree),
      'school': serializer.toJson<String?>(school),
      'startYear': serializer.toJson<int?>(startYear),
      'endYear': serializer.toJson<int?>(endYear),
      'achievements': serializer.toJson<String?>(achievements),
      'certificatePath': serializer.toJson<String?>(certificatePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  EducationTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> type = const Value.absent(),
    Value<String?> course = const Value.absent(),
    Value<String?> degree = const Value.absent(),
    Value<String?> school = const Value.absent(),
    Value<int?> startYear = const Value.absent(),
    Value<int?> endYear = const Value.absent(),
    Value<String?> achievements = const Value.absent(),
    Value<String?> certificatePath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => EducationTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    type: type.present ? type.value : this.type,
    course: course.present ? course.value : this.course,
    degree: degree.present ? degree.value : this.degree,
    school: school.present ? school.value : this.school,
    startYear: startYear.present ? startYear.value : this.startYear,
    endYear: endYear.present ? endYear.value : this.endYear,
    achievements: achievements.present ? achievements.value : this.achievements,
    certificatePath: certificatePath.present
        ? certificatePath.value
        : this.certificatePath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  EducationTableData copyWithCompanion(EducationTableCompanion data) {
    return EducationTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      type: data.type.present ? data.type.value : this.type,
      course: data.course.present ? data.course.value : this.course,
      degree: data.degree.present ? data.degree.value : this.degree,
      school: data.school.present ? data.school.value : this.school,
      startYear: data.startYear.present ? data.startYear.value : this.startYear,
      endYear: data.endYear.present ? data.endYear.value : this.endYear,
      achievements: data.achievements.present
          ? data.achievements.value
          : this.achievements,
      certificatePath: data.certificatePath.present
          ? data.certificatePath.value
          : this.certificatePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EducationTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('course: $course, ')
          ..write('degree: $degree, ')
          ..write('school: $school, ')
          ..write('startYear: $startYear, ')
          ..write('endYear: $endYear, ')
          ..write('achievements: $achievements, ')
          ..write('certificatePath: $certificatePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    type,
    course,
    degree,
    school,
    startYear,
    endYear,
    achievements,
    certificatePath,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EducationTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.type == this.type &&
          other.course == this.course &&
          other.degree == this.degree &&
          other.school == this.school &&
          other.startYear == this.startYear &&
          other.endYear == this.endYear &&
          other.achievements == this.achievements &&
          other.certificatePath == this.certificatePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EducationTableCompanion extends UpdateCompanion<EducationTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> type;
  final Value<String?> course;
  final Value<String?> degree;
  final Value<String?> school;
  final Value<int?> startYear;
  final Value<int?> endYear;
  final Value<String?> achievements;
  final Value<String?> certificatePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const EducationTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.type = const Value.absent(),
    this.course = const Value.absent(),
    this.degree = const Value.absent(),
    this.school = const Value.absent(),
    this.startYear = const Value.absent(),
    this.endYear = const Value.absent(),
    this.achievements = const Value.absent(),
    this.certificatePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EducationTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.type = const Value.absent(),
    this.course = const Value.absent(),
    this.degree = const Value.absent(),
    this.school = const Value.absent(),
    this.startYear = const Value.absent(),
    this.endYear = const Value.absent(),
    this.achievements = const Value.absent(),
    this.certificatePath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<EducationTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? type,
    Expression<String>? course,
    Expression<String>? degree,
    Expression<String>? school,
    Expression<int>? startYear,
    Expression<int>? endYear,
    Expression<String>? achievements,
    Expression<String>? certificatePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (type != null) 'type': type,
      if (course != null) 'course': course,
      if (degree != null) 'degree': degree,
      if (school != null) 'school': school,
      if (startYear != null) 'start_year': startYear,
      if (endYear != null) 'end_year': endYear,
      if (achievements != null) 'achievements': achievements,
      if (certificatePath != null) 'certificate_path': certificatePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EducationTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? type,
    Value<String?>? course,
    Value<String?>? degree,
    Value<String?>? school,
    Value<int?>? startYear,
    Value<int?>? endYear,
    Value<String?>? achievements,
    Value<String?>? certificatePath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return EducationTableCompanion(
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
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (humanId.present) {
      map['human_id'] = Variable<int>(humanId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (course.present) {
      map['course'] = Variable<String>(course.value);
    }
    if (degree.present) {
      map['degree'] = Variable<String>(degree.value);
    }
    if (school.present) {
      map['school'] = Variable<String>(school.value);
    }
    if (startYear.present) {
      map['start_year'] = Variable<int>(startYear.value);
    }
    if (endYear.present) {
      map['end_year'] = Variable<int>(endYear.value);
    }
    if (achievements.present) {
      map['achievements'] = Variable<String>(achievements.value);
    }
    if (certificatePath.present) {
      map['certificate_path'] = Variable<String>(certificatePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EducationTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('course: $course, ')
          ..write('degree: $degree, ')
          ..write('school: $school, ')
          ..write('startYear: $startYear, ')
          ..write('endYear: $endYear, ')
          ..write('achievements: $achievements, ')
          ..write('certificatePath: $certificatePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CareerHistoryTableTable extends CareerHistoryTable
    with TableInfo<$CareerHistoryTableTable, CareerHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CareerHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _humanIdMeta = const VerificationMeta(
    'humanId',
  );
  @override
  late final GeneratedColumn<int> humanId = GeneratedColumn<int>(
    'human_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES humans(id) ON DELETE CASCADE',
  );
  static const VerificationMeta _companyMeta = const VerificationMeta(
    'company',
  );
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
    'company',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _responsibilitiesMeta = const VerificationMeta(
    'responsibilities',
  );
  @override
  late final GeneratedColumn<String> responsibilities = GeneratedColumn<String>(
    'responsibilities',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _achievementsMeta = const VerificationMeta(
    'achievements',
  );
  @override
  late final GeneratedColumn<String> achievements = GeneratedColumn<String>(
    'achievements',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    company,
    position,
    location,
    startDate,
    endDate,
    responsibilities,
    achievements,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'career_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<CareerHistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('human_id')) {
      context.handle(
        _humanIdMeta,
        humanId.isAcceptableOrUnknown(data['human_id']!, _humanIdMeta),
      );
    } else if (isInserting) {
      context.missing(_humanIdMeta);
    }
    if (data.containsKey('company')) {
      context.handle(
        _companyMeta,
        company.isAcceptableOrUnknown(data['company']!, _companyMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('responsibilities')) {
      context.handle(
        _responsibilitiesMeta,
        responsibilities.isAcceptableOrUnknown(
          data['responsibilities']!,
          _responsibilitiesMeta,
        ),
      );
    }
    if (data.containsKey('achievements')) {
      context.handle(
        _achievementsMeta,
        achievements.isAcceptableOrUnknown(
          data['achievements']!,
          _achievementsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CareerHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CareerHistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      company: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company'],
      ),
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_date'],
      ),
      responsibilities: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}responsibilities'],
      ),
      achievements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievements'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CareerHistoryTableTable createAlias(String alias) {
    return $CareerHistoryTableTable(attachedDatabase, alias);
  }
}

class CareerHistoryTableData extends DataClass
    implements Insertable<CareerHistoryTableData> {
  final int id;
  final int humanId;
  final String? company;
  final String? position;
  final String? location;
  final String? startDate;
  final String? endDate;
  final String? responsibilities;
  final String? achievements;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CareerHistoryTableData({
    required this.id,
    required this.humanId,
    this.company,
    this.position,
    this.location,
    this.startDate,
    this.endDate,
    this.responsibilities,
    this.achievements,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || company != null) {
      map['company'] = Variable<String>(company);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<String>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    if (!nullToAbsent || responsibilities != null) {
      map['responsibilities'] = Variable<String>(responsibilities);
    }
    if (!nullToAbsent || achievements != null) {
      map['achievements'] = Variable<String>(achievements);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CareerHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return CareerHistoryTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      responsibilities: responsibilities == null && nullToAbsent
          ? const Value.absent()
          : Value(responsibilities),
      achievements: achievements == null && nullToAbsent
          ? const Value.absent()
          : Value(achievements),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CareerHistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CareerHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      company: serializer.fromJson<String?>(json['company']),
      position: serializer.fromJson<String?>(json['position']),
      location: serializer.fromJson<String?>(json['location']),
      startDate: serializer.fromJson<String?>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      responsibilities: serializer.fromJson<String?>(json['responsibilities']),
      achievements: serializer.fromJson<String?>(json['achievements']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'company': serializer.toJson<String?>(company),
      'position': serializer.toJson<String?>(position),
      'location': serializer.toJson<String?>(location),
      'startDate': serializer.toJson<String?>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
      'responsibilities': serializer.toJson<String?>(responsibilities),
      'achievements': serializer.toJson<String?>(achievements),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CareerHistoryTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> company = const Value.absent(),
    Value<String?> position = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> startDate = const Value.absent(),
    Value<String?> endDate = const Value.absent(),
    Value<String?> responsibilities = const Value.absent(),
    Value<String?> achievements = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CareerHistoryTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    company: company.present ? company.value : this.company,
    position: position.present ? position.value : this.position,
    location: location.present ? location.value : this.location,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    responsibilities: responsibilities.present
        ? responsibilities.value
        : this.responsibilities,
    achievements: achievements.present ? achievements.value : this.achievements,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CareerHistoryTableData copyWithCompanion(CareerHistoryTableCompanion data) {
    return CareerHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      company: data.company.present ? data.company.value : this.company,
      position: data.position.present ? data.position.value : this.position,
      location: data.location.present ? data.location.value : this.location,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      responsibilities: data.responsibilities.present
          ? data.responsibilities.value
          : this.responsibilities,
      achievements: data.achievements.present
          ? data.achievements.value
          : this.achievements,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CareerHistoryTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('company: $company, ')
          ..write('position: $position, ')
          ..write('location: $location, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('responsibilities: $responsibilities, ')
          ..write('achievements: $achievements, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    company,
    position,
    location,
    startDate,
    endDate,
    responsibilities,
    achievements,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CareerHistoryTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.company == this.company &&
          other.position == this.position &&
          other.location == this.location &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.responsibilities == this.responsibilities &&
          other.achievements == this.achievements &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CareerHistoryTableCompanion
    extends UpdateCompanion<CareerHistoryTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> company;
  final Value<String?> position;
  final Value<String?> location;
  final Value<String?> startDate;
  final Value<String?> endDate;
  final Value<String?> responsibilities;
  final Value<String?> achievements;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CareerHistoryTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.company = const Value.absent(),
    this.position = const Value.absent(),
    this.location = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.responsibilities = const Value.absent(),
    this.achievements = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CareerHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.company = const Value.absent(),
    this.position = const Value.absent(),
    this.location = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.responsibilities = const Value.absent(),
    this.achievements = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CareerHistoryTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? company,
    Expression<String>? position,
    Expression<String>? location,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<String>? responsibilities,
    Expression<String>? achievements,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (company != null) 'company': company,
      if (position != null) 'position': position,
      if (location != null) 'location': location,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (responsibilities != null) 'responsibilities': responsibilities,
      if (achievements != null) 'achievements': achievements,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CareerHistoryTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? company,
    Value<String?>? position,
    Value<String?>? location,
    Value<String?>? startDate,
    Value<String?>? endDate,
    Value<String?>? responsibilities,
    Value<String?>? achievements,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CareerHistoryTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      company: company ?? this.company,
      position: position ?? this.position,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      responsibilities: responsibilities ?? this.responsibilities,
      achievements: achievements ?? this.achievements,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (humanId.present) {
      map['human_id'] = Variable<int>(humanId.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (responsibilities.present) {
      map['responsibilities'] = Variable<String>(responsibilities.value);
    }
    if (achievements.present) {
      map['achievements'] = Variable<String>(achievements.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CareerHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('company: $company, ')
          ..write('position: $position, ')
          ..write('location: $location, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('responsibilities: $responsibilities, ')
          ..write('achievements: $achievements, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HumansTableTable humansTable = $HumansTableTable(this);
  late final $FamilyMembersTableTable familyMembersTable =
      $FamilyMembersTableTable(this);
  late final $EducationTableTable educationTable = $EducationTableTable(this);
  late final $CareerHistoryTableTable careerHistoryTable =
      $CareerHistoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    humansTable,
    familyMembersTable,
    educationTable,
    careerHistoryTable,
  ];
}

typedef $$HumansTableTableCreateCompanionBuilder =
    HumansTableCompanion Function({
      Value<int> id,
      Value<String?> photoPath,
      required String fullName,
      Value<String?> nickname,
      Value<DateTime?> birthDate,
      Value<String?> birthPlace,
      Value<String?> currentCity,
      Value<String?> nationality,
      Value<String?> religion,
      Value<String?> gender,
      Value<String?> maritalStatus,
      Value<String?> occupation,
      Value<String?> about,
      Value<String?> favoriteQuotes,
      Value<String?> lifePhilosophy,
      Value<String?> hobbies,
      Value<String?> languages,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$HumansTableTableUpdateCompanionBuilder =
    HumansTableCompanion Function({
      Value<int> id,
      Value<String?> photoPath,
      Value<String> fullName,
      Value<String?> nickname,
      Value<DateTime?> birthDate,
      Value<String?> birthPlace,
      Value<String?> currentCity,
      Value<String?> nationality,
      Value<String?> religion,
      Value<String?> gender,
      Value<String?> maritalStatus,
      Value<String?> occupation,
      Value<String?> about,
      Value<String?> favoriteQuotes,
      Value<String?> lifePhilosophy,
      Value<String?> hobbies,
      Value<String?> languages,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$HumansTableTableFilterComposer
    extends Composer<_$AppDatabase, $HumansTableTable> {
  $$HumansTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthPlace => $composableBuilder(
    column: $table.birthPlace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentCity => $composableBuilder(
    column: $table.currentCity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get maritalStatus => $composableBuilder(
    column: $table.maritalStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get about => $composableBuilder(
    column: $table.about,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get favoriteQuotes => $composableBuilder(
    column: $table.favoriteQuotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifePhilosophy => $composableBuilder(
    column: $table.lifePhilosophy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hobbies => $composableBuilder(
    column: $table.hobbies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HumansTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HumansTableTable> {
  $$HumansTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthPlace => $composableBuilder(
    column: $table.birthPlace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentCity => $composableBuilder(
    column: $table.currentCity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get maritalStatus => $composableBuilder(
    column: $table.maritalStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get about => $composableBuilder(
    column: $table.about,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get favoriteQuotes => $composableBuilder(
    column: $table.favoriteQuotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifePhilosophy => $composableBuilder(
    column: $table.lifePhilosophy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hobbies => $composableBuilder(
    column: $table.hobbies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HumansTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HumansTableTable> {
  $$HumansTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get birthPlace => $composableBuilder(
    column: $table.birthPlace,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentCity => $composableBuilder(
    column: $table.currentCity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => column,
  );

  GeneratedColumn<String> get religion =>
      $composableBuilder(column: $table.religion, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get maritalStatus => $composableBuilder(
    column: $table.maritalStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get about =>
      $composableBuilder(column: $table.about, builder: (column) => column);

  GeneratedColumn<String> get favoriteQuotes => $composableBuilder(
    column: $table.favoriteQuotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lifePhilosophy => $composableBuilder(
    column: $table.lifePhilosophy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hobbies =>
      $composableBuilder(column: $table.hobbies, builder: (column) => column);

  GeneratedColumn<String> get languages =>
      $composableBuilder(column: $table.languages, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$HumansTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HumansTableTable,
          HumansTableData,
          $$HumansTableTableFilterComposer,
          $$HumansTableTableOrderingComposer,
          $$HumansTableTableAnnotationComposer,
          $$HumansTableTableCreateCompanionBuilder,
          $$HumansTableTableUpdateCompanionBuilder,
          (
            HumansTableData,
            BaseReferences<_$AppDatabase, $HumansTableTable, HumansTableData>,
          ),
          HumansTableData,
          PrefetchHooks Function()
        > {
  $$HumansTableTableTableManager(_$AppDatabase db, $HumansTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HumansTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HumansTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HumansTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String?> birthPlace = const Value.absent(),
                Value<String?> currentCity = const Value.absent(),
                Value<String?> nationality = const Value.absent(),
                Value<String?> religion = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> maritalStatus = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> about = const Value.absent(),
                Value<String?> favoriteQuotes = const Value.absent(),
                Value<String?> lifePhilosophy = const Value.absent(),
                Value<String?> hobbies = const Value.absent(),
                Value<String?> languages = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => HumansTableCompanion(
                id: id,
                photoPath: photoPath,
                fullName: fullName,
                nickname: nickname,
                birthDate: birthDate,
                birthPlace: birthPlace,
                currentCity: currentCity,
                nationality: nationality,
                religion: religion,
                gender: gender,
                maritalStatus: maritalStatus,
                occupation: occupation,
                about: about,
                favoriteQuotes: favoriteQuotes,
                lifePhilosophy: lifePhilosophy,
                hobbies: hobbies,
                languages: languages,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                required String fullName,
                Value<String?> nickname = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String?> birthPlace = const Value.absent(),
                Value<String?> currentCity = const Value.absent(),
                Value<String?> nationality = const Value.absent(),
                Value<String?> religion = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> maritalStatus = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> about = const Value.absent(),
                Value<String?> favoriteQuotes = const Value.absent(),
                Value<String?> lifePhilosophy = const Value.absent(),
                Value<String?> hobbies = const Value.absent(),
                Value<String?> languages = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => HumansTableCompanion.insert(
                id: id,
                photoPath: photoPath,
                fullName: fullName,
                nickname: nickname,
                birthDate: birthDate,
                birthPlace: birthPlace,
                currentCity: currentCity,
                nationality: nationality,
                religion: religion,
                gender: gender,
                maritalStatus: maritalStatus,
                occupation: occupation,
                about: about,
                favoriteQuotes: favoriteQuotes,
                lifePhilosophy: lifePhilosophy,
                hobbies: hobbies,
                languages: languages,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HumansTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HumansTableTable,
      HumansTableData,
      $$HumansTableTableFilterComposer,
      $$HumansTableTableOrderingComposer,
      $$HumansTableTableAnnotationComposer,
      $$HumansTableTableCreateCompanionBuilder,
      $$HumansTableTableUpdateCompanionBuilder,
      (
        HumansTableData,
        BaseReferences<_$AppDatabase, $HumansTableTable, HumansTableData>,
      ),
      HumansTableData,
      PrefetchHooks Function()
    >;
typedef $$FamilyMembersTableTableCreateCompanionBuilder =
    FamilyMembersTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String name,
      Value<String?> relationship,
      Value<int?> birthYear,
      Value<String?> description,
      Value<String?> photoPath,
      Value<String?> gender,
      Value<int?> closeness,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$FamilyMembersTableTableUpdateCompanionBuilder =
    FamilyMembersTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> name,
      Value<String?> relationship,
      Value<int?> birthYear,
      Value<String?> description,
      Value<String?> photoPath,
      Value<String?> gender,
      Value<int?> closeness,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$FamilyMembersTableTableFilterComposer
    extends Composer<_$AppDatabase, $FamilyMembersTableTable> {
  $$FamilyMembersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get humanId => $composableBuilder(
    column: $table.humanId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get closeness => $composableBuilder(
    column: $table.closeness,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FamilyMembersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FamilyMembersTableTable> {
  $$FamilyMembersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get humanId => $composableBuilder(
    column: $table.humanId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get closeness => $composableBuilder(
    column: $table.closeness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FamilyMembersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FamilyMembersTableTable> {
  $$FamilyMembersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get humanId =>
      $composableBuilder(column: $table.humanId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => column,
  );

  GeneratedColumn<int> get birthYear =>
      $composableBuilder(column: $table.birthYear, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<int> get closeness =>
      $composableBuilder(column: $table.closeness, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FamilyMembersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FamilyMembersTableTable,
          FamilyMembersTableData,
          $$FamilyMembersTableTableFilterComposer,
          $$FamilyMembersTableTableOrderingComposer,
          $$FamilyMembersTableTableAnnotationComposer,
          $$FamilyMembersTableTableCreateCompanionBuilder,
          $$FamilyMembersTableTableUpdateCompanionBuilder,
          (
            FamilyMembersTableData,
            BaseReferences<
              _$AppDatabase,
              $FamilyMembersTableTable,
              FamilyMembersTableData
            >,
          ),
          FamilyMembersTableData,
          PrefetchHooks Function()
        > {
  $$FamilyMembersTableTableTableManager(
    _$AppDatabase db,
    $FamilyMembersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FamilyMembersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FamilyMembersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FamilyMembersTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> relationship = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<int?> closeness = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => FamilyMembersTableCompanion(
                id: id,
                humanId: humanId,
                name: name,
                relationship: relationship,
                birthYear: birthYear,
                description: description,
                photoPath: photoPath,
                gender: gender,
                closeness: closeness,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String name,
                Value<String?> relationship = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<int?> closeness = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => FamilyMembersTableCompanion.insert(
                id: id,
                humanId: humanId,
                name: name,
                relationship: relationship,
                birthYear: birthYear,
                description: description,
                photoPath: photoPath,
                gender: gender,
                closeness: closeness,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FamilyMembersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FamilyMembersTableTable,
      FamilyMembersTableData,
      $$FamilyMembersTableTableFilterComposer,
      $$FamilyMembersTableTableOrderingComposer,
      $$FamilyMembersTableTableAnnotationComposer,
      $$FamilyMembersTableTableCreateCompanionBuilder,
      $$FamilyMembersTableTableUpdateCompanionBuilder,
      (
        FamilyMembersTableData,
        BaseReferences<
          _$AppDatabase,
          $FamilyMembersTableTable,
          FamilyMembersTableData
        >,
      ),
      FamilyMembersTableData,
      PrefetchHooks Function()
    >;
typedef $$EducationTableTableCreateCompanionBuilder =
    EducationTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> type,
      Value<String?> course,
      Value<String?> degree,
      Value<String?> school,
      Value<int?> startYear,
      Value<int?> endYear,
      Value<String?> achievements,
      Value<String?> certificatePath,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$EducationTableTableUpdateCompanionBuilder =
    EducationTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> type,
      Value<String?> course,
      Value<String?> degree,
      Value<String?> school,
      Value<int?> startYear,
      Value<int?> endYear,
      Value<String?> achievements,
      Value<String?> certificatePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$EducationTableTableFilterComposer
    extends Composer<_$AppDatabase, $EducationTableTable> {
  $$EducationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get humanId => $composableBuilder(
    column: $table.humanId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get course => $composableBuilder(
    column: $table.course,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get degree => $composableBuilder(
    column: $table.degree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get school => $composableBuilder(
    column: $table.school,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startYear => $composableBuilder(
    column: $table.startYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endYear => $composableBuilder(
    column: $table.endYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievements => $composableBuilder(
    column: $table.achievements,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get certificatePath => $composableBuilder(
    column: $table.certificatePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EducationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EducationTableTable> {
  $$EducationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get humanId => $composableBuilder(
    column: $table.humanId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get course => $composableBuilder(
    column: $table.course,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get degree => $composableBuilder(
    column: $table.degree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get school => $composableBuilder(
    column: $table.school,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startYear => $composableBuilder(
    column: $table.startYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endYear => $composableBuilder(
    column: $table.endYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievements => $composableBuilder(
    column: $table.achievements,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get certificatePath => $composableBuilder(
    column: $table.certificatePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EducationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EducationTableTable> {
  $$EducationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get humanId =>
      $composableBuilder(column: $table.humanId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get course =>
      $composableBuilder(column: $table.course, builder: (column) => column);

  GeneratedColumn<String> get degree =>
      $composableBuilder(column: $table.degree, builder: (column) => column);

  GeneratedColumn<String> get school =>
      $composableBuilder(column: $table.school, builder: (column) => column);

  GeneratedColumn<int> get startYear =>
      $composableBuilder(column: $table.startYear, builder: (column) => column);

  GeneratedColumn<int> get endYear =>
      $composableBuilder(column: $table.endYear, builder: (column) => column);

  GeneratedColumn<String> get achievements => $composableBuilder(
    column: $table.achievements,
    builder: (column) => column,
  );

  GeneratedColumn<String> get certificatePath => $composableBuilder(
    column: $table.certificatePath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$EducationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EducationTableTable,
          EducationTableData,
          $$EducationTableTableFilterComposer,
          $$EducationTableTableOrderingComposer,
          $$EducationTableTableAnnotationComposer,
          $$EducationTableTableCreateCompanionBuilder,
          $$EducationTableTableUpdateCompanionBuilder,
          (
            EducationTableData,
            BaseReferences<
              _$AppDatabase,
              $EducationTableTable,
              EducationTableData
            >,
          ),
          EducationTableData,
          PrefetchHooks Function()
        > {
  $$EducationTableTableTableManager(
    _$AppDatabase db,
    $EducationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EducationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EducationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EducationTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> course = const Value.absent(),
                Value<String?> degree = const Value.absent(),
                Value<String?> school = const Value.absent(),
                Value<int?> startYear = const Value.absent(),
                Value<int?> endYear = const Value.absent(),
                Value<String?> achievements = const Value.absent(),
                Value<String?> certificatePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => EducationTableCompanion(
                id: id,
                humanId: humanId,
                type: type,
                course: course,
                degree: degree,
                school: school,
                startYear: startYear,
                endYear: endYear,
                achievements: achievements,
                certificatePath: certificatePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> type = const Value.absent(),
                Value<String?> course = const Value.absent(),
                Value<String?> degree = const Value.absent(),
                Value<String?> school = const Value.absent(),
                Value<int?> startYear = const Value.absent(),
                Value<int?> endYear = const Value.absent(),
                Value<String?> achievements = const Value.absent(),
                Value<String?> certificatePath = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => EducationTableCompanion.insert(
                id: id,
                humanId: humanId,
                type: type,
                course: course,
                degree: degree,
                school: school,
                startYear: startYear,
                endYear: endYear,
                achievements: achievements,
                certificatePath: certificatePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EducationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EducationTableTable,
      EducationTableData,
      $$EducationTableTableFilterComposer,
      $$EducationTableTableOrderingComposer,
      $$EducationTableTableAnnotationComposer,
      $$EducationTableTableCreateCompanionBuilder,
      $$EducationTableTableUpdateCompanionBuilder,
      (
        EducationTableData,
        BaseReferences<_$AppDatabase, $EducationTableTable, EducationTableData>,
      ),
      EducationTableData,
      PrefetchHooks Function()
    >;
typedef $$CareerHistoryTableTableCreateCompanionBuilder =
    CareerHistoryTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> company,
      Value<String?> position,
      Value<String?> location,
      Value<String?> startDate,
      Value<String?> endDate,
      Value<String?> responsibilities,
      Value<String?> achievements,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$CareerHistoryTableTableUpdateCompanionBuilder =
    CareerHistoryTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> company,
      Value<String?> position,
      Value<String?> location,
      Value<String?> startDate,
      Value<String?> endDate,
      Value<String?> responsibilities,
      Value<String?> achievements,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$CareerHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CareerHistoryTableTable> {
  $$CareerHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get humanId => $composableBuilder(
    column: $table.humanId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responsibilities => $composableBuilder(
    column: $table.responsibilities,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievements => $composableBuilder(
    column: $table.achievements,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CareerHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CareerHistoryTableTable> {
  $$CareerHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get humanId => $composableBuilder(
    column: $table.humanId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responsibilities => $composableBuilder(
    column: $table.responsibilities,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievements => $composableBuilder(
    column: $table.achievements,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CareerHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CareerHistoryTableTable> {
  $$CareerHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get humanId =>
      $composableBuilder(column: $table.humanId, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get responsibilities => $composableBuilder(
    column: $table.responsibilities,
    builder: (column) => column,
  );

  GeneratedColumn<String> get achievements => $composableBuilder(
    column: $table.achievements,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CareerHistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CareerHistoryTableTable,
          CareerHistoryTableData,
          $$CareerHistoryTableTableFilterComposer,
          $$CareerHistoryTableTableOrderingComposer,
          $$CareerHistoryTableTableAnnotationComposer,
          $$CareerHistoryTableTableCreateCompanionBuilder,
          $$CareerHistoryTableTableUpdateCompanionBuilder,
          (
            CareerHistoryTableData,
            BaseReferences<
              _$AppDatabase,
              $CareerHistoryTableTable,
              CareerHistoryTableData
            >,
          ),
          CareerHistoryTableData,
          PrefetchHooks Function()
        > {
  $$CareerHistoryTableTableTableManager(
    _$AppDatabase db,
    $CareerHistoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CareerHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CareerHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CareerHistoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> company = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> startDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<String?> responsibilities = const Value.absent(),
                Value<String?> achievements = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CareerHistoryTableCompanion(
                id: id,
                humanId: humanId,
                company: company,
                position: position,
                location: location,
                startDate: startDate,
                endDate: endDate,
                responsibilities: responsibilities,
                achievements: achievements,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> company = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> startDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<String?> responsibilities = const Value.absent(),
                Value<String?> achievements = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => CareerHistoryTableCompanion.insert(
                id: id,
                humanId: humanId,
                company: company,
                position: position,
                location: location,
                startDate: startDate,
                endDate: endDate,
                responsibilities: responsibilities,
                achievements: achievements,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CareerHistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CareerHistoryTableTable,
      CareerHistoryTableData,
      $$CareerHistoryTableTableFilterComposer,
      $$CareerHistoryTableTableOrderingComposer,
      $$CareerHistoryTableTableAnnotationComposer,
      $$CareerHistoryTableTableCreateCompanionBuilder,
      $$CareerHistoryTableTableUpdateCompanionBuilder,
      (
        CareerHistoryTableData,
        BaseReferences<
          _$AppDatabase,
          $CareerHistoryTableTable,
          CareerHistoryTableData
        >,
      ),
      CareerHistoryTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HumansTableTableTableManager get humansTable =>
      $$HumansTableTableTableManager(_db, _db.humansTable);
  $$FamilyMembersTableTableTableManager get familyMembersTable =>
      $$FamilyMembersTableTableTableManager(_db, _db.familyMembersTable);
  $$EducationTableTableTableManager get educationTable =>
      $$EducationTableTableTableManager(_db, _db.educationTable);
  $$CareerHistoryTableTableTableManager get careerHistoryTable =>
      $$CareerHistoryTableTableTableManager(_db, _db.careerHistoryTable);
}
