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

class $SkillsTableTable extends SkillsTable
    with TableInfo<$SkillsTableTable, SkillsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillsTableTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, humanId, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skills';
  @override
  VerificationContext validateIntegrity(
    Insertable<SkillsTableData> instance, {
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SkillsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SkillsTableData(
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SkillsTableTable createAlias(String alias) {
    return $SkillsTableTable(attachedDatabase, alias);
  }
}

class SkillsTableData extends DataClass implements Insertable<SkillsTableData> {
  final int id;
  final int humanId;
  final String name;
  final DateTime createdAt;
  const SkillsTableData({
    required this.id,
    required this.humanId,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SkillsTableCompanion toCompanion(bool nullToAbsent) {
    return SkillsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory SkillsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SkillsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SkillsTableData copyWith({
    int? id,
    int? humanId,
    String? name,
    DateTime? createdAt,
  }) => SkillsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  SkillsTableData copyWithCompanion(SkillsTableCompanion data) {
    return SkillsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SkillsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, humanId, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SkillsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class SkillsTableCompanion extends UpdateCompanion<SkillsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const SkillsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SkillsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String name,
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<SkillsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SkillsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? name,
    Value<DateTime>? createdAt,
  }) {
    return SkillsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LanguagesTableTable extends LanguagesTable
    with TableInfo<$LanguagesTableTable, LanguagesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LanguagesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readingRatingMeta = const VerificationMeta(
    'readingRating',
  );
  @override
  late final GeneratedColumn<int> readingRating = GeneratedColumn<int>(
    'reading_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _writingRatingMeta = const VerificationMeta(
    'writingRating',
  );
  @override
  late final GeneratedColumn<int> writingRating = GeneratedColumn<int>(
    'writing_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speakingRatingMeta = const VerificationMeta(
    'speakingRating',
  );
  @override
  late final GeneratedColumn<int> speakingRating = GeneratedColumn<int>(
    'speaking_rating',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    language,
    readingRating,
    writingRating,
    speakingRating,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'languages';
  @override
  VerificationContext validateIntegrity(
    Insertable<LanguagesTableData> instance, {
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
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('reading_rating')) {
      context.handle(
        _readingRatingMeta,
        readingRating.isAcceptableOrUnknown(
          data['reading_rating']!,
          _readingRatingMeta,
        ),
      );
    }
    if (data.containsKey('writing_rating')) {
      context.handle(
        _writingRatingMeta,
        writingRating.isAcceptableOrUnknown(
          data['writing_rating']!,
          _writingRatingMeta,
        ),
      );
    }
    if (data.containsKey('speaking_rating')) {
      context.handle(
        _speakingRatingMeta,
        speakingRating.isAcceptableOrUnknown(
          data['speaking_rating']!,
          _speakingRatingMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LanguagesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LanguagesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      readingRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reading_rating'],
      ),
      writingRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}writing_rating'],
      ),
      speakingRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}speaking_rating'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LanguagesTableTable createAlias(String alias) {
    return $LanguagesTableTable(attachedDatabase, alias);
  }
}

class LanguagesTableData extends DataClass
    implements Insertable<LanguagesTableData> {
  final int id;
  final int humanId;
  final String language;
  final int? readingRating;
  final int? writingRating;
  final int? speakingRating;
  final DateTime createdAt;
  const LanguagesTableData({
    required this.id,
    required this.humanId,
    required this.language,
    this.readingRating,
    this.writingRating,
    this.speakingRating,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['language'] = Variable<String>(language);
    if (!nullToAbsent || readingRating != null) {
      map['reading_rating'] = Variable<int>(readingRating);
    }
    if (!nullToAbsent || writingRating != null) {
      map['writing_rating'] = Variable<int>(writingRating);
    }
    if (!nullToAbsent || speakingRating != null) {
      map['speaking_rating'] = Variable<int>(speakingRating);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LanguagesTableCompanion toCompanion(bool nullToAbsent) {
    return LanguagesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      language: Value(language),
      readingRating: readingRating == null && nullToAbsent
          ? const Value.absent()
          : Value(readingRating),
      writingRating: writingRating == null && nullToAbsent
          ? const Value.absent()
          : Value(writingRating),
      speakingRating: speakingRating == null && nullToAbsent
          ? const Value.absent()
          : Value(speakingRating),
      createdAt: Value(createdAt),
    );
  }

  factory LanguagesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LanguagesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      language: serializer.fromJson<String>(json['language']),
      readingRating: serializer.fromJson<int?>(json['readingRating']),
      writingRating: serializer.fromJson<int?>(json['writingRating']),
      speakingRating: serializer.fromJson<int?>(json['speakingRating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'language': serializer.toJson<String>(language),
      'readingRating': serializer.toJson<int?>(readingRating),
      'writingRating': serializer.toJson<int?>(writingRating),
      'speakingRating': serializer.toJson<int?>(speakingRating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LanguagesTableData copyWith({
    int? id,
    int? humanId,
    String? language,
    Value<int?> readingRating = const Value.absent(),
    Value<int?> writingRating = const Value.absent(),
    Value<int?> speakingRating = const Value.absent(),
    DateTime? createdAt,
  }) => LanguagesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    language: language ?? this.language,
    readingRating: readingRating.present
        ? readingRating.value
        : this.readingRating,
    writingRating: writingRating.present
        ? writingRating.value
        : this.writingRating,
    speakingRating: speakingRating.present
        ? speakingRating.value
        : this.speakingRating,
    createdAt: createdAt ?? this.createdAt,
  );
  LanguagesTableData copyWithCompanion(LanguagesTableCompanion data) {
    return LanguagesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      language: data.language.present ? data.language.value : this.language,
      readingRating: data.readingRating.present
          ? data.readingRating.value
          : this.readingRating,
      writingRating: data.writingRating.present
          ? data.writingRating.value
          : this.writingRating,
      speakingRating: data.speakingRating.present
          ? data.speakingRating.value
          : this.speakingRating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LanguagesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('language: $language, ')
          ..write('readingRating: $readingRating, ')
          ..write('writingRating: $writingRating, ')
          ..write('speakingRating: $speakingRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    language,
    readingRating,
    writingRating,
    speakingRating,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LanguagesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.language == this.language &&
          other.readingRating == this.readingRating &&
          other.writingRating == this.writingRating &&
          other.speakingRating == this.speakingRating &&
          other.createdAt == this.createdAt);
}

class LanguagesTableCompanion extends UpdateCompanion<LanguagesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> language;
  final Value<int?> readingRating;
  final Value<int?> writingRating;
  final Value<int?> speakingRating;
  final Value<DateTime> createdAt;
  const LanguagesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.language = const Value.absent(),
    this.readingRating = const Value.absent(),
    this.writingRating = const Value.absent(),
    this.speakingRating = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LanguagesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String language,
    this.readingRating = const Value.absent(),
    this.writingRating = const Value.absent(),
    this.speakingRating = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       language = Value(language),
       createdAt = Value(createdAt);
  static Insertable<LanguagesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? language,
    Expression<int>? readingRating,
    Expression<int>? writingRating,
    Expression<int>? speakingRating,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (language != null) 'language': language,
      if (readingRating != null) 'reading_rating': readingRating,
      if (writingRating != null) 'writing_rating': writingRating,
      if (speakingRating != null) 'speaking_rating': speakingRating,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LanguagesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? language,
    Value<int?>? readingRating,
    Value<int?>? writingRating,
    Value<int?>? speakingRating,
    Value<DateTime>? createdAt,
  }) {
    return LanguagesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      language: language ?? this.language,
      readingRating: readingRating ?? this.readingRating,
      writingRating: writingRating ?? this.writingRating,
      speakingRating: speakingRating ?? this.speakingRating,
      createdAt: createdAt ?? this.createdAt,
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
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (readingRating.present) {
      map['reading_rating'] = Variable<int>(readingRating.value);
    }
    if (writingRating.present) {
      map['writing_rating'] = Variable<int>(writingRating.value);
    }
    if (speakingRating.present) {
      map['speaking_rating'] = Variable<int>(speakingRating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LanguagesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('language: $language, ')
          ..write('readingRating: $readingRating, ')
          ..write('writingRating: $writingRating, ')
          ..write('speakingRating: $speakingRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $InterestsTableTable extends InterestsTable
    with TableInfo<$InterestsTableTable, InterestsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterestsTableTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, humanId, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interests';
  @override
  VerificationContext validateIntegrity(
    Insertable<InterestsTableData> instance, {
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InterestsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InterestsTableData(
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $InterestsTableTable createAlias(String alias) {
    return $InterestsTableTable(attachedDatabase, alias);
  }
}

class InterestsTableData extends DataClass
    implements Insertable<InterestsTableData> {
  final int id;
  final int humanId;
  final String name;
  final DateTime createdAt;
  const InterestsTableData({
    required this.id,
    required this.humanId,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  InterestsTableCompanion toCompanion(bool nullToAbsent) {
    return InterestsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory InterestsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InterestsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  InterestsTableData copyWith({
    int? id,
    int? humanId,
    String? name,
    DateTime? createdAt,
  }) => InterestsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  InterestsTableData copyWithCompanion(InterestsTableCompanion data) {
    return InterestsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InterestsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, humanId, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InterestsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class InterestsTableCompanion extends UpdateCompanion<InterestsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const InterestsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  InterestsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String name,
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<InterestsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  InterestsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? name,
    Value<DateTime>? createdAt,
  }) {
    return InterestsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterestsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $GoalsTableTable extends GoalsTable
    with TableInfo<$GoalsTableTable, GoalsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTableTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    type,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<GoalsTableData> instance, {
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalsTableData(
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
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GoalsTableTable createAlias(String alias) {
    return $GoalsTableTable(attachedDatabase, alias);
  }
}

class GoalsTableData extends DataClass implements Insertable<GoalsTableData> {
  final int id;
  final int humanId;
  final String? type;
  final String? description;
  final DateTime createdAt;
  const GoalsTableData({
    required this.id,
    required this.humanId,
    this.type,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GoalsTableCompanion toCompanion(bool nullToAbsent) {
    return GoalsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory GoalsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      type: serializer.fromJson<String?>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'type': serializer.toJson<String?>(type),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GoalsTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> type = const Value.absent(),
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => GoalsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    type: type.present ? type.value : this.type,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  GoalsTableData copyWithCompanion(GoalsTableCompanion data) {
    return GoalsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, humanId, type, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.type == this.type &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class GoalsTableCompanion extends UpdateCompanion<GoalsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> type;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  const GoalsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GoalsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<GoalsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? type,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GoalsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? type,
    Value<String?>? description,
    Value<DateTime>? createdAt,
  }) {
    return GoalsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      type: type ?? this.type,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PersonalityTraitsTableTable extends PersonalityTraitsTable
    with TableInfo<$PersonalityTraitsTableTable, PersonalityTraitsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonalityTraitsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _kindnessMeta = const VerificationMeta(
    'kindness',
  );
  @override
  late final GeneratedColumn<int> kindness = GeneratedColumn<int>(
    'kindness',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _patienceMeta = const VerificationMeta(
    'patience',
  );
  @override
  late final GeneratedColumn<int> patience = GeneratedColumn<int>(
    'patience',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _leadershipMeta = const VerificationMeta(
    'leadership',
  );
  @override
  late final GeneratedColumn<int> leadership = GeneratedColumn<int>(
    'leadership',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _humorMeta = const VerificationMeta('humor');
  @override
  late final GeneratedColumn<int> humor = GeneratedColumn<int>(
    'humor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creativityMeta = const VerificationMeta(
    'creativity',
  );
  @override
  late final GeneratedColumn<int> creativity = GeneratedColumn<int>(
    'creativity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _optimismMeta = const VerificationMeta(
    'optimism',
  );
  @override
  late final GeneratedColumn<int> optimism = GeneratedColumn<int>(
    'optimism',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _disciplineMeta = const VerificationMeta(
    'discipline',
  );
  @override
  late final GeneratedColumn<int> discipline = GeneratedColumn<int>(
    'discipline',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _curiosityMeta = const VerificationMeta(
    'curiosity',
  );
  @override
  late final GeneratedColumn<int> curiosity = GeneratedColumn<int>(
    'curiosity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionalMeta = const VerificationMeta(
    'emotional',
  );
  @override
  late final GeneratedColumn<int> emotional = GeneratedColumn<int>(
    'emotional',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speakingStyleMeta = const VerificationMeta(
    'speakingStyle',
  );
  @override
  late final GeneratedColumn<String> speakingStyle = GeneratedColumn<String>(
    'speaking_style',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    kindness,
    patience,
    leadership,
    confidence,
    humor,
    creativity,
    optimism,
    discipline,
    curiosity,
    emotional,
    speakingStyle,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personality_traits';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonalityTraitsTableData> instance, {
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
    if (data.containsKey('kindness')) {
      context.handle(
        _kindnessMeta,
        kindness.isAcceptableOrUnknown(data['kindness']!, _kindnessMeta),
      );
    }
    if (data.containsKey('patience')) {
      context.handle(
        _patienceMeta,
        patience.isAcceptableOrUnknown(data['patience']!, _patienceMeta),
      );
    }
    if (data.containsKey('leadership')) {
      context.handle(
        _leadershipMeta,
        leadership.isAcceptableOrUnknown(data['leadership']!, _leadershipMeta),
      );
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('humor')) {
      context.handle(
        _humorMeta,
        humor.isAcceptableOrUnknown(data['humor']!, _humorMeta),
      );
    }
    if (data.containsKey('creativity')) {
      context.handle(
        _creativityMeta,
        creativity.isAcceptableOrUnknown(data['creativity']!, _creativityMeta),
      );
    }
    if (data.containsKey('optimism')) {
      context.handle(
        _optimismMeta,
        optimism.isAcceptableOrUnknown(data['optimism']!, _optimismMeta),
      );
    }
    if (data.containsKey('discipline')) {
      context.handle(
        _disciplineMeta,
        discipline.isAcceptableOrUnknown(data['discipline']!, _disciplineMeta),
      );
    }
    if (data.containsKey('curiosity')) {
      context.handle(
        _curiosityMeta,
        curiosity.isAcceptableOrUnknown(data['curiosity']!, _curiosityMeta),
      );
    }
    if (data.containsKey('emotional')) {
      context.handle(
        _emotionalMeta,
        emotional.isAcceptableOrUnknown(data['emotional']!, _emotionalMeta),
      );
    }
    if (data.containsKey('speaking_style')) {
      context.handle(
        _speakingStyleMeta,
        speakingStyle.isAcceptableOrUnknown(
          data['speaking_style']!,
          _speakingStyleMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonalityTraitsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonalityTraitsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      kindness: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kindness'],
      ),
      patience: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patience'],
      ),
      leadership: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}leadership'],
      ),
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      ),
      humor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}humor'],
      ),
      creativity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}creativity'],
      ),
      optimism: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}optimism'],
      ),
      discipline: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discipline'],
      ),
      curiosity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}curiosity'],
      ),
      emotional: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}emotional'],
      ),
      speakingStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}speaking_style'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PersonalityTraitsTableTable createAlias(String alias) {
    return $PersonalityTraitsTableTable(attachedDatabase, alias);
  }
}

class PersonalityTraitsTableData extends DataClass
    implements Insertable<PersonalityTraitsTableData> {
  final int id;
  final int humanId;
  final int? kindness;
  final int? patience;
  final int? leadership;
  final int? confidence;
  final int? humor;
  final int? creativity;
  final int? optimism;
  final int? discipline;
  final int? curiosity;
  final int? emotional;
  final String? speakingStyle;
  final DateTime createdAt;
  const PersonalityTraitsTableData({
    required this.id,
    required this.humanId,
    this.kindness,
    this.patience,
    this.leadership,
    this.confidence,
    this.humor,
    this.creativity,
    this.optimism,
    this.discipline,
    this.curiosity,
    this.emotional,
    this.speakingStyle,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || kindness != null) {
      map['kindness'] = Variable<int>(kindness);
    }
    if (!nullToAbsent || patience != null) {
      map['patience'] = Variable<int>(patience);
    }
    if (!nullToAbsent || leadership != null) {
      map['leadership'] = Variable<int>(leadership);
    }
    if (!nullToAbsent || confidence != null) {
      map['confidence'] = Variable<int>(confidence);
    }
    if (!nullToAbsent || humor != null) {
      map['humor'] = Variable<int>(humor);
    }
    if (!nullToAbsent || creativity != null) {
      map['creativity'] = Variable<int>(creativity);
    }
    if (!nullToAbsent || optimism != null) {
      map['optimism'] = Variable<int>(optimism);
    }
    if (!nullToAbsent || discipline != null) {
      map['discipline'] = Variable<int>(discipline);
    }
    if (!nullToAbsent || curiosity != null) {
      map['curiosity'] = Variable<int>(curiosity);
    }
    if (!nullToAbsent || emotional != null) {
      map['emotional'] = Variable<int>(emotional);
    }
    if (!nullToAbsent || speakingStyle != null) {
      map['speaking_style'] = Variable<String>(speakingStyle);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PersonalityTraitsTableCompanion toCompanion(bool nullToAbsent) {
    return PersonalityTraitsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      kindness: kindness == null && nullToAbsent
          ? const Value.absent()
          : Value(kindness),
      patience: patience == null && nullToAbsent
          ? const Value.absent()
          : Value(patience),
      leadership: leadership == null && nullToAbsent
          ? const Value.absent()
          : Value(leadership),
      confidence: confidence == null && nullToAbsent
          ? const Value.absent()
          : Value(confidence),
      humor: humor == null && nullToAbsent
          ? const Value.absent()
          : Value(humor),
      creativity: creativity == null && nullToAbsent
          ? const Value.absent()
          : Value(creativity),
      optimism: optimism == null && nullToAbsent
          ? const Value.absent()
          : Value(optimism),
      discipline: discipline == null && nullToAbsent
          ? const Value.absent()
          : Value(discipline),
      curiosity: curiosity == null && nullToAbsent
          ? const Value.absent()
          : Value(curiosity),
      emotional: emotional == null && nullToAbsent
          ? const Value.absent()
          : Value(emotional),
      speakingStyle: speakingStyle == null && nullToAbsent
          ? const Value.absent()
          : Value(speakingStyle),
      createdAt: Value(createdAt),
    );
  }

  factory PersonalityTraitsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonalityTraitsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      kindness: serializer.fromJson<int?>(json['kindness']),
      patience: serializer.fromJson<int?>(json['patience']),
      leadership: serializer.fromJson<int?>(json['leadership']),
      confidence: serializer.fromJson<int?>(json['confidence']),
      humor: serializer.fromJson<int?>(json['humor']),
      creativity: serializer.fromJson<int?>(json['creativity']),
      optimism: serializer.fromJson<int?>(json['optimism']),
      discipline: serializer.fromJson<int?>(json['discipline']),
      curiosity: serializer.fromJson<int?>(json['curiosity']),
      emotional: serializer.fromJson<int?>(json['emotional']),
      speakingStyle: serializer.fromJson<String?>(json['speakingStyle']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'kindness': serializer.toJson<int?>(kindness),
      'patience': serializer.toJson<int?>(patience),
      'leadership': serializer.toJson<int?>(leadership),
      'confidence': serializer.toJson<int?>(confidence),
      'humor': serializer.toJson<int?>(humor),
      'creativity': serializer.toJson<int?>(creativity),
      'optimism': serializer.toJson<int?>(optimism),
      'discipline': serializer.toJson<int?>(discipline),
      'curiosity': serializer.toJson<int?>(curiosity),
      'emotional': serializer.toJson<int?>(emotional),
      'speakingStyle': serializer.toJson<String?>(speakingStyle),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PersonalityTraitsTableData copyWith({
    int? id,
    int? humanId,
    Value<int?> kindness = const Value.absent(),
    Value<int?> patience = const Value.absent(),
    Value<int?> leadership = const Value.absent(),
    Value<int?> confidence = const Value.absent(),
    Value<int?> humor = const Value.absent(),
    Value<int?> creativity = const Value.absent(),
    Value<int?> optimism = const Value.absent(),
    Value<int?> discipline = const Value.absent(),
    Value<int?> curiosity = const Value.absent(),
    Value<int?> emotional = const Value.absent(),
    Value<String?> speakingStyle = const Value.absent(),
    DateTime? createdAt,
  }) => PersonalityTraitsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    kindness: kindness.present ? kindness.value : this.kindness,
    patience: patience.present ? patience.value : this.patience,
    leadership: leadership.present ? leadership.value : this.leadership,
    confidence: confidence.present ? confidence.value : this.confidence,
    humor: humor.present ? humor.value : this.humor,
    creativity: creativity.present ? creativity.value : this.creativity,
    optimism: optimism.present ? optimism.value : this.optimism,
    discipline: discipline.present ? discipline.value : this.discipline,
    curiosity: curiosity.present ? curiosity.value : this.curiosity,
    emotional: emotional.present ? emotional.value : this.emotional,
    speakingStyle: speakingStyle.present
        ? speakingStyle.value
        : this.speakingStyle,
    createdAt: createdAt ?? this.createdAt,
  );
  PersonalityTraitsTableData copyWithCompanion(
    PersonalityTraitsTableCompanion data,
  ) {
    return PersonalityTraitsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      kindness: data.kindness.present ? data.kindness.value : this.kindness,
      patience: data.patience.present ? data.patience.value : this.patience,
      leadership: data.leadership.present
          ? data.leadership.value
          : this.leadership,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      humor: data.humor.present ? data.humor.value : this.humor,
      creativity: data.creativity.present
          ? data.creativity.value
          : this.creativity,
      optimism: data.optimism.present ? data.optimism.value : this.optimism,
      discipline: data.discipline.present
          ? data.discipline.value
          : this.discipline,
      curiosity: data.curiosity.present ? data.curiosity.value : this.curiosity,
      emotional: data.emotional.present ? data.emotional.value : this.emotional,
      speakingStyle: data.speakingStyle.present
          ? data.speakingStyle.value
          : this.speakingStyle,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonalityTraitsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('kindness: $kindness, ')
          ..write('patience: $patience, ')
          ..write('leadership: $leadership, ')
          ..write('confidence: $confidence, ')
          ..write('humor: $humor, ')
          ..write('creativity: $creativity, ')
          ..write('optimism: $optimism, ')
          ..write('discipline: $discipline, ')
          ..write('curiosity: $curiosity, ')
          ..write('emotional: $emotional, ')
          ..write('speakingStyle: $speakingStyle, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    kindness,
    patience,
    leadership,
    confidence,
    humor,
    creativity,
    optimism,
    discipline,
    curiosity,
    emotional,
    speakingStyle,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonalityTraitsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.kindness == this.kindness &&
          other.patience == this.patience &&
          other.leadership == this.leadership &&
          other.confidence == this.confidence &&
          other.humor == this.humor &&
          other.creativity == this.creativity &&
          other.optimism == this.optimism &&
          other.discipline == this.discipline &&
          other.curiosity == this.curiosity &&
          other.emotional == this.emotional &&
          other.speakingStyle == this.speakingStyle &&
          other.createdAt == this.createdAt);
}

class PersonalityTraitsTableCompanion
    extends UpdateCompanion<PersonalityTraitsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<int?> kindness;
  final Value<int?> patience;
  final Value<int?> leadership;
  final Value<int?> confidence;
  final Value<int?> humor;
  final Value<int?> creativity;
  final Value<int?> optimism;
  final Value<int?> discipline;
  final Value<int?> curiosity;
  final Value<int?> emotional;
  final Value<String?> speakingStyle;
  final Value<DateTime> createdAt;
  const PersonalityTraitsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.kindness = const Value.absent(),
    this.patience = const Value.absent(),
    this.leadership = const Value.absent(),
    this.confidence = const Value.absent(),
    this.humor = const Value.absent(),
    this.creativity = const Value.absent(),
    this.optimism = const Value.absent(),
    this.discipline = const Value.absent(),
    this.curiosity = const Value.absent(),
    this.emotional = const Value.absent(),
    this.speakingStyle = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PersonalityTraitsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.kindness = const Value.absent(),
    this.patience = const Value.absent(),
    this.leadership = const Value.absent(),
    this.confidence = const Value.absent(),
    this.humor = const Value.absent(),
    this.creativity = const Value.absent(),
    this.optimism = const Value.absent(),
    this.discipline = const Value.absent(),
    this.curiosity = const Value.absent(),
    this.emotional = const Value.absent(),
    this.speakingStyle = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<PersonalityTraitsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<int>? kindness,
    Expression<int>? patience,
    Expression<int>? leadership,
    Expression<int>? confidence,
    Expression<int>? humor,
    Expression<int>? creativity,
    Expression<int>? optimism,
    Expression<int>? discipline,
    Expression<int>? curiosity,
    Expression<int>? emotional,
    Expression<String>? speakingStyle,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (kindness != null) 'kindness': kindness,
      if (patience != null) 'patience': patience,
      if (leadership != null) 'leadership': leadership,
      if (confidence != null) 'confidence': confidence,
      if (humor != null) 'humor': humor,
      if (creativity != null) 'creativity': creativity,
      if (optimism != null) 'optimism': optimism,
      if (discipline != null) 'discipline': discipline,
      if (curiosity != null) 'curiosity': curiosity,
      if (emotional != null) 'emotional': emotional,
      if (speakingStyle != null) 'speaking_style': speakingStyle,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PersonalityTraitsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<int?>? kindness,
    Value<int?>? patience,
    Value<int?>? leadership,
    Value<int?>? confidence,
    Value<int?>? humor,
    Value<int?>? creativity,
    Value<int?>? optimism,
    Value<int?>? discipline,
    Value<int?>? curiosity,
    Value<int?>? emotional,
    Value<String?>? speakingStyle,
    Value<DateTime>? createdAt,
  }) {
    return PersonalityTraitsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      kindness: kindness ?? this.kindness,
      patience: patience ?? this.patience,
      leadership: leadership ?? this.leadership,
      confidence: confidence ?? this.confidence,
      humor: humor ?? this.humor,
      creativity: creativity ?? this.creativity,
      optimism: optimism ?? this.optimism,
      discipline: discipline ?? this.discipline,
      curiosity: curiosity ?? this.curiosity,
      emotional: emotional ?? this.emotional,
      speakingStyle: speakingStyle ?? this.speakingStyle,
      createdAt: createdAt ?? this.createdAt,
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
    if (kindness.present) {
      map['kindness'] = Variable<int>(kindness.value);
    }
    if (patience.present) {
      map['patience'] = Variable<int>(patience.value);
    }
    if (leadership.present) {
      map['leadership'] = Variable<int>(leadership.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (humor.present) {
      map['humor'] = Variable<int>(humor.value);
    }
    if (creativity.present) {
      map['creativity'] = Variable<int>(creativity.value);
    }
    if (optimism.present) {
      map['optimism'] = Variable<int>(optimism.value);
    }
    if (discipline.present) {
      map['discipline'] = Variable<int>(discipline.value);
    }
    if (curiosity.present) {
      map['curiosity'] = Variable<int>(curiosity.value);
    }
    if (emotional.present) {
      map['emotional'] = Variable<int>(emotional.value);
    }
    if (speakingStyle.present) {
      map['speaking_style'] = Variable<String>(speakingStyle.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalityTraitsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('kindness: $kindness, ')
          ..write('patience: $patience, ')
          ..write('leadership: $leadership, ')
          ..write('confidence: $confidence, ')
          ..write('humor: $humor, ')
          ..write('creativity: $creativity, ')
          ..write('optimism: $optimism, ')
          ..write('discipline: $discipline, ')
          ..write('curiosity: $curiosity, ')
          ..write('emotional: $emotional, ')
          ..write('speakingStyle: $speakingStyle, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ConversationStylesTableTable extends ConversationStylesTable
    with TableInfo<$ConversationStylesTableTable, ConversationStylesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationStylesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _toneMeta = const VerificationMeta('tone');
  @override
  late final GeneratedColumn<String> tone = GeneratedColumn<String>(
    'tone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storyTellerMeta = const VerificationMeta(
    'storyTeller',
  );
  @override
  late final GeneratedColumn<int> storyTeller = GeneratedColumn<int>(
    'story_teller',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teacherModeMeta = const VerificationMeta(
    'teacherMode',
  );
  @override
  late final GeneratedColumn<int> teacherMode = GeneratedColumn<int>(
    'teacher_mode',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motivationalMeta = const VerificationMeta(
    'motivational',
  );
  @override
  late final GeneratedColumn<int> motivational = GeneratedColumn<int>(
    'motivational',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _replyLengthMeta = const VerificationMeta(
    'replyLength',
  );
  @override
  late final GeneratedColumn<String> replyLength = GeneratedColumn<String>(
    'reply_length',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emojiUsageMeta = const VerificationMeta(
    'emojiUsage',
  );
  @override
  late final GeneratedColumn<String> emojiUsage = GeneratedColumn<String>(
    'emoji_usage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localLanguageMeta = const VerificationMeta(
    'localLanguage',
  );
  @override
  late final GeneratedColumn<String> localLanguage = GeneratedColumn<String>(
    'local_language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proverbsMeta = const VerificationMeta(
    'proverbs',
  );
  @override
  late final GeneratedColumn<String> proverbs = GeneratedColumn<String>(
    'proverbs',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quotesMeta = const VerificationMeta('quotes');
  @override
  late final GeneratedColumn<String> quotes = GeneratedColumn<String>(
    'quotes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _religiousExpressionsMeta =
      const VerificationMeta('religiousExpressions');
  @override
  late final GeneratedColumn<String> religiousExpressions =
      GeneratedColumn<String>(
        'religious_expressions',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _favoriteGreetingsMeta = const VerificationMeta(
    'favoriteGreetings',
  );
  @override
  late final GeneratedColumn<String> favoriteGreetings =
      GeneratedColumn<String>(
        'favorite_greetings',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _signatureClosingMeta = const VerificationMeta(
    'signatureClosing',
  );
  @override
  late final GeneratedColumn<String> signatureClosing = GeneratedColumn<String>(
    'signature_closing',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    tone,
    storyTeller,
    teacherMode,
    motivational,
    replyLength,
    emojiUsage,
    localLanguage,
    proverbs,
    quotes,
    religiousExpressions,
    favoriteGreetings,
    signatureClosing,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversation_styles';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConversationStylesTableData> instance, {
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
    if (data.containsKey('tone')) {
      context.handle(
        _toneMeta,
        tone.isAcceptableOrUnknown(data['tone']!, _toneMeta),
      );
    }
    if (data.containsKey('story_teller')) {
      context.handle(
        _storyTellerMeta,
        storyTeller.isAcceptableOrUnknown(
          data['story_teller']!,
          _storyTellerMeta,
        ),
      );
    }
    if (data.containsKey('teacher_mode')) {
      context.handle(
        _teacherModeMeta,
        teacherMode.isAcceptableOrUnknown(
          data['teacher_mode']!,
          _teacherModeMeta,
        ),
      );
    }
    if (data.containsKey('motivational')) {
      context.handle(
        _motivationalMeta,
        motivational.isAcceptableOrUnknown(
          data['motivational']!,
          _motivationalMeta,
        ),
      );
    }
    if (data.containsKey('reply_length')) {
      context.handle(
        _replyLengthMeta,
        replyLength.isAcceptableOrUnknown(
          data['reply_length']!,
          _replyLengthMeta,
        ),
      );
    }
    if (data.containsKey('emoji_usage')) {
      context.handle(
        _emojiUsageMeta,
        emojiUsage.isAcceptableOrUnknown(data['emoji_usage']!, _emojiUsageMeta),
      );
    }
    if (data.containsKey('local_language')) {
      context.handle(
        _localLanguageMeta,
        localLanguage.isAcceptableOrUnknown(
          data['local_language']!,
          _localLanguageMeta,
        ),
      );
    }
    if (data.containsKey('proverbs')) {
      context.handle(
        _proverbsMeta,
        proverbs.isAcceptableOrUnknown(data['proverbs']!, _proverbsMeta),
      );
    }
    if (data.containsKey('quotes')) {
      context.handle(
        _quotesMeta,
        quotes.isAcceptableOrUnknown(data['quotes']!, _quotesMeta),
      );
    }
    if (data.containsKey('religious_expressions')) {
      context.handle(
        _religiousExpressionsMeta,
        religiousExpressions.isAcceptableOrUnknown(
          data['religious_expressions']!,
          _religiousExpressionsMeta,
        ),
      );
    }
    if (data.containsKey('favorite_greetings')) {
      context.handle(
        _favoriteGreetingsMeta,
        favoriteGreetings.isAcceptableOrUnknown(
          data['favorite_greetings']!,
          _favoriteGreetingsMeta,
        ),
      );
    }
    if (data.containsKey('signature_closing')) {
      context.handle(
        _signatureClosingMeta,
        signatureClosing.isAcceptableOrUnknown(
          data['signature_closing']!,
          _signatureClosingMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConversationStylesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConversationStylesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      tone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tone'],
      ),
      storyTeller: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}story_teller'],
      ),
      teacherMode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_mode'],
      ),
      motivational: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}motivational'],
      ),
      replyLength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reply_length'],
      ),
      emojiUsage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji_usage'],
      ),
      localLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_language'],
      ),
      proverbs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}proverbs'],
      ),
      quotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quotes'],
      ),
      religiousExpressions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}religious_expressions'],
      ),
      favoriteGreetings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}favorite_greetings'],
      ),
      signatureClosing: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature_closing'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ConversationStylesTableTable createAlias(String alias) {
    return $ConversationStylesTableTable(attachedDatabase, alias);
  }
}

class ConversationStylesTableData extends DataClass
    implements Insertable<ConversationStylesTableData> {
  final int id;
  final int humanId;
  final String? tone;
  final int? storyTeller;
  final int? teacherMode;
  final int? motivational;
  final String? replyLength;
  final String? emojiUsage;
  final String? localLanguage;
  final String? proverbs;
  final String? quotes;
  final String? religiousExpressions;
  final String? favoriteGreetings;
  final String? signatureClosing;
  final DateTime createdAt;
  const ConversationStylesTableData({
    required this.id,
    required this.humanId,
    this.tone,
    this.storyTeller,
    this.teacherMode,
    this.motivational,
    this.replyLength,
    this.emojiUsage,
    this.localLanguage,
    this.proverbs,
    this.quotes,
    this.religiousExpressions,
    this.favoriteGreetings,
    this.signatureClosing,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || tone != null) {
      map['tone'] = Variable<String>(tone);
    }
    if (!nullToAbsent || storyTeller != null) {
      map['story_teller'] = Variable<int>(storyTeller);
    }
    if (!nullToAbsent || teacherMode != null) {
      map['teacher_mode'] = Variable<int>(teacherMode);
    }
    if (!nullToAbsent || motivational != null) {
      map['motivational'] = Variable<int>(motivational);
    }
    if (!nullToAbsent || replyLength != null) {
      map['reply_length'] = Variable<String>(replyLength);
    }
    if (!nullToAbsent || emojiUsage != null) {
      map['emoji_usage'] = Variable<String>(emojiUsage);
    }
    if (!nullToAbsent || localLanguage != null) {
      map['local_language'] = Variable<String>(localLanguage);
    }
    if (!nullToAbsent || proverbs != null) {
      map['proverbs'] = Variable<String>(proverbs);
    }
    if (!nullToAbsent || quotes != null) {
      map['quotes'] = Variable<String>(quotes);
    }
    if (!nullToAbsent || religiousExpressions != null) {
      map['religious_expressions'] = Variable<String>(religiousExpressions);
    }
    if (!nullToAbsent || favoriteGreetings != null) {
      map['favorite_greetings'] = Variable<String>(favoriteGreetings);
    }
    if (!nullToAbsent || signatureClosing != null) {
      map['signature_closing'] = Variable<String>(signatureClosing);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ConversationStylesTableCompanion toCompanion(bool nullToAbsent) {
    return ConversationStylesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      tone: tone == null && nullToAbsent ? const Value.absent() : Value(tone),
      storyTeller: storyTeller == null && nullToAbsent
          ? const Value.absent()
          : Value(storyTeller),
      teacherMode: teacherMode == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherMode),
      motivational: motivational == null && nullToAbsent
          ? const Value.absent()
          : Value(motivational),
      replyLength: replyLength == null && nullToAbsent
          ? const Value.absent()
          : Value(replyLength),
      emojiUsage: emojiUsage == null && nullToAbsent
          ? const Value.absent()
          : Value(emojiUsage),
      localLanguage: localLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(localLanguage),
      proverbs: proverbs == null && nullToAbsent
          ? const Value.absent()
          : Value(proverbs),
      quotes: quotes == null && nullToAbsent
          ? const Value.absent()
          : Value(quotes),
      religiousExpressions: religiousExpressions == null && nullToAbsent
          ? const Value.absent()
          : Value(religiousExpressions),
      favoriteGreetings: favoriteGreetings == null && nullToAbsent
          ? const Value.absent()
          : Value(favoriteGreetings),
      signatureClosing: signatureClosing == null && nullToAbsent
          ? const Value.absent()
          : Value(signatureClosing),
      createdAt: Value(createdAt),
    );
  }

  factory ConversationStylesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConversationStylesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      tone: serializer.fromJson<String?>(json['tone']),
      storyTeller: serializer.fromJson<int?>(json['storyTeller']),
      teacherMode: serializer.fromJson<int?>(json['teacherMode']),
      motivational: serializer.fromJson<int?>(json['motivational']),
      replyLength: serializer.fromJson<String?>(json['replyLength']),
      emojiUsage: serializer.fromJson<String?>(json['emojiUsage']),
      localLanguage: serializer.fromJson<String?>(json['localLanguage']),
      proverbs: serializer.fromJson<String?>(json['proverbs']),
      quotes: serializer.fromJson<String?>(json['quotes']),
      religiousExpressions: serializer.fromJson<String?>(
        json['religiousExpressions'],
      ),
      favoriteGreetings: serializer.fromJson<String?>(
        json['favoriteGreetings'],
      ),
      signatureClosing: serializer.fromJson<String?>(json['signatureClosing']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'tone': serializer.toJson<String?>(tone),
      'storyTeller': serializer.toJson<int?>(storyTeller),
      'teacherMode': serializer.toJson<int?>(teacherMode),
      'motivational': serializer.toJson<int?>(motivational),
      'replyLength': serializer.toJson<String?>(replyLength),
      'emojiUsage': serializer.toJson<String?>(emojiUsage),
      'localLanguage': serializer.toJson<String?>(localLanguage),
      'proverbs': serializer.toJson<String?>(proverbs),
      'quotes': serializer.toJson<String?>(quotes),
      'religiousExpressions': serializer.toJson<String?>(religiousExpressions),
      'favoriteGreetings': serializer.toJson<String?>(favoriteGreetings),
      'signatureClosing': serializer.toJson<String?>(signatureClosing),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ConversationStylesTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> tone = const Value.absent(),
    Value<int?> storyTeller = const Value.absent(),
    Value<int?> teacherMode = const Value.absent(),
    Value<int?> motivational = const Value.absent(),
    Value<String?> replyLength = const Value.absent(),
    Value<String?> emojiUsage = const Value.absent(),
    Value<String?> localLanguage = const Value.absent(),
    Value<String?> proverbs = const Value.absent(),
    Value<String?> quotes = const Value.absent(),
    Value<String?> religiousExpressions = const Value.absent(),
    Value<String?> favoriteGreetings = const Value.absent(),
    Value<String?> signatureClosing = const Value.absent(),
    DateTime? createdAt,
  }) => ConversationStylesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    tone: tone.present ? tone.value : this.tone,
    storyTeller: storyTeller.present ? storyTeller.value : this.storyTeller,
    teacherMode: teacherMode.present ? teacherMode.value : this.teacherMode,
    motivational: motivational.present ? motivational.value : this.motivational,
    replyLength: replyLength.present ? replyLength.value : this.replyLength,
    emojiUsage: emojiUsage.present ? emojiUsage.value : this.emojiUsage,
    localLanguage: localLanguage.present
        ? localLanguage.value
        : this.localLanguage,
    proverbs: proverbs.present ? proverbs.value : this.proverbs,
    quotes: quotes.present ? quotes.value : this.quotes,
    religiousExpressions: religiousExpressions.present
        ? religiousExpressions.value
        : this.religiousExpressions,
    favoriteGreetings: favoriteGreetings.present
        ? favoriteGreetings.value
        : this.favoriteGreetings,
    signatureClosing: signatureClosing.present
        ? signatureClosing.value
        : this.signatureClosing,
    createdAt: createdAt ?? this.createdAt,
  );
  ConversationStylesTableData copyWithCompanion(
    ConversationStylesTableCompanion data,
  ) {
    return ConversationStylesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      tone: data.tone.present ? data.tone.value : this.tone,
      storyTeller: data.storyTeller.present
          ? data.storyTeller.value
          : this.storyTeller,
      teacherMode: data.teacherMode.present
          ? data.teacherMode.value
          : this.teacherMode,
      motivational: data.motivational.present
          ? data.motivational.value
          : this.motivational,
      replyLength: data.replyLength.present
          ? data.replyLength.value
          : this.replyLength,
      emojiUsage: data.emojiUsage.present
          ? data.emojiUsage.value
          : this.emojiUsage,
      localLanguage: data.localLanguage.present
          ? data.localLanguage.value
          : this.localLanguage,
      proverbs: data.proverbs.present ? data.proverbs.value : this.proverbs,
      quotes: data.quotes.present ? data.quotes.value : this.quotes,
      religiousExpressions: data.religiousExpressions.present
          ? data.religiousExpressions.value
          : this.religiousExpressions,
      favoriteGreetings: data.favoriteGreetings.present
          ? data.favoriteGreetings.value
          : this.favoriteGreetings,
      signatureClosing: data.signatureClosing.present
          ? data.signatureClosing.value
          : this.signatureClosing,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConversationStylesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('tone: $tone, ')
          ..write('storyTeller: $storyTeller, ')
          ..write('teacherMode: $teacherMode, ')
          ..write('motivational: $motivational, ')
          ..write('replyLength: $replyLength, ')
          ..write('emojiUsage: $emojiUsage, ')
          ..write('localLanguage: $localLanguage, ')
          ..write('proverbs: $proverbs, ')
          ..write('quotes: $quotes, ')
          ..write('religiousExpressions: $religiousExpressions, ')
          ..write('favoriteGreetings: $favoriteGreetings, ')
          ..write('signatureClosing: $signatureClosing, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    tone,
    storyTeller,
    teacherMode,
    motivational,
    replyLength,
    emojiUsage,
    localLanguage,
    proverbs,
    quotes,
    religiousExpressions,
    favoriteGreetings,
    signatureClosing,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversationStylesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.tone == this.tone &&
          other.storyTeller == this.storyTeller &&
          other.teacherMode == this.teacherMode &&
          other.motivational == this.motivational &&
          other.replyLength == this.replyLength &&
          other.emojiUsage == this.emojiUsage &&
          other.localLanguage == this.localLanguage &&
          other.proverbs == this.proverbs &&
          other.quotes == this.quotes &&
          other.religiousExpressions == this.religiousExpressions &&
          other.favoriteGreetings == this.favoriteGreetings &&
          other.signatureClosing == this.signatureClosing &&
          other.createdAt == this.createdAt);
}

class ConversationStylesTableCompanion
    extends UpdateCompanion<ConversationStylesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> tone;
  final Value<int?> storyTeller;
  final Value<int?> teacherMode;
  final Value<int?> motivational;
  final Value<String?> replyLength;
  final Value<String?> emojiUsage;
  final Value<String?> localLanguage;
  final Value<String?> proverbs;
  final Value<String?> quotes;
  final Value<String?> religiousExpressions;
  final Value<String?> favoriteGreetings;
  final Value<String?> signatureClosing;
  final Value<DateTime> createdAt;
  const ConversationStylesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.tone = const Value.absent(),
    this.storyTeller = const Value.absent(),
    this.teacherMode = const Value.absent(),
    this.motivational = const Value.absent(),
    this.replyLength = const Value.absent(),
    this.emojiUsage = const Value.absent(),
    this.localLanguage = const Value.absent(),
    this.proverbs = const Value.absent(),
    this.quotes = const Value.absent(),
    this.religiousExpressions = const Value.absent(),
    this.favoriteGreetings = const Value.absent(),
    this.signatureClosing = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ConversationStylesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.tone = const Value.absent(),
    this.storyTeller = const Value.absent(),
    this.teacherMode = const Value.absent(),
    this.motivational = const Value.absent(),
    this.replyLength = const Value.absent(),
    this.emojiUsage = const Value.absent(),
    this.localLanguage = const Value.absent(),
    this.proverbs = const Value.absent(),
    this.quotes = const Value.absent(),
    this.religiousExpressions = const Value.absent(),
    this.favoriteGreetings = const Value.absent(),
    this.signatureClosing = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<ConversationStylesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? tone,
    Expression<int>? storyTeller,
    Expression<int>? teacherMode,
    Expression<int>? motivational,
    Expression<String>? replyLength,
    Expression<String>? emojiUsage,
    Expression<String>? localLanguage,
    Expression<String>? proverbs,
    Expression<String>? quotes,
    Expression<String>? religiousExpressions,
    Expression<String>? favoriteGreetings,
    Expression<String>? signatureClosing,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (tone != null) 'tone': tone,
      if (storyTeller != null) 'story_teller': storyTeller,
      if (teacherMode != null) 'teacher_mode': teacherMode,
      if (motivational != null) 'motivational': motivational,
      if (replyLength != null) 'reply_length': replyLength,
      if (emojiUsage != null) 'emoji_usage': emojiUsage,
      if (localLanguage != null) 'local_language': localLanguage,
      if (proverbs != null) 'proverbs': proverbs,
      if (quotes != null) 'quotes': quotes,
      if (religiousExpressions != null)
        'religious_expressions': religiousExpressions,
      if (favoriteGreetings != null) 'favorite_greetings': favoriteGreetings,
      if (signatureClosing != null) 'signature_closing': signatureClosing,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ConversationStylesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? tone,
    Value<int?>? storyTeller,
    Value<int?>? teacherMode,
    Value<int?>? motivational,
    Value<String?>? replyLength,
    Value<String?>? emojiUsage,
    Value<String?>? localLanguage,
    Value<String?>? proverbs,
    Value<String?>? quotes,
    Value<String?>? religiousExpressions,
    Value<String?>? favoriteGreetings,
    Value<String?>? signatureClosing,
    Value<DateTime>? createdAt,
  }) {
    return ConversationStylesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      tone: tone ?? this.tone,
      storyTeller: storyTeller ?? this.storyTeller,
      teacherMode: teacherMode ?? this.teacherMode,
      motivational: motivational ?? this.motivational,
      replyLength: replyLength ?? this.replyLength,
      emojiUsage: emojiUsage ?? this.emojiUsage,
      localLanguage: localLanguage ?? this.localLanguage,
      proverbs: proverbs ?? this.proverbs,
      quotes: quotes ?? this.quotes,
      religiousExpressions: religiousExpressions ?? this.religiousExpressions,
      favoriteGreetings: favoriteGreetings ?? this.favoriteGreetings,
      signatureClosing: signatureClosing ?? this.signatureClosing,
      createdAt: createdAt ?? this.createdAt,
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
    if (tone.present) {
      map['tone'] = Variable<String>(tone.value);
    }
    if (storyTeller.present) {
      map['story_teller'] = Variable<int>(storyTeller.value);
    }
    if (teacherMode.present) {
      map['teacher_mode'] = Variable<int>(teacherMode.value);
    }
    if (motivational.present) {
      map['motivational'] = Variable<int>(motivational.value);
    }
    if (replyLength.present) {
      map['reply_length'] = Variable<String>(replyLength.value);
    }
    if (emojiUsage.present) {
      map['emoji_usage'] = Variable<String>(emojiUsage.value);
    }
    if (localLanguage.present) {
      map['local_language'] = Variable<String>(localLanguage.value);
    }
    if (proverbs.present) {
      map['proverbs'] = Variable<String>(proverbs.value);
    }
    if (quotes.present) {
      map['quotes'] = Variable<String>(quotes.value);
    }
    if (religiousExpressions.present) {
      map['religious_expressions'] = Variable<String>(
        religiousExpressions.value,
      );
    }
    if (favoriteGreetings.present) {
      map['favorite_greetings'] = Variable<String>(favoriteGreetings.value);
    }
    if (signatureClosing.present) {
      map['signature_closing'] = Variable<String>(signatureClosing.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationStylesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('tone: $tone, ')
          ..write('storyTeller: $storyTeller, ')
          ..write('teacherMode: $teacherMode, ')
          ..write('motivational: $motivational, ')
          ..write('replyLength: $replyLength, ')
          ..write('emojiUsage: $emojiUsage, ')
          ..write('localLanguage: $localLanguage, ')
          ..write('proverbs: $proverbs, ')
          ..write('quotes: $quotes, ')
          ..write('religiousExpressions: $religiousExpressions, ')
          ..write('favoriteGreetings: $favoriteGreetings, ')
          ..write('signatureClosing: $signatureClosing, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DailyHabitsTableTable extends DailyHabitsTable
    with TableInfo<$DailyHabitsTableTable, DailyHabitsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyHabitsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _wakeTimeMeta = const VerificationMeta(
    'wakeTime',
  );
  @override
  late final GeneratedColumn<String> wakeTime = GeneratedColumn<String>(
    'wake_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleepTimeMeta = const VerificationMeta(
    'sleepTime',
  );
  @override
  late final GeneratedColumn<String> sleepTime = GeneratedColumn<String>(
    'sleep_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prayerMeta = const VerificationMeta('prayer');
  @override
  late final GeneratedColumn<String> prayer = GeneratedColumn<String>(
    'prayer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exerciseMeta = const VerificationMeta(
    'exercise',
  );
  @override
  late final GeneratedColumn<String> exercise = GeneratedColumn<String>(
    'exercise',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readingMeta = const VerificationMeta(
    'reading',
  );
  @override
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
    'reading',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codingMeta = const VerificationMeta('coding');
  @override
  late final GeneratedColumn<String> coding = GeneratedColumn<String>(
    'coding',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teaCoffeeMeta = const VerificationMeta(
    'teaCoffee',
  );
  @override
  late final GeneratedColumn<String> teaCoffee = GeneratedColumn<String>(
    'tea_coffee',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _smokingAlcoholMeta = const VerificationMeta(
    'smokingAlcohol',
  );
  @override
  late final GeneratedColumn<String> smokingAlcohol = GeneratedColumn<String>(
    'smoking_alcohol',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _meditationWalkingMeta = const VerificationMeta(
    'meditationWalking',
  );
  @override
  late final GeneratedColumn<String> meditationWalking =
      GeneratedColumn<String>(
        'meditation_walking',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _customHabitsMeta = const VerificationMeta(
    'customHabits',
  );
  @override
  late final GeneratedColumn<String> customHabits = GeneratedColumn<String>(
    'custom_habits',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    wakeTime,
    sleepTime,
    prayer,
    exercise,
    reading,
    coding,
    teaCoffee,
    smokingAlcohol,
    meditationWalking,
    customHabits,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_habits';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyHabitsTableData> instance, {
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
    if (data.containsKey('wake_time')) {
      context.handle(
        _wakeTimeMeta,
        wakeTime.isAcceptableOrUnknown(data['wake_time']!, _wakeTimeMeta),
      );
    }
    if (data.containsKey('sleep_time')) {
      context.handle(
        _sleepTimeMeta,
        sleepTime.isAcceptableOrUnknown(data['sleep_time']!, _sleepTimeMeta),
      );
    }
    if (data.containsKey('prayer')) {
      context.handle(
        _prayerMeta,
        prayer.isAcceptableOrUnknown(data['prayer']!, _prayerMeta),
      );
    }
    if (data.containsKey('exercise')) {
      context.handle(
        _exerciseMeta,
        exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta),
      );
    }
    if (data.containsKey('reading')) {
      context.handle(
        _readingMeta,
        reading.isAcceptableOrUnknown(data['reading']!, _readingMeta),
      );
    }
    if (data.containsKey('coding')) {
      context.handle(
        _codingMeta,
        coding.isAcceptableOrUnknown(data['coding']!, _codingMeta),
      );
    }
    if (data.containsKey('tea_coffee')) {
      context.handle(
        _teaCoffeeMeta,
        teaCoffee.isAcceptableOrUnknown(data['tea_coffee']!, _teaCoffeeMeta),
      );
    }
    if (data.containsKey('smoking_alcohol')) {
      context.handle(
        _smokingAlcoholMeta,
        smokingAlcohol.isAcceptableOrUnknown(
          data['smoking_alcohol']!,
          _smokingAlcoholMeta,
        ),
      );
    }
    if (data.containsKey('meditation_walking')) {
      context.handle(
        _meditationWalkingMeta,
        meditationWalking.isAcceptableOrUnknown(
          data['meditation_walking']!,
          _meditationWalkingMeta,
        ),
      );
    }
    if (data.containsKey('custom_habits')) {
      context.handle(
        _customHabitsMeta,
        customHabits.isAcceptableOrUnknown(
          data['custom_habits']!,
          _customHabitsMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyHabitsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyHabitsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      wakeTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wake_time'],
      ),
      sleepTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sleep_time'],
      ),
      prayer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prayer'],
      ),
      exercise: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise'],
      ),
      reading: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reading'],
      ),
      coding: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coding'],
      ),
      teaCoffee: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tea_coffee'],
      ),
      smokingAlcohol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smoking_alcohol'],
      ),
      meditationWalking: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meditation_walking'],
      ),
      customHabits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_habits'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DailyHabitsTableTable createAlias(String alias) {
    return $DailyHabitsTableTable(attachedDatabase, alias);
  }
}

class DailyHabitsTableData extends DataClass
    implements Insertable<DailyHabitsTableData> {
  final int id;
  final int humanId;
  final String? wakeTime;
  final String? sleepTime;
  final String? prayer;
  final String? exercise;
  final String? reading;
  final String? coding;
  final String? teaCoffee;
  final String? smokingAlcohol;
  final String? meditationWalking;
  final String? customHabits;
  final DateTime createdAt;
  const DailyHabitsTableData({
    required this.id,
    required this.humanId,
    this.wakeTime,
    this.sleepTime,
    this.prayer,
    this.exercise,
    this.reading,
    this.coding,
    this.teaCoffee,
    this.smokingAlcohol,
    this.meditationWalking,
    this.customHabits,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || wakeTime != null) {
      map['wake_time'] = Variable<String>(wakeTime);
    }
    if (!nullToAbsent || sleepTime != null) {
      map['sleep_time'] = Variable<String>(sleepTime);
    }
    if (!nullToAbsent || prayer != null) {
      map['prayer'] = Variable<String>(prayer);
    }
    if (!nullToAbsent || exercise != null) {
      map['exercise'] = Variable<String>(exercise);
    }
    if (!nullToAbsent || reading != null) {
      map['reading'] = Variable<String>(reading);
    }
    if (!nullToAbsent || coding != null) {
      map['coding'] = Variable<String>(coding);
    }
    if (!nullToAbsent || teaCoffee != null) {
      map['tea_coffee'] = Variable<String>(teaCoffee);
    }
    if (!nullToAbsent || smokingAlcohol != null) {
      map['smoking_alcohol'] = Variable<String>(smokingAlcohol);
    }
    if (!nullToAbsent || meditationWalking != null) {
      map['meditation_walking'] = Variable<String>(meditationWalking);
    }
    if (!nullToAbsent || customHabits != null) {
      map['custom_habits'] = Variable<String>(customHabits);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DailyHabitsTableCompanion toCompanion(bool nullToAbsent) {
    return DailyHabitsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      wakeTime: wakeTime == null && nullToAbsent
          ? const Value.absent()
          : Value(wakeTime),
      sleepTime: sleepTime == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepTime),
      prayer: prayer == null && nullToAbsent
          ? const Value.absent()
          : Value(prayer),
      exercise: exercise == null && nullToAbsent
          ? const Value.absent()
          : Value(exercise),
      reading: reading == null && nullToAbsent
          ? const Value.absent()
          : Value(reading),
      coding: coding == null && nullToAbsent
          ? const Value.absent()
          : Value(coding),
      teaCoffee: teaCoffee == null && nullToAbsent
          ? const Value.absent()
          : Value(teaCoffee),
      smokingAlcohol: smokingAlcohol == null && nullToAbsent
          ? const Value.absent()
          : Value(smokingAlcohol),
      meditationWalking: meditationWalking == null && nullToAbsent
          ? const Value.absent()
          : Value(meditationWalking),
      customHabits: customHabits == null && nullToAbsent
          ? const Value.absent()
          : Value(customHabits),
      createdAt: Value(createdAt),
    );
  }

  factory DailyHabitsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyHabitsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      wakeTime: serializer.fromJson<String?>(json['wakeTime']),
      sleepTime: serializer.fromJson<String?>(json['sleepTime']),
      prayer: serializer.fromJson<String?>(json['prayer']),
      exercise: serializer.fromJson<String?>(json['exercise']),
      reading: serializer.fromJson<String?>(json['reading']),
      coding: serializer.fromJson<String?>(json['coding']),
      teaCoffee: serializer.fromJson<String?>(json['teaCoffee']),
      smokingAlcohol: serializer.fromJson<String?>(json['smokingAlcohol']),
      meditationWalking: serializer.fromJson<String?>(
        json['meditationWalking'],
      ),
      customHabits: serializer.fromJson<String?>(json['customHabits']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'wakeTime': serializer.toJson<String?>(wakeTime),
      'sleepTime': serializer.toJson<String?>(sleepTime),
      'prayer': serializer.toJson<String?>(prayer),
      'exercise': serializer.toJson<String?>(exercise),
      'reading': serializer.toJson<String?>(reading),
      'coding': serializer.toJson<String?>(coding),
      'teaCoffee': serializer.toJson<String?>(teaCoffee),
      'smokingAlcohol': serializer.toJson<String?>(smokingAlcohol),
      'meditationWalking': serializer.toJson<String?>(meditationWalking),
      'customHabits': serializer.toJson<String?>(customHabits),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DailyHabitsTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> wakeTime = const Value.absent(),
    Value<String?> sleepTime = const Value.absent(),
    Value<String?> prayer = const Value.absent(),
    Value<String?> exercise = const Value.absent(),
    Value<String?> reading = const Value.absent(),
    Value<String?> coding = const Value.absent(),
    Value<String?> teaCoffee = const Value.absent(),
    Value<String?> smokingAlcohol = const Value.absent(),
    Value<String?> meditationWalking = const Value.absent(),
    Value<String?> customHabits = const Value.absent(),
    DateTime? createdAt,
  }) => DailyHabitsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    wakeTime: wakeTime.present ? wakeTime.value : this.wakeTime,
    sleepTime: sleepTime.present ? sleepTime.value : this.sleepTime,
    prayer: prayer.present ? prayer.value : this.prayer,
    exercise: exercise.present ? exercise.value : this.exercise,
    reading: reading.present ? reading.value : this.reading,
    coding: coding.present ? coding.value : this.coding,
    teaCoffee: teaCoffee.present ? teaCoffee.value : this.teaCoffee,
    smokingAlcohol: smokingAlcohol.present
        ? smokingAlcohol.value
        : this.smokingAlcohol,
    meditationWalking: meditationWalking.present
        ? meditationWalking.value
        : this.meditationWalking,
    customHabits: customHabits.present ? customHabits.value : this.customHabits,
    createdAt: createdAt ?? this.createdAt,
  );
  DailyHabitsTableData copyWithCompanion(DailyHabitsTableCompanion data) {
    return DailyHabitsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      wakeTime: data.wakeTime.present ? data.wakeTime.value : this.wakeTime,
      sleepTime: data.sleepTime.present ? data.sleepTime.value : this.sleepTime,
      prayer: data.prayer.present ? data.prayer.value : this.prayer,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      reading: data.reading.present ? data.reading.value : this.reading,
      coding: data.coding.present ? data.coding.value : this.coding,
      teaCoffee: data.teaCoffee.present ? data.teaCoffee.value : this.teaCoffee,
      smokingAlcohol: data.smokingAlcohol.present
          ? data.smokingAlcohol.value
          : this.smokingAlcohol,
      meditationWalking: data.meditationWalking.present
          ? data.meditationWalking.value
          : this.meditationWalking,
      customHabits: data.customHabits.present
          ? data.customHabits.value
          : this.customHabits,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyHabitsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('prayer: $prayer, ')
          ..write('exercise: $exercise, ')
          ..write('reading: $reading, ')
          ..write('coding: $coding, ')
          ..write('teaCoffee: $teaCoffee, ')
          ..write('smokingAlcohol: $smokingAlcohol, ')
          ..write('meditationWalking: $meditationWalking, ')
          ..write('customHabits: $customHabits, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    wakeTime,
    sleepTime,
    prayer,
    exercise,
    reading,
    coding,
    teaCoffee,
    smokingAlcohol,
    meditationWalking,
    customHabits,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyHabitsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.wakeTime == this.wakeTime &&
          other.sleepTime == this.sleepTime &&
          other.prayer == this.prayer &&
          other.exercise == this.exercise &&
          other.reading == this.reading &&
          other.coding == this.coding &&
          other.teaCoffee == this.teaCoffee &&
          other.smokingAlcohol == this.smokingAlcohol &&
          other.meditationWalking == this.meditationWalking &&
          other.customHabits == this.customHabits &&
          other.createdAt == this.createdAt);
}

class DailyHabitsTableCompanion extends UpdateCompanion<DailyHabitsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> wakeTime;
  final Value<String?> sleepTime;
  final Value<String?> prayer;
  final Value<String?> exercise;
  final Value<String?> reading;
  final Value<String?> coding;
  final Value<String?> teaCoffee;
  final Value<String?> smokingAlcohol;
  final Value<String?> meditationWalking;
  final Value<String?> customHabits;
  final Value<DateTime> createdAt;
  const DailyHabitsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.prayer = const Value.absent(),
    this.exercise = const Value.absent(),
    this.reading = const Value.absent(),
    this.coding = const Value.absent(),
    this.teaCoffee = const Value.absent(),
    this.smokingAlcohol = const Value.absent(),
    this.meditationWalking = const Value.absent(),
    this.customHabits = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DailyHabitsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.wakeTime = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.prayer = const Value.absent(),
    this.exercise = const Value.absent(),
    this.reading = const Value.absent(),
    this.coding = const Value.absent(),
    this.teaCoffee = const Value.absent(),
    this.smokingAlcohol = const Value.absent(),
    this.meditationWalking = const Value.absent(),
    this.customHabits = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<DailyHabitsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? wakeTime,
    Expression<String>? sleepTime,
    Expression<String>? prayer,
    Expression<String>? exercise,
    Expression<String>? reading,
    Expression<String>? coding,
    Expression<String>? teaCoffee,
    Expression<String>? smokingAlcohol,
    Expression<String>? meditationWalking,
    Expression<String>? customHabits,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (wakeTime != null) 'wake_time': wakeTime,
      if (sleepTime != null) 'sleep_time': sleepTime,
      if (prayer != null) 'prayer': prayer,
      if (exercise != null) 'exercise': exercise,
      if (reading != null) 'reading': reading,
      if (coding != null) 'coding': coding,
      if (teaCoffee != null) 'tea_coffee': teaCoffee,
      if (smokingAlcohol != null) 'smoking_alcohol': smokingAlcohol,
      if (meditationWalking != null) 'meditation_walking': meditationWalking,
      if (customHabits != null) 'custom_habits': customHabits,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DailyHabitsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? wakeTime,
    Value<String?>? sleepTime,
    Value<String?>? prayer,
    Value<String?>? exercise,
    Value<String?>? reading,
    Value<String?>? coding,
    Value<String?>? teaCoffee,
    Value<String?>? smokingAlcohol,
    Value<String?>? meditationWalking,
    Value<String?>? customHabits,
    Value<DateTime>? createdAt,
  }) {
    return DailyHabitsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      wakeTime: wakeTime ?? this.wakeTime,
      sleepTime: sleepTime ?? this.sleepTime,
      prayer: prayer ?? this.prayer,
      exercise: exercise ?? this.exercise,
      reading: reading ?? this.reading,
      coding: coding ?? this.coding,
      teaCoffee: teaCoffee ?? this.teaCoffee,
      smokingAlcohol: smokingAlcohol ?? this.smokingAlcohol,
      meditationWalking: meditationWalking ?? this.meditationWalking,
      customHabits: customHabits ?? this.customHabits,
      createdAt: createdAt ?? this.createdAt,
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
    if (wakeTime.present) {
      map['wake_time'] = Variable<String>(wakeTime.value);
    }
    if (sleepTime.present) {
      map['sleep_time'] = Variable<String>(sleepTime.value);
    }
    if (prayer.present) {
      map['prayer'] = Variable<String>(prayer.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<String>(exercise.value);
    }
    if (reading.present) {
      map['reading'] = Variable<String>(reading.value);
    }
    if (coding.present) {
      map['coding'] = Variable<String>(coding.value);
    }
    if (teaCoffee.present) {
      map['tea_coffee'] = Variable<String>(teaCoffee.value);
    }
    if (smokingAlcohol.present) {
      map['smoking_alcohol'] = Variable<String>(smokingAlcohol.value);
    }
    if (meditationWalking.present) {
      map['meditation_walking'] = Variable<String>(meditationWalking.value);
    }
    if (customHabits.present) {
      map['custom_habits'] = Variable<String>(customHabits.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyHabitsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('prayer: $prayer, ')
          ..write('exercise: $exercise, ')
          ..write('reading: $reading, ')
          ..write('coding: $coding, ')
          ..write('teaCoffee: $teaCoffee, ')
          ..write('smokingAlcohol: $smokingAlcohol, ')
          ..write('meditationWalking: $meditationWalking, ')
          ..write('customHabits: $customHabits, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ValuesBeliefsTableTable extends ValuesBeliefsTable
    with TableInfo<$ValuesBeliefsTableTable, ValuesBeliefsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ValuesBeliefsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _coreValuesMeta = const VerificationMeta(
    'coreValues',
  );
  @override
  late final GeneratedColumn<String> coreValues = GeneratedColumn<String>(
    'core_values',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lifePrinciplesMeta = const VerificationMeta(
    'lifePrinciples',
  );
  @override
  late final GeneratedColumn<String> lifePrinciples = GeneratedColumn<String>(
    'life_principles',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ethicsMeta = const VerificationMeta('ethics');
  @override
  late final GeneratedColumn<String> ethics = GeneratedColumn<String>(
    'ethics',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thingsNeverDoMeta = const VerificationMeta(
    'thingsNeverDo',
  );
  @override
  late final GeneratedColumn<String> thingsNeverDo = GeneratedColumn<String>(
    'things_never_do',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thingsAlwaysDoMeta = const VerificationMeta(
    'thingsAlwaysDo',
  );
  @override
  late final GeneratedColumn<String> thingsAlwaysDo = GeneratedColumn<String>(
    'things_always_do',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _politicalPreferenceMeta =
      const VerificationMeta('politicalPreference');
  @override
  late final GeneratedColumn<String> politicalPreference =
      GeneratedColumn<String>(
        'political_preference',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    religion,
    coreValues,
    lifePrinciples,
    ethics,
    thingsNeverDo,
    thingsAlwaysDo,
    politicalPreference,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'values_beliefs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ValuesBeliefsTableData> instance, {
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
    if (data.containsKey('religion')) {
      context.handle(
        _religionMeta,
        religion.isAcceptableOrUnknown(data['religion']!, _religionMeta),
      );
    }
    if (data.containsKey('core_values')) {
      context.handle(
        _coreValuesMeta,
        coreValues.isAcceptableOrUnknown(data['core_values']!, _coreValuesMeta),
      );
    }
    if (data.containsKey('life_principles')) {
      context.handle(
        _lifePrinciplesMeta,
        lifePrinciples.isAcceptableOrUnknown(
          data['life_principles']!,
          _lifePrinciplesMeta,
        ),
      );
    }
    if (data.containsKey('ethics')) {
      context.handle(
        _ethicsMeta,
        ethics.isAcceptableOrUnknown(data['ethics']!, _ethicsMeta),
      );
    }
    if (data.containsKey('things_never_do')) {
      context.handle(
        _thingsNeverDoMeta,
        thingsNeverDo.isAcceptableOrUnknown(
          data['things_never_do']!,
          _thingsNeverDoMeta,
        ),
      );
    }
    if (data.containsKey('things_always_do')) {
      context.handle(
        _thingsAlwaysDoMeta,
        thingsAlwaysDo.isAcceptableOrUnknown(
          data['things_always_do']!,
          _thingsAlwaysDoMeta,
        ),
      );
    }
    if (data.containsKey('political_preference')) {
      context.handle(
        _politicalPreferenceMeta,
        politicalPreference.isAcceptableOrUnknown(
          data['political_preference']!,
          _politicalPreferenceMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ValuesBeliefsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ValuesBeliefsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      religion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}religion'],
      ),
      coreValues: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}core_values'],
      ),
      lifePrinciples: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_principles'],
      ),
      ethics: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ethics'],
      ),
      thingsNeverDo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}things_never_do'],
      ),
      thingsAlwaysDo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}things_always_do'],
      ),
      politicalPreference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}political_preference'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ValuesBeliefsTableTable createAlias(String alias) {
    return $ValuesBeliefsTableTable(attachedDatabase, alias);
  }
}

class ValuesBeliefsTableData extends DataClass
    implements Insertable<ValuesBeliefsTableData> {
  final int id;
  final int humanId;
  final String? religion;
  final String? coreValues;
  final String? lifePrinciples;
  final String? ethics;
  final String? thingsNeverDo;
  final String? thingsAlwaysDo;
  final String? politicalPreference;
  final DateTime createdAt;
  const ValuesBeliefsTableData({
    required this.id,
    required this.humanId,
    this.religion,
    this.coreValues,
    this.lifePrinciples,
    this.ethics,
    this.thingsNeverDo,
    this.thingsAlwaysDo,
    this.politicalPreference,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || religion != null) {
      map['religion'] = Variable<String>(religion);
    }
    if (!nullToAbsent || coreValues != null) {
      map['core_values'] = Variable<String>(coreValues);
    }
    if (!nullToAbsent || lifePrinciples != null) {
      map['life_principles'] = Variable<String>(lifePrinciples);
    }
    if (!nullToAbsent || ethics != null) {
      map['ethics'] = Variable<String>(ethics);
    }
    if (!nullToAbsent || thingsNeverDo != null) {
      map['things_never_do'] = Variable<String>(thingsNeverDo);
    }
    if (!nullToAbsent || thingsAlwaysDo != null) {
      map['things_always_do'] = Variable<String>(thingsAlwaysDo);
    }
    if (!nullToAbsent || politicalPreference != null) {
      map['political_preference'] = Variable<String>(politicalPreference);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ValuesBeliefsTableCompanion toCompanion(bool nullToAbsent) {
    return ValuesBeliefsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      religion: religion == null && nullToAbsent
          ? const Value.absent()
          : Value(religion),
      coreValues: coreValues == null && nullToAbsent
          ? const Value.absent()
          : Value(coreValues),
      lifePrinciples: lifePrinciples == null && nullToAbsent
          ? const Value.absent()
          : Value(lifePrinciples),
      ethics: ethics == null && nullToAbsent
          ? const Value.absent()
          : Value(ethics),
      thingsNeverDo: thingsNeverDo == null && nullToAbsent
          ? const Value.absent()
          : Value(thingsNeverDo),
      thingsAlwaysDo: thingsAlwaysDo == null && nullToAbsent
          ? const Value.absent()
          : Value(thingsAlwaysDo),
      politicalPreference: politicalPreference == null && nullToAbsent
          ? const Value.absent()
          : Value(politicalPreference),
      createdAt: Value(createdAt),
    );
  }

  factory ValuesBeliefsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ValuesBeliefsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      religion: serializer.fromJson<String?>(json['religion']),
      coreValues: serializer.fromJson<String?>(json['coreValues']),
      lifePrinciples: serializer.fromJson<String?>(json['lifePrinciples']),
      ethics: serializer.fromJson<String?>(json['ethics']),
      thingsNeverDo: serializer.fromJson<String?>(json['thingsNeverDo']),
      thingsAlwaysDo: serializer.fromJson<String?>(json['thingsAlwaysDo']),
      politicalPreference: serializer.fromJson<String?>(
        json['politicalPreference'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'religion': serializer.toJson<String?>(religion),
      'coreValues': serializer.toJson<String?>(coreValues),
      'lifePrinciples': serializer.toJson<String?>(lifePrinciples),
      'ethics': serializer.toJson<String?>(ethics),
      'thingsNeverDo': serializer.toJson<String?>(thingsNeverDo),
      'thingsAlwaysDo': serializer.toJson<String?>(thingsAlwaysDo),
      'politicalPreference': serializer.toJson<String?>(politicalPreference),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ValuesBeliefsTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> religion = const Value.absent(),
    Value<String?> coreValues = const Value.absent(),
    Value<String?> lifePrinciples = const Value.absent(),
    Value<String?> ethics = const Value.absent(),
    Value<String?> thingsNeverDo = const Value.absent(),
    Value<String?> thingsAlwaysDo = const Value.absent(),
    Value<String?> politicalPreference = const Value.absent(),
    DateTime? createdAt,
  }) => ValuesBeliefsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    religion: religion.present ? religion.value : this.religion,
    coreValues: coreValues.present ? coreValues.value : this.coreValues,
    lifePrinciples: lifePrinciples.present
        ? lifePrinciples.value
        : this.lifePrinciples,
    ethics: ethics.present ? ethics.value : this.ethics,
    thingsNeverDo: thingsNeverDo.present
        ? thingsNeverDo.value
        : this.thingsNeverDo,
    thingsAlwaysDo: thingsAlwaysDo.present
        ? thingsAlwaysDo.value
        : this.thingsAlwaysDo,
    politicalPreference: politicalPreference.present
        ? politicalPreference.value
        : this.politicalPreference,
    createdAt: createdAt ?? this.createdAt,
  );
  ValuesBeliefsTableData copyWithCompanion(ValuesBeliefsTableCompanion data) {
    return ValuesBeliefsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      religion: data.religion.present ? data.religion.value : this.religion,
      coreValues: data.coreValues.present
          ? data.coreValues.value
          : this.coreValues,
      lifePrinciples: data.lifePrinciples.present
          ? data.lifePrinciples.value
          : this.lifePrinciples,
      ethics: data.ethics.present ? data.ethics.value : this.ethics,
      thingsNeverDo: data.thingsNeverDo.present
          ? data.thingsNeverDo.value
          : this.thingsNeverDo,
      thingsAlwaysDo: data.thingsAlwaysDo.present
          ? data.thingsAlwaysDo.value
          : this.thingsAlwaysDo,
      politicalPreference: data.politicalPreference.present
          ? data.politicalPreference.value
          : this.politicalPreference,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ValuesBeliefsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('religion: $religion, ')
          ..write('coreValues: $coreValues, ')
          ..write('lifePrinciples: $lifePrinciples, ')
          ..write('ethics: $ethics, ')
          ..write('thingsNeverDo: $thingsNeverDo, ')
          ..write('thingsAlwaysDo: $thingsAlwaysDo, ')
          ..write('politicalPreference: $politicalPreference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    religion,
    coreValues,
    lifePrinciples,
    ethics,
    thingsNeverDo,
    thingsAlwaysDo,
    politicalPreference,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValuesBeliefsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.religion == this.religion &&
          other.coreValues == this.coreValues &&
          other.lifePrinciples == this.lifePrinciples &&
          other.ethics == this.ethics &&
          other.thingsNeverDo == this.thingsNeverDo &&
          other.thingsAlwaysDo == this.thingsAlwaysDo &&
          other.politicalPreference == this.politicalPreference &&
          other.createdAt == this.createdAt);
}

class ValuesBeliefsTableCompanion
    extends UpdateCompanion<ValuesBeliefsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> religion;
  final Value<String?> coreValues;
  final Value<String?> lifePrinciples;
  final Value<String?> ethics;
  final Value<String?> thingsNeverDo;
  final Value<String?> thingsAlwaysDo;
  final Value<String?> politicalPreference;
  final Value<DateTime> createdAt;
  const ValuesBeliefsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.religion = const Value.absent(),
    this.coreValues = const Value.absent(),
    this.lifePrinciples = const Value.absent(),
    this.ethics = const Value.absent(),
    this.thingsNeverDo = const Value.absent(),
    this.thingsAlwaysDo = const Value.absent(),
    this.politicalPreference = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ValuesBeliefsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.religion = const Value.absent(),
    this.coreValues = const Value.absent(),
    this.lifePrinciples = const Value.absent(),
    this.ethics = const Value.absent(),
    this.thingsNeverDo = const Value.absent(),
    this.thingsAlwaysDo = const Value.absent(),
    this.politicalPreference = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<ValuesBeliefsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? religion,
    Expression<String>? coreValues,
    Expression<String>? lifePrinciples,
    Expression<String>? ethics,
    Expression<String>? thingsNeverDo,
    Expression<String>? thingsAlwaysDo,
    Expression<String>? politicalPreference,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (religion != null) 'religion': religion,
      if (coreValues != null) 'core_values': coreValues,
      if (lifePrinciples != null) 'life_principles': lifePrinciples,
      if (ethics != null) 'ethics': ethics,
      if (thingsNeverDo != null) 'things_never_do': thingsNeverDo,
      if (thingsAlwaysDo != null) 'things_always_do': thingsAlwaysDo,
      if (politicalPreference != null)
        'political_preference': politicalPreference,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ValuesBeliefsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? religion,
    Value<String?>? coreValues,
    Value<String?>? lifePrinciples,
    Value<String?>? ethics,
    Value<String?>? thingsNeverDo,
    Value<String?>? thingsAlwaysDo,
    Value<String?>? politicalPreference,
    Value<DateTime>? createdAt,
  }) {
    return ValuesBeliefsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      religion: religion ?? this.religion,
      coreValues: coreValues ?? this.coreValues,
      lifePrinciples: lifePrinciples ?? this.lifePrinciples,
      ethics: ethics ?? this.ethics,
      thingsNeverDo: thingsNeverDo ?? this.thingsNeverDo,
      thingsAlwaysDo: thingsAlwaysDo ?? this.thingsAlwaysDo,
      politicalPreference: politicalPreference ?? this.politicalPreference,
      createdAt: createdAt ?? this.createdAt,
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
    if (religion.present) {
      map['religion'] = Variable<String>(religion.value);
    }
    if (coreValues.present) {
      map['core_values'] = Variable<String>(coreValues.value);
    }
    if (lifePrinciples.present) {
      map['life_principles'] = Variable<String>(lifePrinciples.value);
    }
    if (ethics.present) {
      map['ethics'] = Variable<String>(ethics.value);
    }
    if (thingsNeverDo.present) {
      map['things_never_do'] = Variable<String>(thingsNeverDo.value);
    }
    if (thingsAlwaysDo.present) {
      map['things_always_do'] = Variable<String>(thingsAlwaysDo.value);
    }
    if (politicalPreference.present) {
      map['political_preference'] = Variable<String>(politicalPreference.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ValuesBeliefsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('religion: $religion, ')
          ..write('coreValues: $coreValues, ')
          ..write('lifePrinciples: $lifePrinciples, ')
          ..write('ethics: $ethics, ')
          ..write('thingsNeverDo: $thingsNeverDo, ')
          ..write('thingsAlwaysDo: $thingsAlwaysDo, ')
          ..write('politicalPreference: $politicalPreference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DecisionProfilesTableTable extends DecisionProfilesTable
    with TableInfo<$DecisionProfilesTableTable, DecisionProfilesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionProfilesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _logicLevelMeta = const VerificationMeta(
    'logicLevel',
  );
  @override
  late final GeneratedColumn<int> logicLevel = GeneratedColumn<int>(
    'logic_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionLevelMeta = const VerificationMeta(
    'emotionLevel',
  );
  @override
  late final GeneratedColumn<int> emotionLevel = GeneratedColumn<int>(
    'emotion_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _faithLevelMeta = const VerificationMeta(
    'faithLevel',
  );
  @override
  late final GeneratedColumn<int> faithLevel = GeneratedColumn<int>(
    'faith_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _researchLevelMeta = const VerificationMeta(
    'researchLevel',
  );
  @override
  late final GeneratedColumn<int> researchLevel = GeneratedColumn<int>(
    'research_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _experienceLevelMeta = const VerificationMeta(
    'experienceLevel',
  );
  @override
  late final GeneratedColumn<int> experienceLevel = GeneratedColumn<int>(
    'experience_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _friendsInfluenceMeta = const VerificationMeta(
    'friendsInfluence',
  );
  @override
  late final GeneratedColumn<int> friendsInfluence = GeneratedColumn<int>(
    'friends_influence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _familyInfluenceMeta = const VerificationMeta(
    'familyInfluence',
  );
  @override
  late final GeneratedColumn<int> familyInfluence = GeneratedColumn<int>(
    'family_influence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _riskLevelMeta = const VerificationMeta(
    'riskLevel',
  );
  @override
  late final GeneratedColumn<String> riskLevel = GeneratedColumn<String>(
    'risk_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _financialStyleMeta = const VerificationMeta(
    'financialStyle',
  );
  @override
  late final GeneratedColumn<String> financialStyle = GeneratedColumn<String>(
    'financial_style',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _leadershipStyleMeta = const VerificationMeta(
    'leadershipStyle',
  );
  @override
  late final GeneratedColumn<String> leadershipStyle = GeneratedColumn<String>(
    'leadership_style',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conflictHandlingMeta = const VerificationMeta(
    'conflictHandling',
  );
  @override
  late final GeneratedColumn<String> conflictHandling = GeneratedColumn<String>(
    'conflict_handling',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    logicLevel,
    emotionLevel,
    faithLevel,
    researchLevel,
    experienceLevel,
    friendsInfluence,
    familyInfluence,
    riskLevel,
    financialStyle,
    leadershipStyle,
    conflictHandling,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decision_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecisionProfilesTableData> instance, {
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
    if (data.containsKey('logic_level')) {
      context.handle(
        _logicLevelMeta,
        logicLevel.isAcceptableOrUnknown(data['logic_level']!, _logicLevelMeta),
      );
    }
    if (data.containsKey('emotion_level')) {
      context.handle(
        _emotionLevelMeta,
        emotionLevel.isAcceptableOrUnknown(
          data['emotion_level']!,
          _emotionLevelMeta,
        ),
      );
    }
    if (data.containsKey('faith_level')) {
      context.handle(
        _faithLevelMeta,
        faithLevel.isAcceptableOrUnknown(data['faith_level']!, _faithLevelMeta),
      );
    }
    if (data.containsKey('research_level')) {
      context.handle(
        _researchLevelMeta,
        researchLevel.isAcceptableOrUnknown(
          data['research_level']!,
          _researchLevelMeta,
        ),
      );
    }
    if (data.containsKey('experience_level')) {
      context.handle(
        _experienceLevelMeta,
        experienceLevel.isAcceptableOrUnknown(
          data['experience_level']!,
          _experienceLevelMeta,
        ),
      );
    }
    if (data.containsKey('friends_influence')) {
      context.handle(
        _friendsInfluenceMeta,
        friendsInfluence.isAcceptableOrUnknown(
          data['friends_influence']!,
          _friendsInfluenceMeta,
        ),
      );
    }
    if (data.containsKey('family_influence')) {
      context.handle(
        _familyInfluenceMeta,
        familyInfluence.isAcceptableOrUnknown(
          data['family_influence']!,
          _familyInfluenceMeta,
        ),
      );
    }
    if (data.containsKey('risk_level')) {
      context.handle(
        _riskLevelMeta,
        riskLevel.isAcceptableOrUnknown(data['risk_level']!, _riskLevelMeta),
      );
    }
    if (data.containsKey('financial_style')) {
      context.handle(
        _financialStyleMeta,
        financialStyle.isAcceptableOrUnknown(
          data['financial_style']!,
          _financialStyleMeta,
        ),
      );
    }
    if (data.containsKey('leadership_style')) {
      context.handle(
        _leadershipStyleMeta,
        leadershipStyle.isAcceptableOrUnknown(
          data['leadership_style']!,
          _leadershipStyleMeta,
        ),
      );
    }
    if (data.containsKey('conflict_handling')) {
      context.handle(
        _conflictHandlingMeta,
        conflictHandling.isAcceptableOrUnknown(
          data['conflict_handling']!,
          _conflictHandlingMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecisionProfilesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecisionProfilesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      logicLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}logic_level'],
      ),
      emotionLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}emotion_level'],
      ),
      faithLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}faith_level'],
      ),
      researchLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}research_level'],
      ),
      experienceLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}experience_level'],
      ),
      friendsInfluence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}friends_influence'],
      ),
      familyInfluence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}family_influence'],
      ),
      riskLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}risk_level'],
      ),
      financialStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}financial_style'],
      ),
      leadershipStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}leadership_style'],
      ),
      conflictHandling: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_handling'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DecisionProfilesTableTable createAlias(String alias) {
    return $DecisionProfilesTableTable(attachedDatabase, alias);
  }
}

class DecisionProfilesTableData extends DataClass
    implements Insertable<DecisionProfilesTableData> {
  final int id;
  final int humanId;
  final int? logicLevel;
  final int? emotionLevel;
  final int? faithLevel;
  final int? researchLevel;
  final int? experienceLevel;
  final int? friendsInfluence;
  final int? familyInfluence;
  final String? riskLevel;
  final String? financialStyle;
  final String? leadershipStyle;
  final String? conflictHandling;
  final DateTime createdAt;
  const DecisionProfilesTableData({
    required this.id,
    required this.humanId,
    this.logicLevel,
    this.emotionLevel,
    this.faithLevel,
    this.researchLevel,
    this.experienceLevel,
    this.friendsInfluence,
    this.familyInfluence,
    this.riskLevel,
    this.financialStyle,
    this.leadershipStyle,
    this.conflictHandling,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || logicLevel != null) {
      map['logic_level'] = Variable<int>(logicLevel);
    }
    if (!nullToAbsent || emotionLevel != null) {
      map['emotion_level'] = Variable<int>(emotionLevel);
    }
    if (!nullToAbsent || faithLevel != null) {
      map['faith_level'] = Variable<int>(faithLevel);
    }
    if (!nullToAbsent || researchLevel != null) {
      map['research_level'] = Variable<int>(researchLevel);
    }
    if (!nullToAbsent || experienceLevel != null) {
      map['experience_level'] = Variable<int>(experienceLevel);
    }
    if (!nullToAbsent || friendsInfluence != null) {
      map['friends_influence'] = Variable<int>(friendsInfluence);
    }
    if (!nullToAbsent || familyInfluence != null) {
      map['family_influence'] = Variable<int>(familyInfluence);
    }
    if (!nullToAbsent || riskLevel != null) {
      map['risk_level'] = Variable<String>(riskLevel);
    }
    if (!nullToAbsent || financialStyle != null) {
      map['financial_style'] = Variable<String>(financialStyle);
    }
    if (!nullToAbsent || leadershipStyle != null) {
      map['leadership_style'] = Variable<String>(leadershipStyle);
    }
    if (!nullToAbsent || conflictHandling != null) {
      map['conflict_handling'] = Variable<String>(conflictHandling);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DecisionProfilesTableCompanion toCompanion(bool nullToAbsent) {
    return DecisionProfilesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      logicLevel: logicLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(logicLevel),
      emotionLevel: emotionLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(emotionLevel),
      faithLevel: faithLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(faithLevel),
      researchLevel: researchLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(researchLevel),
      experienceLevel: experienceLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(experienceLevel),
      friendsInfluence: friendsInfluence == null && nullToAbsent
          ? const Value.absent()
          : Value(friendsInfluence),
      familyInfluence: familyInfluence == null && nullToAbsent
          ? const Value.absent()
          : Value(familyInfluence),
      riskLevel: riskLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(riskLevel),
      financialStyle: financialStyle == null && nullToAbsent
          ? const Value.absent()
          : Value(financialStyle),
      leadershipStyle: leadershipStyle == null && nullToAbsent
          ? const Value.absent()
          : Value(leadershipStyle),
      conflictHandling: conflictHandling == null && nullToAbsent
          ? const Value.absent()
          : Value(conflictHandling),
      createdAt: Value(createdAt),
    );
  }

  factory DecisionProfilesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecisionProfilesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      logicLevel: serializer.fromJson<int?>(json['logicLevel']),
      emotionLevel: serializer.fromJson<int?>(json['emotionLevel']),
      faithLevel: serializer.fromJson<int?>(json['faithLevel']),
      researchLevel: serializer.fromJson<int?>(json['researchLevel']),
      experienceLevel: serializer.fromJson<int?>(json['experienceLevel']),
      friendsInfluence: serializer.fromJson<int?>(json['friendsInfluence']),
      familyInfluence: serializer.fromJson<int?>(json['familyInfluence']),
      riskLevel: serializer.fromJson<String?>(json['riskLevel']),
      financialStyle: serializer.fromJson<String?>(json['financialStyle']),
      leadershipStyle: serializer.fromJson<String?>(json['leadershipStyle']),
      conflictHandling: serializer.fromJson<String?>(json['conflictHandling']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'logicLevel': serializer.toJson<int?>(logicLevel),
      'emotionLevel': serializer.toJson<int?>(emotionLevel),
      'faithLevel': serializer.toJson<int?>(faithLevel),
      'researchLevel': serializer.toJson<int?>(researchLevel),
      'experienceLevel': serializer.toJson<int?>(experienceLevel),
      'friendsInfluence': serializer.toJson<int?>(friendsInfluence),
      'familyInfluence': serializer.toJson<int?>(familyInfluence),
      'riskLevel': serializer.toJson<String?>(riskLevel),
      'financialStyle': serializer.toJson<String?>(financialStyle),
      'leadershipStyle': serializer.toJson<String?>(leadershipStyle),
      'conflictHandling': serializer.toJson<String?>(conflictHandling),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DecisionProfilesTableData copyWith({
    int? id,
    int? humanId,
    Value<int?> logicLevel = const Value.absent(),
    Value<int?> emotionLevel = const Value.absent(),
    Value<int?> faithLevel = const Value.absent(),
    Value<int?> researchLevel = const Value.absent(),
    Value<int?> experienceLevel = const Value.absent(),
    Value<int?> friendsInfluence = const Value.absent(),
    Value<int?> familyInfluence = const Value.absent(),
    Value<String?> riskLevel = const Value.absent(),
    Value<String?> financialStyle = const Value.absent(),
    Value<String?> leadershipStyle = const Value.absent(),
    Value<String?> conflictHandling = const Value.absent(),
    DateTime? createdAt,
  }) => DecisionProfilesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    logicLevel: logicLevel.present ? logicLevel.value : this.logicLevel,
    emotionLevel: emotionLevel.present ? emotionLevel.value : this.emotionLevel,
    faithLevel: faithLevel.present ? faithLevel.value : this.faithLevel,
    researchLevel: researchLevel.present
        ? researchLevel.value
        : this.researchLevel,
    experienceLevel: experienceLevel.present
        ? experienceLevel.value
        : this.experienceLevel,
    friendsInfluence: friendsInfluence.present
        ? friendsInfluence.value
        : this.friendsInfluence,
    familyInfluence: familyInfluence.present
        ? familyInfluence.value
        : this.familyInfluence,
    riskLevel: riskLevel.present ? riskLevel.value : this.riskLevel,
    financialStyle: financialStyle.present
        ? financialStyle.value
        : this.financialStyle,
    leadershipStyle: leadershipStyle.present
        ? leadershipStyle.value
        : this.leadershipStyle,
    conflictHandling: conflictHandling.present
        ? conflictHandling.value
        : this.conflictHandling,
    createdAt: createdAt ?? this.createdAt,
  );
  DecisionProfilesTableData copyWithCompanion(
    DecisionProfilesTableCompanion data,
  ) {
    return DecisionProfilesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      logicLevel: data.logicLevel.present
          ? data.logicLevel.value
          : this.logicLevel,
      emotionLevel: data.emotionLevel.present
          ? data.emotionLevel.value
          : this.emotionLevel,
      faithLevel: data.faithLevel.present
          ? data.faithLevel.value
          : this.faithLevel,
      researchLevel: data.researchLevel.present
          ? data.researchLevel.value
          : this.researchLevel,
      experienceLevel: data.experienceLevel.present
          ? data.experienceLevel.value
          : this.experienceLevel,
      friendsInfluence: data.friendsInfluence.present
          ? data.friendsInfluence.value
          : this.friendsInfluence,
      familyInfluence: data.familyInfluence.present
          ? data.familyInfluence.value
          : this.familyInfluence,
      riskLevel: data.riskLevel.present ? data.riskLevel.value : this.riskLevel,
      financialStyle: data.financialStyle.present
          ? data.financialStyle.value
          : this.financialStyle,
      leadershipStyle: data.leadershipStyle.present
          ? data.leadershipStyle.value
          : this.leadershipStyle,
      conflictHandling: data.conflictHandling.present
          ? data.conflictHandling.value
          : this.conflictHandling,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecisionProfilesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('logicLevel: $logicLevel, ')
          ..write('emotionLevel: $emotionLevel, ')
          ..write('faithLevel: $faithLevel, ')
          ..write('researchLevel: $researchLevel, ')
          ..write('experienceLevel: $experienceLevel, ')
          ..write('friendsInfluence: $friendsInfluence, ')
          ..write('familyInfluence: $familyInfluence, ')
          ..write('riskLevel: $riskLevel, ')
          ..write('financialStyle: $financialStyle, ')
          ..write('leadershipStyle: $leadershipStyle, ')
          ..write('conflictHandling: $conflictHandling, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    logicLevel,
    emotionLevel,
    faithLevel,
    researchLevel,
    experienceLevel,
    friendsInfluence,
    familyInfluence,
    riskLevel,
    financialStyle,
    leadershipStyle,
    conflictHandling,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecisionProfilesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.logicLevel == this.logicLevel &&
          other.emotionLevel == this.emotionLevel &&
          other.faithLevel == this.faithLevel &&
          other.researchLevel == this.researchLevel &&
          other.experienceLevel == this.experienceLevel &&
          other.friendsInfluence == this.friendsInfluence &&
          other.familyInfluence == this.familyInfluence &&
          other.riskLevel == this.riskLevel &&
          other.financialStyle == this.financialStyle &&
          other.leadershipStyle == this.leadershipStyle &&
          other.conflictHandling == this.conflictHandling &&
          other.createdAt == this.createdAt);
}

class DecisionProfilesTableCompanion
    extends UpdateCompanion<DecisionProfilesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<int?> logicLevel;
  final Value<int?> emotionLevel;
  final Value<int?> faithLevel;
  final Value<int?> researchLevel;
  final Value<int?> experienceLevel;
  final Value<int?> friendsInfluence;
  final Value<int?> familyInfluence;
  final Value<String?> riskLevel;
  final Value<String?> financialStyle;
  final Value<String?> leadershipStyle;
  final Value<String?> conflictHandling;
  final Value<DateTime> createdAt;
  const DecisionProfilesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.logicLevel = const Value.absent(),
    this.emotionLevel = const Value.absent(),
    this.faithLevel = const Value.absent(),
    this.researchLevel = const Value.absent(),
    this.experienceLevel = const Value.absent(),
    this.friendsInfluence = const Value.absent(),
    this.familyInfluence = const Value.absent(),
    this.riskLevel = const Value.absent(),
    this.financialStyle = const Value.absent(),
    this.leadershipStyle = const Value.absent(),
    this.conflictHandling = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DecisionProfilesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.logicLevel = const Value.absent(),
    this.emotionLevel = const Value.absent(),
    this.faithLevel = const Value.absent(),
    this.researchLevel = const Value.absent(),
    this.experienceLevel = const Value.absent(),
    this.friendsInfluence = const Value.absent(),
    this.familyInfluence = const Value.absent(),
    this.riskLevel = const Value.absent(),
    this.financialStyle = const Value.absent(),
    this.leadershipStyle = const Value.absent(),
    this.conflictHandling = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<DecisionProfilesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<int>? logicLevel,
    Expression<int>? emotionLevel,
    Expression<int>? faithLevel,
    Expression<int>? researchLevel,
    Expression<int>? experienceLevel,
    Expression<int>? friendsInfluence,
    Expression<int>? familyInfluence,
    Expression<String>? riskLevel,
    Expression<String>? financialStyle,
    Expression<String>? leadershipStyle,
    Expression<String>? conflictHandling,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (logicLevel != null) 'logic_level': logicLevel,
      if (emotionLevel != null) 'emotion_level': emotionLevel,
      if (faithLevel != null) 'faith_level': faithLevel,
      if (researchLevel != null) 'research_level': researchLevel,
      if (experienceLevel != null) 'experience_level': experienceLevel,
      if (friendsInfluence != null) 'friends_influence': friendsInfluence,
      if (familyInfluence != null) 'family_influence': familyInfluence,
      if (riskLevel != null) 'risk_level': riskLevel,
      if (financialStyle != null) 'financial_style': financialStyle,
      if (leadershipStyle != null) 'leadership_style': leadershipStyle,
      if (conflictHandling != null) 'conflict_handling': conflictHandling,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DecisionProfilesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<int?>? logicLevel,
    Value<int?>? emotionLevel,
    Value<int?>? faithLevel,
    Value<int?>? researchLevel,
    Value<int?>? experienceLevel,
    Value<int?>? friendsInfluence,
    Value<int?>? familyInfluence,
    Value<String?>? riskLevel,
    Value<String?>? financialStyle,
    Value<String?>? leadershipStyle,
    Value<String?>? conflictHandling,
    Value<DateTime>? createdAt,
  }) {
    return DecisionProfilesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      logicLevel: logicLevel ?? this.logicLevel,
      emotionLevel: emotionLevel ?? this.emotionLevel,
      faithLevel: faithLevel ?? this.faithLevel,
      researchLevel: researchLevel ?? this.researchLevel,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      friendsInfluence: friendsInfluence ?? this.friendsInfluence,
      familyInfluence: familyInfluence ?? this.familyInfluence,
      riskLevel: riskLevel ?? this.riskLevel,
      financialStyle: financialStyle ?? this.financialStyle,
      leadershipStyle: leadershipStyle ?? this.leadershipStyle,
      conflictHandling: conflictHandling ?? this.conflictHandling,
      createdAt: createdAt ?? this.createdAt,
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
    if (logicLevel.present) {
      map['logic_level'] = Variable<int>(logicLevel.value);
    }
    if (emotionLevel.present) {
      map['emotion_level'] = Variable<int>(emotionLevel.value);
    }
    if (faithLevel.present) {
      map['faith_level'] = Variable<int>(faithLevel.value);
    }
    if (researchLevel.present) {
      map['research_level'] = Variable<int>(researchLevel.value);
    }
    if (experienceLevel.present) {
      map['experience_level'] = Variable<int>(experienceLevel.value);
    }
    if (friendsInfluence.present) {
      map['friends_influence'] = Variable<int>(friendsInfluence.value);
    }
    if (familyInfluence.present) {
      map['family_influence'] = Variable<int>(familyInfluence.value);
    }
    if (riskLevel.present) {
      map['risk_level'] = Variable<String>(riskLevel.value);
    }
    if (financialStyle.present) {
      map['financial_style'] = Variable<String>(financialStyle.value);
    }
    if (leadershipStyle.present) {
      map['leadership_style'] = Variable<String>(leadershipStyle.value);
    }
    if (conflictHandling.present) {
      map['conflict_handling'] = Variable<String>(conflictHandling.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionProfilesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('logicLevel: $logicLevel, ')
          ..write('emotionLevel: $emotionLevel, ')
          ..write('faithLevel: $faithLevel, ')
          ..write('researchLevel: $researchLevel, ')
          ..write('experienceLevel: $experienceLevel, ')
          ..write('friendsInfluence: $friendsInfluence, ')
          ..write('familyInfluence: $familyInfluence, ')
          ..write('riskLevel: $riskLevel, ')
          ..write('financialStyle: $financialStyle, ')
          ..write('leadershipStyle: $leadershipStyle, ')
          ..write('conflictHandling: $conflictHandling, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LifeStoriesTableTable extends LifeStoriesTable
    with TableInfo<$LifeStoriesTableTable, LifeStoriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LifeStoriesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _sectionKeyMeta = const VerificationMeta(
    'sectionKey',
  );
  @override
  late final GeneratedColumn<String> sectionKey = GeneratedColumn<String>(
    'section_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionMeta = const VerificationMeta(
    'emotion',
  );
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
    'emotion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importanceMeta = const VerificationMeta(
    'importance',
  );
  @override
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
    'importance',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    sectionKey,
    title,
    content,
    tags,
    emotion,
    importance,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'life_stories';
  @override
  VerificationContext validateIntegrity(
    Insertable<LifeStoriesTableData> instance, {
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
    if (data.containsKey('section_key')) {
      context.handle(
        _sectionKeyMeta,
        sectionKey.isAcceptableOrUnknown(data['section_key']!, _sectionKeyMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('emotion')) {
      context.handle(
        _emotionMeta,
        emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta),
      );
    }
    if (data.containsKey('importance')) {
      context.handle(
        _importanceMeta,
        importance.isAcceptableOrUnknown(data['importance']!, _importanceMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LifeStoriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LifeStoriesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      sectionKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section_key'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      emotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion'],
      ),
      importance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}importance'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LifeStoriesTableTable createAlias(String alias) {
    return $LifeStoriesTableTable(attachedDatabase, alias);
  }
}

class LifeStoriesTableData extends DataClass
    implements Insertable<LifeStoriesTableData> {
  final int id;
  final int humanId;
  final String? sectionKey;
  final String? title;
  final String? content;
  final String? tags;
  final String? emotion;
  final int? importance;
  final DateTime createdAt;
  const LifeStoriesTableData({
    required this.id,
    required this.humanId,
    this.sectionKey,
    this.title,
    this.content,
    this.tags,
    this.emotion,
    this.importance,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || sectionKey != null) {
      map['section_key'] = Variable<String>(sectionKey);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || emotion != null) {
      map['emotion'] = Variable<String>(emotion);
    }
    if (!nullToAbsent || importance != null) {
      map['importance'] = Variable<int>(importance);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LifeStoriesTableCompanion toCompanion(bool nullToAbsent) {
    return LifeStoriesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      sectionKey: sectionKey == null && nullToAbsent
          ? const Value.absent()
          : Value(sectionKey),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      emotion: emotion == null && nullToAbsent
          ? const Value.absent()
          : Value(emotion),
      importance: importance == null && nullToAbsent
          ? const Value.absent()
          : Value(importance),
      createdAt: Value(createdAt),
    );
  }

  factory LifeStoriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LifeStoriesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      sectionKey: serializer.fromJson<String?>(json['sectionKey']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      tags: serializer.fromJson<String?>(json['tags']),
      emotion: serializer.fromJson<String?>(json['emotion']),
      importance: serializer.fromJson<int?>(json['importance']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'sectionKey': serializer.toJson<String?>(sectionKey),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<String?>(content),
      'tags': serializer.toJson<String?>(tags),
      'emotion': serializer.toJson<String?>(emotion),
      'importance': serializer.toJson<int?>(importance),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LifeStoriesTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> sectionKey = const Value.absent(),
    Value<String?> title = const Value.absent(),
    Value<String?> content = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    Value<String?> emotion = const Value.absent(),
    Value<int?> importance = const Value.absent(),
    DateTime? createdAt,
  }) => LifeStoriesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    sectionKey: sectionKey.present ? sectionKey.value : this.sectionKey,
    title: title.present ? title.value : this.title,
    content: content.present ? content.value : this.content,
    tags: tags.present ? tags.value : this.tags,
    emotion: emotion.present ? emotion.value : this.emotion,
    importance: importance.present ? importance.value : this.importance,
    createdAt: createdAt ?? this.createdAt,
  );
  LifeStoriesTableData copyWithCompanion(LifeStoriesTableCompanion data) {
    return LifeStoriesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      sectionKey: data.sectionKey.present
          ? data.sectionKey.value
          : this.sectionKey,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      tags: data.tags.present ? data.tags.value : this.tags,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      importance: data.importance.present
          ? data.importance.value
          : this.importance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LifeStoriesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('sectionKey: $sectionKey, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags, ')
          ..write('emotion: $emotion, ')
          ..write('importance: $importance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    sectionKey,
    title,
    content,
    tags,
    emotion,
    importance,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LifeStoriesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.sectionKey == this.sectionKey &&
          other.title == this.title &&
          other.content == this.content &&
          other.tags == this.tags &&
          other.emotion == this.emotion &&
          other.importance == this.importance &&
          other.createdAt == this.createdAt);
}

class LifeStoriesTableCompanion extends UpdateCompanion<LifeStoriesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> sectionKey;
  final Value<String?> title;
  final Value<String?> content;
  final Value<String?> tags;
  final Value<String?> emotion;
  final Value<int?> importance;
  final Value<DateTime> createdAt;
  const LifeStoriesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.sectionKey = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
    this.emotion = const Value.absent(),
    this.importance = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LifeStoriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.sectionKey = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
    this.emotion = const Value.absent(),
    this.importance = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<LifeStoriesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? sectionKey,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? tags,
    Expression<String>? emotion,
    Expression<int>? importance,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (sectionKey != null) 'section_key': sectionKey,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (tags != null) 'tags': tags,
      if (emotion != null) 'emotion': emotion,
      if (importance != null) 'importance': importance,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LifeStoriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? sectionKey,
    Value<String?>? title,
    Value<String?>? content,
    Value<String?>? tags,
    Value<String?>? emotion,
    Value<int?>? importance,
    Value<DateTime>? createdAt,
  }) {
    return LifeStoriesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      sectionKey: sectionKey ?? this.sectionKey,
      title: title ?? this.title,
      content: content ?? this.content,
      tags: tags ?? this.tags,
      emotion: emotion ?? this.emotion,
      importance: importance ?? this.importance,
      createdAt: createdAt ?? this.createdAt,
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
    if (sectionKey.present) {
      map['section_key'] = Variable<String>(sectionKey.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (importance.present) {
      map['importance'] = Variable<int>(importance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LifeStoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('sectionKey: $sectionKey, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags, ')
          ..write('emotion: $emotion, ')
          ..write('importance: $importance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TimelineTableTable extends TimelineTable
    with TableInfo<$TimelineTableTable, TimelineTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimelineTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _emotionMeta = const VerificationMeta(
    'emotion',
  );
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
    'emotion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importanceMeta = const VerificationMeta(
    'importance',
  );
  @override
  late final GeneratedColumn<String> importance = GeneratedColumn<String>(
    'importance',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    title,
    description,
    date,
    year,
    location,
    emotion,
    importance,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeline';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimelineTableData> instance, {
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
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
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('emotion')) {
      context.handle(
        _emotionMeta,
        emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta),
      );
    }
    if (data.containsKey('importance')) {
      context.handle(
        _importanceMeta,
        importance.isAcceptableOrUnknown(data['importance']!, _importanceMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimelineTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimelineTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      emotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion'],
      ),
      importance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}importance'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TimelineTableTable createAlias(String alias) {
    return $TimelineTableTable(attachedDatabase, alias);
  }
}

class TimelineTableData extends DataClass
    implements Insertable<TimelineTableData> {
  final int id;
  final int humanId;
  final String? title;
  final String? description;
  final String? date;
  final int? year;
  final String? location;
  final String? emotion;
  final String? importance;
  final DateTime createdAt;
  const TimelineTableData({
    required this.id,
    required this.humanId,
    this.title,
    this.description,
    this.date,
    this.year,
    this.location,
    this.emotion,
    this.importance,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || emotion != null) {
      map['emotion'] = Variable<String>(emotion);
    }
    if (!nullToAbsent || importance != null) {
      map['importance'] = Variable<String>(importance);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TimelineTableCompanion toCompanion(bool nullToAbsent) {
    return TimelineTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      emotion: emotion == null && nullToAbsent
          ? const Value.absent()
          : Value(emotion),
      importance: importance == null && nullToAbsent
          ? const Value.absent()
          : Value(importance),
      createdAt: Value(createdAt),
    );
  }

  factory TimelineTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimelineTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      date: serializer.fromJson<String?>(json['date']),
      year: serializer.fromJson<int?>(json['year']),
      location: serializer.fromJson<String?>(json['location']),
      emotion: serializer.fromJson<String?>(json['emotion']),
      importance: serializer.fromJson<String?>(json['importance']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'date': serializer.toJson<String?>(date),
      'year': serializer.toJson<int?>(year),
      'location': serializer.toJson<String?>(location),
      'emotion': serializer.toJson<String?>(emotion),
      'importance': serializer.toJson<String?>(importance),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TimelineTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> title = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> date = const Value.absent(),
    Value<int?> year = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> emotion = const Value.absent(),
    Value<String?> importance = const Value.absent(),
    DateTime? createdAt,
  }) => TimelineTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    title: title.present ? title.value : this.title,
    description: description.present ? description.value : this.description,
    date: date.present ? date.value : this.date,
    year: year.present ? year.value : this.year,
    location: location.present ? location.value : this.location,
    emotion: emotion.present ? emotion.value : this.emotion,
    importance: importance.present ? importance.value : this.importance,
    createdAt: createdAt ?? this.createdAt,
  );
  TimelineTableData copyWithCompanion(TimelineTableCompanion data) {
    return TimelineTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      date: data.date.present ? data.date.value : this.date,
      year: data.year.present ? data.year.value : this.year,
      location: data.location.present ? data.location.value : this.location,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      importance: data.importance.present
          ? data.importance.value
          : this.importance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimelineTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('year: $year, ')
          ..write('location: $location, ')
          ..write('emotion: $emotion, ')
          ..write('importance: $importance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    title,
    description,
    date,
    year,
    location,
    emotion,
    importance,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimelineTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.title == this.title &&
          other.description == this.description &&
          other.date == this.date &&
          other.year == this.year &&
          other.location == this.location &&
          other.emotion == this.emotion &&
          other.importance == this.importance &&
          other.createdAt == this.createdAt);
}

class TimelineTableCompanion extends UpdateCompanion<TimelineTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> date;
  final Value<int?> year;
  final Value<String?> location;
  final Value<String?> emotion;
  final Value<String?> importance;
  final Value<DateTime> createdAt;
  const TimelineTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.year = const Value.absent(),
    this.location = const Value.absent(),
    this.emotion = const Value.absent(),
    this.importance = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TimelineTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.year = const Value.absent(),
    this.location = const Value.absent(),
    this.emotion = const Value.absent(),
    this.importance = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<TimelineTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? date,
    Expression<int>? year,
    Expression<String>? location,
    Expression<String>? emotion,
    Expression<String>? importance,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (year != null) 'year': year,
      if (location != null) 'location': location,
      if (emotion != null) 'emotion': emotion,
      if (importance != null) 'importance': importance,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TimelineTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? title,
    Value<String?>? description,
    Value<String?>? date,
    Value<int?>? year,
    Value<String?>? location,
    Value<String?>? emotion,
    Value<String?>? importance,
    Value<DateTime>? createdAt,
  }) {
    return TimelineTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      year: year ?? this.year,
      location: location ?? this.location,
      emotion: emotion ?? this.emotion,
      importance: importance ?? this.importance,
      createdAt: createdAt ?? this.createdAt,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (importance.present) {
      map['importance'] = Variable<String>(importance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimelineTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('year: $year, ')
          ..write('location: $location, ')
          ..write('emotion: $emotion, ')
          ..write('importance: $importance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DailyJournalsTableTable extends DailyJournalsTable
    with TableInfo<$DailyJournalsTableTable, DailyJournalsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyJournalsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
    'mood',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weatherMeta = const VerificationMeta(
    'weather',
  );
  @override
  late final GeneratedColumn<String> weather = GeneratedColumn<String>(
    'weather',
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
  static const VerificationMeta _journalTextMeta = const VerificationMeta(
    'journalText',
  );
  @override
  late final GeneratedColumn<String> journalText = GeneratedColumn<String>(
    'journal_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voicePathMeta = const VerificationMeta(
    'voicePath',
  );
  @override
  late final GeneratedColumn<String> voicePath = GeneratedColumn<String>(
    'voice_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _favoriteMomentMeta = const VerificationMeta(
    'favoriteMoment',
  );
  @override
  late final GeneratedColumn<String> favoriteMoment = GeneratedColumn<String>(
    'favorite_moment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lessonsLearnedMeta = const VerificationMeta(
    'lessonsLearned',
  );
  @override
  late final GeneratedColumn<String> lessonsLearned = GeneratedColumn<String>(
    'lessons_learned',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    date,
    mood,
    weather,
    location,
    journalText,
    voicePath,
    tags,
    favoriteMoment,
    lessonsLearned,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_journals';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyJournalsTableData> instance, {
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
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('weather')) {
      context.handle(
        _weatherMeta,
        weather.isAcceptableOrUnknown(data['weather']!, _weatherMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('journal_text')) {
      context.handle(
        _journalTextMeta,
        journalText.isAcceptableOrUnknown(
          data['journal_text']!,
          _journalTextMeta,
        ),
      );
    }
    if (data.containsKey('voice_path')) {
      context.handle(
        _voicePathMeta,
        voicePath.isAcceptableOrUnknown(data['voice_path']!, _voicePathMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('favorite_moment')) {
      context.handle(
        _favoriteMomentMeta,
        favoriteMoment.isAcceptableOrUnknown(
          data['favorite_moment']!,
          _favoriteMomentMeta,
        ),
      );
    }
    if (data.containsKey('lessons_learned')) {
      context.handle(
        _lessonsLearnedMeta,
        lessonsLearned.isAcceptableOrUnknown(
          data['lessons_learned']!,
          _lessonsLearnedMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyJournalsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyJournalsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      ),
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood'],
      ),
      weather: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weather'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      journalText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}journal_text'],
      ),
      voicePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voice_path'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      favoriteMoment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}favorite_moment'],
      ),
      lessonsLearned: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lessons_learned'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DailyJournalsTableTable createAlias(String alias) {
    return $DailyJournalsTableTable(attachedDatabase, alias);
  }
}

class DailyJournalsTableData extends DataClass
    implements Insertable<DailyJournalsTableData> {
  final int id;
  final int humanId;
  final String? date;
  final String? mood;
  final String? weather;
  final String? location;
  final String? journalText;
  final String? voicePath;
  final String? tags;
  final String? favoriteMoment;
  final String? lessonsLearned;
  final DateTime createdAt;
  const DailyJournalsTableData({
    required this.id,
    required this.humanId,
    this.date,
    this.mood,
    this.weather,
    this.location,
    this.journalText,
    this.voicePath,
    this.tags,
    this.favoriteMoment,
    this.lessonsLearned,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<String>(mood);
    }
    if (!nullToAbsent || weather != null) {
      map['weather'] = Variable<String>(weather);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || journalText != null) {
      map['journal_text'] = Variable<String>(journalText);
    }
    if (!nullToAbsent || voicePath != null) {
      map['voice_path'] = Variable<String>(voicePath);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || favoriteMoment != null) {
      map['favorite_moment'] = Variable<String>(favoriteMoment);
    }
    if (!nullToAbsent || lessonsLearned != null) {
      map['lessons_learned'] = Variable<String>(lessonsLearned);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DailyJournalsTableCompanion toCompanion(bool nullToAbsent) {
    return DailyJournalsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      weather: weather == null && nullToAbsent
          ? const Value.absent()
          : Value(weather),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      journalText: journalText == null && nullToAbsent
          ? const Value.absent()
          : Value(journalText),
      voicePath: voicePath == null && nullToAbsent
          ? const Value.absent()
          : Value(voicePath),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      favoriteMoment: favoriteMoment == null && nullToAbsent
          ? const Value.absent()
          : Value(favoriteMoment),
      lessonsLearned: lessonsLearned == null && nullToAbsent
          ? const Value.absent()
          : Value(lessonsLearned),
      createdAt: Value(createdAt),
    );
  }

  factory DailyJournalsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyJournalsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      date: serializer.fromJson<String?>(json['date']),
      mood: serializer.fromJson<String?>(json['mood']),
      weather: serializer.fromJson<String?>(json['weather']),
      location: serializer.fromJson<String?>(json['location']),
      journalText: serializer.fromJson<String?>(json['journalText']),
      voicePath: serializer.fromJson<String?>(json['voicePath']),
      tags: serializer.fromJson<String?>(json['tags']),
      favoriteMoment: serializer.fromJson<String?>(json['favoriteMoment']),
      lessonsLearned: serializer.fromJson<String?>(json['lessonsLearned']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'date': serializer.toJson<String?>(date),
      'mood': serializer.toJson<String?>(mood),
      'weather': serializer.toJson<String?>(weather),
      'location': serializer.toJson<String?>(location),
      'journalText': serializer.toJson<String?>(journalText),
      'voicePath': serializer.toJson<String?>(voicePath),
      'tags': serializer.toJson<String?>(tags),
      'favoriteMoment': serializer.toJson<String?>(favoriteMoment),
      'lessonsLearned': serializer.toJson<String?>(lessonsLearned),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DailyJournalsTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> date = const Value.absent(),
    Value<String?> mood = const Value.absent(),
    Value<String?> weather = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> journalText = const Value.absent(),
    Value<String?> voicePath = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    Value<String?> favoriteMoment = const Value.absent(),
    Value<String?> lessonsLearned = const Value.absent(),
    DateTime? createdAt,
  }) => DailyJournalsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    date: date.present ? date.value : this.date,
    mood: mood.present ? mood.value : this.mood,
    weather: weather.present ? weather.value : this.weather,
    location: location.present ? location.value : this.location,
    journalText: journalText.present ? journalText.value : this.journalText,
    voicePath: voicePath.present ? voicePath.value : this.voicePath,
    tags: tags.present ? tags.value : this.tags,
    favoriteMoment: favoriteMoment.present
        ? favoriteMoment.value
        : this.favoriteMoment,
    lessonsLearned: lessonsLearned.present
        ? lessonsLearned.value
        : this.lessonsLearned,
    createdAt: createdAt ?? this.createdAt,
  );
  DailyJournalsTableData copyWithCompanion(DailyJournalsTableCompanion data) {
    return DailyJournalsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      date: data.date.present ? data.date.value : this.date,
      mood: data.mood.present ? data.mood.value : this.mood,
      weather: data.weather.present ? data.weather.value : this.weather,
      location: data.location.present ? data.location.value : this.location,
      journalText: data.journalText.present
          ? data.journalText.value
          : this.journalText,
      voicePath: data.voicePath.present ? data.voicePath.value : this.voicePath,
      tags: data.tags.present ? data.tags.value : this.tags,
      favoriteMoment: data.favoriteMoment.present
          ? data.favoriteMoment.value
          : this.favoriteMoment,
      lessonsLearned: data.lessonsLearned.present
          ? data.lessonsLearned.value
          : this.lessonsLearned,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyJournalsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('date: $date, ')
          ..write('mood: $mood, ')
          ..write('weather: $weather, ')
          ..write('location: $location, ')
          ..write('journalText: $journalText, ')
          ..write('voicePath: $voicePath, ')
          ..write('tags: $tags, ')
          ..write('favoriteMoment: $favoriteMoment, ')
          ..write('lessonsLearned: $lessonsLearned, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    date,
    mood,
    weather,
    location,
    journalText,
    voicePath,
    tags,
    favoriteMoment,
    lessonsLearned,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyJournalsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.date == this.date &&
          other.mood == this.mood &&
          other.weather == this.weather &&
          other.location == this.location &&
          other.journalText == this.journalText &&
          other.voicePath == this.voicePath &&
          other.tags == this.tags &&
          other.favoriteMoment == this.favoriteMoment &&
          other.lessonsLearned == this.lessonsLearned &&
          other.createdAt == this.createdAt);
}

class DailyJournalsTableCompanion
    extends UpdateCompanion<DailyJournalsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> date;
  final Value<String?> mood;
  final Value<String?> weather;
  final Value<String?> location;
  final Value<String?> journalText;
  final Value<String?> voicePath;
  final Value<String?> tags;
  final Value<String?> favoriteMoment;
  final Value<String?> lessonsLearned;
  final Value<DateTime> createdAt;
  const DailyJournalsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.date = const Value.absent(),
    this.mood = const Value.absent(),
    this.weather = const Value.absent(),
    this.location = const Value.absent(),
    this.journalText = const Value.absent(),
    this.voicePath = const Value.absent(),
    this.tags = const Value.absent(),
    this.favoriteMoment = const Value.absent(),
    this.lessonsLearned = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DailyJournalsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.date = const Value.absent(),
    this.mood = const Value.absent(),
    this.weather = const Value.absent(),
    this.location = const Value.absent(),
    this.journalText = const Value.absent(),
    this.voicePath = const Value.absent(),
    this.tags = const Value.absent(),
    this.favoriteMoment = const Value.absent(),
    this.lessonsLearned = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<DailyJournalsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? date,
    Expression<String>? mood,
    Expression<String>? weather,
    Expression<String>? location,
    Expression<String>? journalText,
    Expression<String>? voicePath,
    Expression<String>? tags,
    Expression<String>? favoriteMoment,
    Expression<String>? lessonsLearned,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (date != null) 'date': date,
      if (mood != null) 'mood': mood,
      if (weather != null) 'weather': weather,
      if (location != null) 'location': location,
      if (journalText != null) 'journal_text': journalText,
      if (voicePath != null) 'voice_path': voicePath,
      if (tags != null) 'tags': tags,
      if (favoriteMoment != null) 'favorite_moment': favoriteMoment,
      if (lessonsLearned != null) 'lessons_learned': lessonsLearned,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DailyJournalsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? date,
    Value<String?>? mood,
    Value<String?>? weather,
    Value<String?>? location,
    Value<String?>? journalText,
    Value<String?>? voicePath,
    Value<String?>? tags,
    Value<String?>? favoriteMoment,
    Value<String?>? lessonsLearned,
    Value<DateTime>? createdAt,
  }) {
    return DailyJournalsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      date: date ?? this.date,
      mood: mood ?? this.mood,
      weather: weather ?? this.weather,
      location: location ?? this.location,
      journalText: journalText ?? this.journalText,
      voicePath: voicePath ?? this.voicePath,
      tags: tags ?? this.tags,
      favoriteMoment: favoriteMoment ?? this.favoriteMoment,
      lessonsLearned: lessonsLearned ?? this.lessonsLearned,
      createdAt: createdAt ?? this.createdAt,
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
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
    }
    if (weather.present) {
      map['weather'] = Variable<String>(weather.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (journalText.present) {
      map['journal_text'] = Variable<String>(journalText.value);
    }
    if (voicePath.present) {
      map['voice_path'] = Variable<String>(voicePath.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (favoriteMoment.present) {
      map['favorite_moment'] = Variable<String>(favoriteMoment.value);
    }
    if (lessonsLearned.present) {
      map['lessons_learned'] = Variable<String>(lessonsLearned.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyJournalsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('date: $date, ')
          ..write('mood: $mood, ')
          ..write('weather: $weather, ')
          ..write('location: $location, ')
          ..write('journalText: $journalText, ')
          ..write('voicePath: $voicePath, ')
          ..write('tags: $tags, ')
          ..write('favoriteMoment: $favoriteMoment, ')
          ..write('lessonsLearned: $lessonsLearned, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MemoriesTableTable extends MemoriesTable
    with TableInfo<$MemoriesTableTable, MemoriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoriesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionMeta = const VerificationMeta(
    'emotion',
  );
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
    'emotion',
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
  static const VerificationMeta _importanceMeta = const VerificationMeta(
    'importance',
  );
  @override
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
    'importance',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _privacyMeta = const VerificationMeta(
    'privacy',
  );
  @override
  late final GeneratedColumn<String> privacy = GeneratedColumn<String>(
    'privacy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    title,
    description,
    category,
    date,
    emotion,
    location,
    importance,
    privacy,
    tags,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memories';
  @override
  VerificationContext validateIntegrity(
    Insertable<MemoriesTableData> instance, {
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
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
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('emotion')) {
      context.handle(
        _emotionMeta,
        emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('importance')) {
      context.handle(
        _importanceMeta,
        importance.isAcceptableOrUnknown(data['importance']!, _importanceMeta),
      );
    }
    if (data.containsKey('privacy')) {
      context.handle(
        _privacyMeta,
        privacy.isAcceptableOrUnknown(data['privacy']!, _privacyMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemoriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoriesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      ),
      emotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      importance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}importance'],
      ),
      privacy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}privacy'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MemoriesTableTable createAlias(String alias) {
    return $MemoriesTableTable(attachedDatabase, alias);
  }
}

class MemoriesTableData extends DataClass
    implements Insertable<MemoriesTableData> {
  final int id;
  final int humanId;
  final String title;
  final String? description;
  final String? category;
  final String? date;
  final String? emotion;
  final String? location;
  final int? importance;
  final String? privacy;
  final String? tags;
  final DateTime createdAt;
  const MemoriesTableData({
    required this.id,
    required this.humanId,
    required this.title,
    this.description,
    this.category,
    this.date,
    this.emotion,
    this.location,
    this.importance,
    this.privacy,
    this.tags,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || emotion != null) {
      map['emotion'] = Variable<String>(emotion);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || importance != null) {
      map['importance'] = Variable<int>(importance);
    }
    if (!nullToAbsent || privacy != null) {
      map['privacy'] = Variable<String>(privacy);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MemoriesTableCompanion toCompanion(bool nullToAbsent) {
    return MemoriesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      emotion: emotion == null && nullToAbsent
          ? const Value.absent()
          : Value(emotion),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      importance: importance == null && nullToAbsent
          ? const Value.absent()
          : Value(importance),
      privacy: privacy == null && nullToAbsent
          ? const Value.absent()
          : Value(privacy),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      createdAt: Value(createdAt),
    );
  }

  factory MemoriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoriesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String?>(json['category']),
      date: serializer.fromJson<String?>(json['date']),
      emotion: serializer.fromJson<String?>(json['emotion']),
      location: serializer.fromJson<String?>(json['location']),
      importance: serializer.fromJson<int?>(json['importance']),
      privacy: serializer.fromJson<String?>(json['privacy']),
      tags: serializer.fromJson<String?>(json['tags']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String?>(category),
      'date': serializer.toJson<String?>(date),
      'emotion': serializer.toJson<String?>(emotion),
      'location': serializer.toJson<String?>(location),
      'importance': serializer.toJson<int?>(importance),
      'privacy': serializer.toJson<String?>(privacy),
      'tags': serializer.toJson<String?>(tags),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MemoriesTableData copyWith({
    int? id,
    int? humanId,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> date = const Value.absent(),
    Value<String?> emotion = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<int?> importance = const Value.absent(),
    Value<String?> privacy = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    DateTime? createdAt,
  }) => MemoriesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    category: category.present ? category.value : this.category,
    date: date.present ? date.value : this.date,
    emotion: emotion.present ? emotion.value : this.emotion,
    location: location.present ? location.value : this.location,
    importance: importance.present ? importance.value : this.importance,
    privacy: privacy.present ? privacy.value : this.privacy,
    tags: tags.present ? tags.value : this.tags,
    createdAt: createdAt ?? this.createdAt,
  );
  MemoriesTableData copyWithCompanion(MemoriesTableCompanion data) {
    return MemoriesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      date: data.date.present ? data.date.value : this.date,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      location: data.location.present ? data.location.value : this.location,
      importance: data.importance.present
          ? data.importance.value
          : this.importance,
      privacy: data.privacy.present ? data.privacy.value : this.privacy,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemoriesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('emotion: $emotion, ')
          ..write('location: $location, ')
          ..write('importance: $importance, ')
          ..write('privacy: $privacy, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    title,
    description,
    category,
    date,
    emotion,
    location,
    importance,
    privacy,
    tags,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoriesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.date == this.date &&
          other.emotion == this.emotion &&
          other.location == this.location &&
          other.importance == this.importance &&
          other.privacy == this.privacy &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt);
}

class MemoriesTableCompanion extends UpdateCompanion<MemoriesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> category;
  final Value<String?> date;
  final Value<String?> emotion;
  final Value<String?> location;
  final Value<int?> importance;
  final Value<String?> privacy;
  final Value<String?> tags;
  final Value<DateTime> createdAt;
  const MemoriesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.emotion = const Value.absent(),
    this.location = const Value.absent(),
    this.importance = const Value.absent(),
    this.privacy = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MemoriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String title,
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.emotion = const Value.absent(),
    this.location = const Value.absent(),
    this.importance = const Value.absent(),
    this.privacy = const Value.absent(),
    this.tags = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<MemoriesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? date,
    Expression<String>? emotion,
    Expression<String>? location,
    Expression<int>? importance,
    Expression<String>? privacy,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (date != null) 'date': date,
      if (emotion != null) 'emotion': emotion,
      if (location != null) 'location': location,
      if (importance != null) 'importance': importance,
      if (privacy != null) 'privacy': privacy,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MemoriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? category,
    Value<String?>? date,
    Value<String?>? emotion,
    Value<String?>? location,
    Value<int?>? importance,
    Value<String?>? privacy,
    Value<String?>? tags,
    Value<DateTime>? createdAt,
  }) {
    return MemoriesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      date: date ?? this.date,
      emotion: emotion ?? this.emotion,
      location: location ?? this.location,
      importance: importance ?? this.importance,
      privacy: privacy ?? this.privacy,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (importance.present) {
      map['importance'] = Variable<int>(importance.value);
    }
    if (privacy.present) {
      map['privacy'] = Variable<String>(privacy.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('emotion: $emotion, ')
          ..write('location: $location, ')
          ..write('importance: $importance, ')
          ..write('privacy: $privacy, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MemoryTagsTableTable extends MemoryTagsTable
    with TableInfo<$MemoryTagsTableTable, MemoryTagsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoryTagsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _memoryIdMeta = const VerificationMeta(
    'memoryId',
  );
  @override
  late final GeneratedColumn<int> memoryId = GeneratedColumn<int>(
    'memory_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES memories(id) ON DELETE CASCADE',
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, memoryId, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memory_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<MemoryTagsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('memory_id')) {
      context.handle(
        _memoryIdMeta,
        memoryId.isAcceptableOrUnknown(data['memory_id']!, _memoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memoryIdMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemoryTagsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoryTagsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      memoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}memory_id'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
    );
  }

  @override
  $MemoryTagsTableTable createAlias(String alias) {
    return $MemoryTagsTableTable(attachedDatabase, alias);
  }
}

class MemoryTagsTableData extends DataClass
    implements Insertable<MemoryTagsTableData> {
  final int id;
  final int memoryId;
  final String tag;
  const MemoryTagsTableData({
    required this.id,
    required this.memoryId,
    required this.tag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['memory_id'] = Variable<int>(memoryId);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  MemoryTagsTableCompanion toCompanion(bool nullToAbsent) {
    return MemoryTagsTableCompanion(
      id: Value(id),
      memoryId: Value(memoryId),
      tag: Value(tag),
    );
  }

  factory MemoryTagsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoryTagsTableData(
      id: serializer.fromJson<int>(json['id']),
      memoryId: serializer.fromJson<int>(json['memoryId']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memoryId': serializer.toJson<int>(memoryId),
      'tag': serializer.toJson<String>(tag),
    };
  }

  MemoryTagsTableData copyWith({int? id, int? memoryId, String? tag}) =>
      MemoryTagsTableData(
        id: id ?? this.id,
        memoryId: memoryId ?? this.memoryId,
        tag: tag ?? this.tag,
      );
  MemoryTagsTableData copyWithCompanion(MemoryTagsTableCompanion data) {
    return MemoryTagsTableData(
      id: data.id.present ? data.id.value : this.id,
      memoryId: data.memoryId.present ? data.memoryId.value : this.memoryId,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemoryTagsTableData(')
          ..write('id: $id, ')
          ..write('memoryId: $memoryId, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, memoryId, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoryTagsTableData &&
          other.id == this.id &&
          other.memoryId == this.memoryId &&
          other.tag == this.tag);
}

class MemoryTagsTableCompanion extends UpdateCompanion<MemoryTagsTableData> {
  final Value<int> id;
  final Value<int> memoryId;
  final Value<String> tag;
  const MemoryTagsTableCompanion({
    this.id = const Value.absent(),
    this.memoryId = const Value.absent(),
    this.tag = const Value.absent(),
  });
  MemoryTagsTableCompanion.insert({
    this.id = const Value.absent(),
    required int memoryId,
    required String tag,
  }) : memoryId = Value(memoryId),
       tag = Value(tag);
  static Insertable<MemoryTagsTableData> custom({
    Expression<int>? id,
    Expression<int>? memoryId,
    Expression<String>? tag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memoryId != null) 'memory_id': memoryId,
      if (tag != null) 'tag': tag,
    });
  }

  MemoryTagsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? memoryId,
    Value<String>? tag,
  }) {
    return MemoryTagsTableCompanion(
      id: id ?? this.id,
      memoryId: memoryId ?? this.memoryId,
      tag: tag ?? this.tag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memoryId.present) {
      map['memory_id'] = Variable<int>(memoryId.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoryTagsTableCompanion(')
          ..write('id: $id, ')
          ..write('memoryId: $memoryId, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }
}

class $MemoryLinksTableTable extends MemoryLinksTable
    with TableInfo<$MemoryLinksTableTable, MemoryLinksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoryLinksTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _memoryIdMeta = const VerificationMeta(
    'memoryId',
  );
  @override
  late final GeneratedColumn<int> memoryId = GeneratedColumn<int>(
    'memory_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES memories(id) ON DELETE CASCADE',
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, memoryId, entityType, entityId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memory_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<MemoryLinksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('memory_id')) {
      context.handle(
        _memoryIdMeta,
        memoryId.isAcceptableOrUnknown(data['memory_id']!, _memoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memoryIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemoryLinksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoryLinksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      memoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}memory_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      ),
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      ),
    );
  }

  @override
  $MemoryLinksTableTable createAlias(String alias) {
    return $MemoryLinksTableTable(attachedDatabase, alias);
  }
}

class MemoryLinksTableData extends DataClass
    implements Insertable<MemoryLinksTableData> {
  final int id;
  final int memoryId;
  final String? entityType;
  final int? entityId;
  const MemoryLinksTableData({
    required this.id,
    required this.memoryId,
    this.entityType,
    this.entityId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['memory_id'] = Variable<int>(memoryId);
    if (!nullToAbsent || entityType != null) {
      map['entity_type'] = Variable<String>(entityType);
    }
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<int>(entityId);
    }
    return map;
  }

  MemoryLinksTableCompanion toCompanion(bool nullToAbsent) {
    return MemoryLinksTableCompanion(
      id: Value(id),
      memoryId: Value(memoryId),
      entityType: entityType == null && nullToAbsent
          ? const Value.absent()
          : Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
    );
  }

  factory MemoryLinksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoryLinksTableData(
      id: serializer.fromJson<int>(json['id']),
      memoryId: serializer.fromJson<int>(json['memoryId']),
      entityType: serializer.fromJson<String?>(json['entityType']),
      entityId: serializer.fromJson<int?>(json['entityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memoryId': serializer.toJson<int>(memoryId),
      'entityType': serializer.toJson<String?>(entityType),
      'entityId': serializer.toJson<int?>(entityId),
    };
  }

  MemoryLinksTableData copyWith({
    int? id,
    int? memoryId,
    Value<String?> entityType = const Value.absent(),
    Value<int?> entityId = const Value.absent(),
  }) => MemoryLinksTableData(
    id: id ?? this.id,
    memoryId: memoryId ?? this.memoryId,
    entityType: entityType.present ? entityType.value : this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
  );
  MemoryLinksTableData copyWithCompanion(MemoryLinksTableCompanion data) {
    return MemoryLinksTableData(
      id: data.id.present ? data.id.value : this.id,
      memoryId: data.memoryId.present ? data.memoryId.value : this.memoryId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemoryLinksTableData(')
          ..write('id: $id, ')
          ..write('memoryId: $memoryId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, memoryId, entityType, entityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoryLinksTableData &&
          other.id == this.id &&
          other.memoryId == this.memoryId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId);
}

class MemoryLinksTableCompanion extends UpdateCompanion<MemoryLinksTableData> {
  final Value<int> id;
  final Value<int> memoryId;
  final Value<String?> entityType;
  final Value<int?> entityId;
  const MemoryLinksTableCompanion({
    this.id = const Value.absent(),
    this.memoryId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
  });
  MemoryLinksTableCompanion.insert({
    this.id = const Value.absent(),
    required int memoryId,
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
  }) : memoryId = Value(memoryId);
  static Insertable<MemoryLinksTableData> custom({
    Expression<int>? id,
    Expression<int>? memoryId,
    Expression<String>? entityType,
    Expression<int>? entityId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memoryId != null) 'memory_id': memoryId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
    });
  }

  MemoryLinksTableCompanion copyWith({
    Value<int>? id,
    Value<int>? memoryId,
    Value<String?>? entityType,
    Value<int?>? entityId,
  }) {
    return MemoryLinksTableCompanion(
      id: id ?? this.id,
      memoryId: memoryId ?? this.memoryId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memoryId.present) {
      map['memory_id'] = Variable<int>(memoryId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoryLinksTableCompanion(')
          ..write('id: $id, ')
          ..write('memoryId: $memoryId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId')
          ..write(')'))
        .toString();
  }
}

class $PhotosTableTable extends PhotosTable
    with TableInfo<$PhotosTableTable, PhotosTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _albumIdMeta = const VerificationMeta(
    'albumId',
  );
  @override
  late final GeneratedColumn<int> albumId = GeneratedColumn<int>(
    'album_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _captionMeta = const VerificationMeta(
    'caption',
  );
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
    'caption',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _takenDateMeta = const VerificationMeta(
    'takenDate',
  );
  @override
  late final GeneratedColumn<String> takenDate = GeneratedColumn<String>(
    'taken_date',
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
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    albumId,
    filePath,
    caption,
    takenDate,
    location,
    tags,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotosTableData> instance, {
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
    if (data.containsKey('album_id')) {
      context.handle(
        _albumIdMeta,
        albumId.isAcceptableOrUnknown(data['album_id']!, _albumIdMeta),
      );
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('caption')) {
      context.handle(
        _captionMeta,
        caption.isAcceptableOrUnknown(data['caption']!, _captionMeta),
      );
    }
    if (data.containsKey('taken_date')) {
      context.handle(
        _takenDateMeta,
        takenDate.isAcceptableOrUnknown(data['taken_date']!, _takenDateMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotosTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotosTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      albumId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}album_id'],
      ),
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      caption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caption'],
      ),
      takenDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}taken_date'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PhotosTableTable createAlias(String alias) {
    return $PhotosTableTable(attachedDatabase, alias);
  }
}

class PhotosTableData extends DataClass implements Insertable<PhotosTableData> {
  final int id;
  final int humanId;
  final int? albumId;
  final String filePath;
  final String? caption;
  final String? takenDate;
  final String? location;
  final String? tags;
  final DateTime createdAt;
  const PhotosTableData({
    required this.id,
    required this.humanId,
    this.albumId,
    required this.filePath,
    this.caption,
    this.takenDate,
    this.location,
    this.tags,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || albumId != null) {
      map['album_id'] = Variable<int>(albumId);
    }
    map['file_path'] = Variable<String>(filePath);
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    if (!nullToAbsent || takenDate != null) {
      map['taken_date'] = Variable<String>(takenDate);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PhotosTableCompanion toCompanion(bool nullToAbsent) {
    return PhotosTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      albumId: albumId == null && nullToAbsent
          ? const Value.absent()
          : Value(albumId),
      filePath: Value(filePath),
      caption: caption == null && nullToAbsent
          ? const Value.absent()
          : Value(caption),
      takenDate: takenDate == null && nullToAbsent
          ? const Value.absent()
          : Value(takenDate),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      createdAt: Value(createdAt),
    );
  }

  factory PhotosTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotosTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      albumId: serializer.fromJson<int?>(json['albumId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      caption: serializer.fromJson<String?>(json['caption']),
      takenDate: serializer.fromJson<String?>(json['takenDate']),
      location: serializer.fromJson<String?>(json['location']),
      tags: serializer.fromJson<String?>(json['tags']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'albumId': serializer.toJson<int?>(albumId),
      'filePath': serializer.toJson<String>(filePath),
      'caption': serializer.toJson<String?>(caption),
      'takenDate': serializer.toJson<String?>(takenDate),
      'location': serializer.toJson<String?>(location),
      'tags': serializer.toJson<String?>(tags),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PhotosTableData copyWith({
    int? id,
    int? humanId,
    Value<int?> albumId = const Value.absent(),
    String? filePath,
    Value<String?> caption = const Value.absent(),
    Value<String?> takenDate = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    DateTime? createdAt,
  }) => PhotosTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    albumId: albumId.present ? albumId.value : this.albumId,
    filePath: filePath ?? this.filePath,
    caption: caption.present ? caption.value : this.caption,
    takenDate: takenDate.present ? takenDate.value : this.takenDate,
    location: location.present ? location.value : this.location,
    tags: tags.present ? tags.value : this.tags,
    createdAt: createdAt ?? this.createdAt,
  );
  PhotosTableData copyWithCompanion(PhotosTableCompanion data) {
    return PhotosTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      albumId: data.albumId.present ? data.albumId.value : this.albumId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      caption: data.caption.present ? data.caption.value : this.caption,
      takenDate: data.takenDate.present ? data.takenDate.value : this.takenDate,
      location: data.location.present ? data.location.value : this.location,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotosTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('albumId: $albumId, ')
          ..write('filePath: $filePath, ')
          ..write('caption: $caption, ')
          ..write('takenDate: $takenDate, ')
          ..write('location: $location, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    albumId,
    filePath,
    caption,
    takenDate,
    location,
    tags,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotosTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.albumId == this.albumId &&
          other.filePath == this.filePath &&
          other.caption == this.caption &&
          other.takenDate == this.takenDate &&
          other.location == this.location &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt);
}

class PhotosTableCompanion extends UpdateCompanion<PhotosTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<int?> albumId;
  final Value<String> filePath;
  final Value<String?> caption;
  final Value<String?> takenDate;
  final Value<String?> location;
  final Value<String?> tags;
  final Value<DateTime> createdAt;
  const PhotosTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.albumId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.caption = const Value.absent(),
    this.takenDate = const Value.absent(),
    this.location = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PhotosTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.albumId = const Value.absent(),
    required String filePath,
    this.caption = const Value.absent(),
    this.takenDate = const Value.absent(),
    this.location = const Value.absent(),
    this.tags = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       filePath = Value(filePath),
       createdAt = Value(createdAt);
  static Insertable<PhotosTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<int>? albumId,
    Expression<String>? filePath,
    Expression<String>? caption,
    Expression<String>? takenDate,
    Expression<String>? location,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (albumId != null) 'album_id': albumId,
      if (filePath != null) 'file_path': filePath,
      if (caption != null) 'caption': caption,
      if (takenDate != null) 'taken_date': takenDate,
      if (location != null) 'location': location,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PhotosTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<int?>? albumId,
    Value<String>? filePath,
    Value<String?>? caption,
    Value<String?>? takenDate,
    Value<String?>? location,
    Value<String?>? tags,
    Value<DateTime>? createdAt,
  }) {
    return PhotosTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      albumId: albumId ?? this.albumId,
      filePath: filePath ?? this.filePath,
      caption: caption ?? this.caption,
      takenDate: takenDate ?? this.takenDate,
      location: location ?? this.location,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
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
    if (albumId.present) {
      map['album_id'] = Variable<int>(albumId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (takenDate.present) {
      map['taken_date'] = Variable<String>(takenDate.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('albumId: $albumId, ')
          ..write('filePath: $filePath, ')
          ..write('caption: $caption, ')
          ..write('takenDate: $takenDate, ')
          ..write('location: $location, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PhotoAlbumsTableTable extends PhotoAlbumsTable
    with TableInfo<$PhotoAlbumsTableTable, PhotoAlbumsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoAlbumsTableTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, humanId, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_albums';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoAlbumsTableData> instance, {
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoAlbumsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoAlbumsTableData(
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PhotoAlbumsTableTable createAlias(String alias) {
    return $PhotoAlbumsTableTable(attachedDatabase, alias);
  }
}

class PhotoAlbumsTableData extends DataClass
    implements Insertable<PhotoAlbumsTableData> {
  final int id;
  final int humanId;
  final String name;
  final DateTime createdAt;
  const PhotoAlbumsTableData({
    required this.id,
    required this.humanId,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PhotoAlbumsTableCompanion toCompanion(bool nullToAbsent) {
    return PhotoAlbumsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory PhotoAlbumsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoAlbumsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PhotoAlbumsTableData copyWith({
    int? id,
    int? humanId,
    String? name,
    DateTime? createdAt,
  }) => PhotoAlbumsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  PhotoAlbumsTableData copyWithCompanion(PhotoAlbumsTableCompanion data) {
    return PhotoAlbumsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoAlbumsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, humanId, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoAlbumsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class PhotoAlbumsTableCompanion extends UpdateCompanion<PhotoAlbumsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const PhotoAlbumsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PhotoAlbumsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String name,
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<PhotoAlbumsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PhotoAlbumsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? name,
    Value<DateTime>? createdAt,
  }) {
    return PhotoAlbumsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoAlbumsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTableTable extends DocumentsTable
    with TableInfo<$DocumentsTableTable, DocumentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    title,
    category,
    description,
    filePath,
    tags,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentsTableData> instance, {
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
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
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DocumentsTableTable createAlias(String alias) {
    return $DocumentsTableTable(attachedDatabase, alias);
  }
}

class DocumentsTableData extends DataClass
    implements Insertable<DocumentsTableData> {
  final int id;
  final int humanId;
  final String title;
  final String? category;
  final String? description;
  final String? filePath;
  final String? tags;
  final DateTime createdAt;
  const DocumentsTableData({
    required this.id,
    required this.humanId,
    required this.title,
    this.category,
    this.description,
    this.filePath,
    this.tags,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DocumentsTableCompanion toCompanion(bool nullToAbsent) {
    return DocumentsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      title: Value(title),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      createdAt: Value(createdAt),
    );
  }

  factory DocumentsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<String?>(json['category']),
      description: serializer.fromJson<String?>(json['description']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      tags: serializer.fromJson<String?>(json['tags']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String?>(category),
      'description': serializer.toJson<String?>(description),
      'filePath': serializer.toJson<String?>(filePath),
      'tags': serializer.toJson<String?>(tags),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DocumentsTableData copyWith({
    int? id,
    int? humanId,
    String? title,
    Value<String?> category = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> filePath = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    DateTime? createdAt,
  }) => DocumentsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    title: title ?? this.title,
    category: category.present ? category.value : this.category,
    description: description.present ? description.value : this.description,
    filePath: filePath.present ? filePath.value : this.filePath,
    tags: tags.present ? tags.value : this.tags,
    createdAt: createdAt ?? this.createdAt,
  );
  DocumentsTableData copyWithCompanion(DocumentsTableCompanion data) {
    return DocumentsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      title: data.title.present ? data.title.value : this.title,
      category: data.category.present ? data.category.value : this.category,
      description: data.description.present
          ? data.description.value
          : this.description,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('filePath: $filePath, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    title,
    category,
    description,
    filePath,
    tags,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.title == this.title &&
          other.category == this.category &&
          other.description == this.description &&
          other.filePath == this.filePath &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt);
}

class DocumentsTableCompanion extends UpdateCompanion<DocumentsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> title;
  final Value<String?> category;
  final Value<String?> description;
  final Value<String?> filePath;
  final Value<String?> tags;
  final Value<DateTime> createdAt;
  const DocumentsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.filePath = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DocumentsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String title,
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.filePath = const Value.absent(),
    this.tags = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<DocumentsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? title,
    Expression<String>? category,
    Expression<String>? description,
    Expression<String>? filePath,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (filePath != null) 'file_path': filePath,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DocumentsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? title,
    Value<String?>? category,
    Value<String?>? description,
    Value<String?>? filePath,
    Value<String?>? tags,
    Value<DateTime>? createdAt,
  }) {
    return DocumentsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      filePath: filePath ?? this.filePath,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('filePath: $filePath, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AudioFilesTableTable extends AudioFilesTable
    with TableInfo<$AudioFilesTableTable, AudioFilesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudioFilesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transcriptMeta = const VerificationMeta(
    'transcript',
  );
  @override
  late final GeneratedColumn<String> transcript = GeneratedColumn<String>(
    'transcript',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<double> duration = GeneratedColumn<double>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionMeta = const VerificationMeta(
    'emotion',
  );
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
    'emotion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    filePath,
    transcript,
    duration,
    emotion,
    language,
    provider,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audio_files';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudioFilesTableData> instance, {
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
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('transcript')) {
      context.handle(
        _transcriptMeta,
        transcript.isAcceptableOrUnknown(data['transcript']!, _transcriptMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('emotion')) {
      context.handle(
        _emotionMeta,
        emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AudioFilesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudioFilesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      transcript: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transcript'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}duration'],
      ),
      emotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion'],
      ),
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AudioFilesTableTable createAlias(String alias) {
    return $AudioFilesTableTable(attachedDatabase, alias);
  }
}

class AudioFilesTableData extends DataClass
    implements Insertable<AudioFilesTableData> {
  final int id;
  final int humanId;
  final String filePath;
  final String? transcript;
  final double? duration;
  final String? emotion;
  final String? language;
  final String? provider;
  final DateTime createdAt;
  const AudioFilesTableData({
    required this.id,
    required this.humanId,
    required this.filePath,
    this.transcript,
    this.duration,
    this.emotion,
    this.language,
    this.provider,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['file_path'] = Variable<String>(filePath);
    if (!nullToAbsent || transcript != null) {
      map['transcript'] = Variable<String>(transcript);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<double>(duration);
    }
    if (!nullToAbsent || emotion != null) {
      map['emotion'] = Variable<String>(emotion);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || provider != null) {
      map['provider'] = Variable<String>(provider);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AudioFilesTableCompanion toCompanion(bool nullToAbsent) {
    return AudioFilesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      filePath: Value(filePath),
      transcript: transcript == null && nullToAbsent
          ? const Value.absent()
          : Value(transcript),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      emotion: emotion == null && nullToAbsent
          ? const Value.absent()
          : Value(emotion),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      provider: provider == null && nullToAbsent
          ? const Value.absent()
          : Value(provider),
      createdAt: Value(createdAt),
    );
  }

  factory AudioFilesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudioFilesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      transcript: serializer.fromJson<String?>(json['transcript']),
      duration: serializer.fromJson<double?>(json['duration']),
      emotion: serializer.fromJson<String?>(json['emotion']),
      language: serializer.fromJson<String?>(json['language']),
      provider: serializer.fromJson<String?>(json['provider']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'filePath': serializer.toJson<String>(filePath),
      'transcript': serializer.toJson<String?>(transcript),
      'duration': serializer.toJson<double?>(duration),
      'emotion': serializer.toJson<String?>(emotion),
      'language': serializer.toJson<String?>(language),
      'provider': serializer.toJson<String?>(provider),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AudioFilesTableData copyWith({
    int? id,
    int? humanId,
    String? filePath,
    Value<String?> transcript = const Value.absent(),
    Value<double?> duration = const Value.absent(),
    Value<String?> emotion = const Value.absent(),
    Value<String?> language = const Value.absent(),
    Value<String?> provider = const Value.absent(),
    DateTime? createdAt,
  }) => AudioFilesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    filePath: filePath ?? this.filePath,
    transcript: transcript.present ? transcript.value : this.transcript,
    duration: duration.present ? duration.value : this.duration,
    emotion: emotion.present ? emotion.value : this.emotion,
    language: language.present ? language.value : this.language,
    provider: provider.present ? provider.value : this.provider,
    createdAt: createdAt ?? this.createdAt,
  );
  AudioFilesTableData copyWithCompanion(AudioFilesTableCompanion data) {
    return AudioFilesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      transcript: data.transcript.present
          ? data.transcript.value
          : this.transcript,
      duration: data.duration.present ? data.duration.value : this.duration,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      language: data.language.present ? data.language.value : this.language,
      provider: data.provider.present ? data.provider.value : this.provider,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudioFilesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('filePath: $filePath, ')
          ..write('transcript: $transcript, ')
          ..write('duration: $duration, ')
          ..write('emotion: $emotion, ')
          ..write('language: $language, ')
          ..write('provider: $provider, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    filePath,
    transcript,
    duration,
    emotion,
    language,
    provider,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudioFilesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.filePath == this.filePath &&
          other.transcript == this.transcript &&
          other.duration == this.duration &&
          other.emotion == this.emotion &&
          other.language == this.language &&
          other.provider == this.provider &&
          other.createdAt == this.createdAt);
}

class AudioFilesTableCompanion extends UpdateCompanion<AudioFilesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> filePath;
  final Value<String?> transcript;
  final Value<double?> duration;
  final Value<String?> emotion;
  final Value<String?> language;
  final Value<String?> provider;
  final Value<DateTime> createdAt;
  const AudioFilesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.transcript = const Value.absent(),
    this.duration = const Value.absent(),
    this.emotion = const Value.absent(),
    this.language = const Value.absent(),
    this.provider = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AudioFilesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String filePath,
    this.transcript = const Value.absent(),
    this.duration = const Value.absent(),
    this.emotion = const Value.absent(),
    this.language = const Value.absent(),
    this.provider = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       filePath = Value(filePath),
       createdAt = Value(createdAt);
  static Insertable<AudioFilesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? filePath,
    Expression<String>? transcript,
    Expression<double>? duration,
    Expression<String>? emotion,
    Expression<String>? language,
    Expression<String>? provider,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (filePath != null) 'file_path': filePath,
      if (transcript != null) 'transcript': transcript,
      if (duration != null) 'duration': duration,
      if (emotion != null) 'emotion': emotion,
      if (language != null) 'language': language,
      if (provider != null) 'provider': provider,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AudioFilesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? filePath,
    Value<String?>? transcript,
    Value<double?>? duration,
    Value<String?>? emotion,
    Value<String?>? language,
    Value<String?>? provider,
    Value<DateTime>? createdAt,
  }) {
    return AudioFilesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      filePath: filePath ?? this.filePath,
      transcript: transcript ?? this.transcript,
      duration: duration ?? this.duration,
      emotion: emotion ?? this.emotion,
      language: language ?? this.language,
      provider: provider ?? this.provider,
      createdAt: createdAt ?? this.createdAt,
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
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (transcript.present) {
      map['transcript'] = Variable<String>(transcript.value);
    }
    if (duration.present) {
      map['duration'] = Variable<double>(duration.value);
    }
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudioFilesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('filePath: $filePath, ')
          ..write('transcript: $transcript, ')
          ..write('duration: $duration, ')
          ..write('emotion: $emotion, ')
          ..write('language: $language, ')
          ..write('provider: $provider, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $VoiceSettingsTableTable extends VoiceSettingsTable
    with TableInfo<$VoiceSettingsTableTable, VoiceSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VoiceSettingsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _providerSttMeta = const VerificationMeta(
    'providerStt',
  );
  @override
  late final GeneratedColumn<String> providerStt = GeneratedColumn<String>(
    'provider_stt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _providerTtsMeta = const VerificationMeta(
    'providerTts',
  );
  @override
  late final GeneratedColumn<String> providerTts = GeneratedColumn<String>(
    'provider_tts',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voiceModelMeta = const VerificationMeta(
    'voiceModel',
  );
  @override
  late final GeneratedColumn<String> voiceModel = GeneratedColumn<String>(
    'voice_model',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accentMeta = const VerificationMeta('accent');
  @override
  late final GeneratedColumn<String> accent = GeneratedColumn<String>(
    'accent',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pitchMeta = const VerificationMeta('pitch');
  @override
  late final GeneratedColumn<String> pitch = GeneratedColumn<String>(
    'pitch',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
    'speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<double> volume = GeneratedColumn<double>(
    'volume',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionMeta = const VerificationMeta(
    'emotion',
  );
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
    'emotion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pauseDurationMeta = const VerificationMeta(
    'pauseDuration',
  );
  @override
  late final GeneratedColumn<double> pauseDuration = GeneratedColumn<double>(
    'pause_duration',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speakingStyleMeta = const VerificationMeta(
    'speakingStyle',
  );
  @override
  late final GeneratedColumn<String> speakingStyle = GeneratedColumn<String>(
    'speaking_style',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _silenceTimeoutMeta = const VerificationMeta(
    'silenceTimeout',
  );
  @override
  late final GeneratedColumn<int> silenceTimeout = GeneratedColumn<int>(
    'silence_timeout',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noiseSuppressionMeta = const VerificationMeta(
    'noiseSuppression',
  );
  @override
  late final GeneratedColumn<int> noiseSuppression = GeneratedColumn<int>(
    'noise_suppression',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _echoCancellationMeta = const VerificationMeta(
    'echoCancellation',
  );
  @override
  late final GeneratedColumn<int> echoCancellation = GeneratedColumn<int>(
    'echo_cancellation',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _autoGainControlMeta = const VerificationMeta(
    'autoGainControl',
  );
  @override
  late final GeneratedColumn<int> autoGainControl = GeneratedColumn<int>(
    'auto_gain_control',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voiceSensitivityMeta = const VerificationMeta(
    'voiceSensitivity',
  );
  @override
  late final GeneratedColumn<double> voiceSensitivity = GeneratedColumn<double>(
    'voice_sensitivity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
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
    providerStt,
    providerTts,
    voiceModel,
    accent,
    pitch,
    speed,
    volume,
    emotion,
    pauseDuration,
    speakingStyle,
    silenceTimeout,
    noiseSuppression,
    echoCancellation,
    autoGainControl,
    voiceSensitivity,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'voice_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<VoiceSettingsTableData> instance, {
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
    if (data.containsKey('provider_stt')) {
      context.handle(
        _providerSttMeta,
        providerStt.isAcceptableOrUnknown(
          data['provider_stt']!,
          _providerSttMeta,
        ),
      );
    }
    if (data.containsKey('provider_tts')) {
      context.handle(
        _providerTtsMeta,
        providerTts.isAcceptableOrUnknown(
          data['provider_tts']!,
          _providerTtsMeta,
        ),
      );
    }
    if (data.containsKey('voice_model')) {
      context.handle(
        _voiceModelMeta,
        voiceModel.isAcceptableOrUnknown(data['voice_model']!, _voiceModelMeta),
      );
    }
    if (data.containsKey('accent')) {
      context.handle(
        _accentMeta,
        accent.isAcceptableOrUnknown(data['accent']!, _accentMeta),
      );
    }
    if (data.containsKey('pitch')) {
      context.handle(
        _pitchMeta,
        pitch.isAcceptableOrUnknown(data['pitch']!, _pitchMeta),
      );
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    }
    if (data.containsKey('emotion')) {
      context.handle(
        _emotionMeta,
        emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta),
      );
    }
    if (data.containsKey('pause_duration')) {
      context.handle(
        _pauseDurationMeta,
        pauseDuration.isAcceptableOrUnknown(
          data['pause_duration']!,
          _pauseDurationMeta,
        ),
      );
    }
    if (data.containsKey('speaking_style')) {
      context.handle(
        _speakingStyleMeta,
        speakingStyle.isAcceptableOrUnknown(
          data['speaking_style']!,
          _speakingStyleMeta,
        ),
      );
    }
    if (data.containsKey('silence_timeout')) {
      context.handle(
        _silenceTimeoutMeta,
        silenceTimeout.isAcceptableOrUnknown(
          data['silence_timeout']!,
          _silenceTimeoutMeta,
        ),
      );
    }
    if (data.containsKey('noise_suppression')) {
      context.handle(
        _noiseSuppressionMeta,
        noiseSuppression.isAcceptableOrUnknown(
          data['noise_suppression']!,
          _noiseSuppressionMeta,
        ),
      );
    }
    if (data.containsKey('echo_cancellation')) {
      context.handle(
        _echoCancellationMeta,
        echoCancellation.isAcceptableOrUnknown(
          data['echo_cancellation']!,
          _echoCancellationMeta,
        ),
      );
    }
    if (data.containsKey('auto_gain_control')) {
      context.handle(
        _autoGainControlMeta,
        autoGainControl.isAcceptableOrUnknown(
          data['auto_gain_control']!,
          _autoGainControlMeta,
        ),
      );
    }
    if (data.containsKey('voice_sensitivity')) {
      context.handle(
        _voiceSensitivityMeta,
        voiceSensitivity.isAcceptableOrUnknown(
          data['voice_sensitivity']!,
          _voiceSensitivityMeta,
        ),
      );
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
  VoiceSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VoiceSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      providerStt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_stt'],
      ),
      providerTts: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_tts'],
      ),
      voiceModel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voice_model'],
      ),
      accent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accent'],
      ),
      pitch: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pitch'],
      ),
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed'],
      ),
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume'],
      ),
      emotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion'],
      ),
      pauseDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pause_duration'],
      ),
      speakingStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}speaking_style'],
      ),
      silenceTimeout: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}silence_timeout'],
      ),
      noiseSuppression: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}noise_suppression'],
      ),
      echoCancellation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}echo_cancellation'],
      ),
      autoGainControl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}auto_gain_control'],
      ),
      voiceSensitivity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}voice_sensitivity'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VoiceSettingsTableTable createAlias(String alias) {
    return $VoiceSettingsTableTable(attachedDatabase, alias);
  }
}

class VoiceSettingsTableData extends DataClass
    implements Insertable<VoiceSettingsTableData> {
  final int id;
  final int humanId;
  final String? providerStt;
  final String? providerTts;
  final String? voiceModel;
  final String? accent;
  final String? pitch;
  final double? speed;
  final double? volume;
  final String? emotion;
  final double? pauseDuration;
  final String? speakingStyle;
  final int? silenceTimeout;
  final int? noiseSuppression;
  final int? echoCancellation;
  final int? autoGainControl;
  final double? voiceSensitivity;
  final DateTime updatedAt;
  const VoiceSettingsTableData({
    required this.id,
    required this.humanId,
    this.providerStt,
    this.providerTts,
    this.voiceModel,
    this.accent,
    this.pitch,
    this.speed,
    this.volume,
    this.emotion,
    this.pauseDuration,
    this.speakingStyle,
    this.silenceTimeout,
    this.noiseSuppression,
    this.echoCancellation,
    this.autoGainControl,
    this.voiceSensitivity,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || providerStt != null) {
      map['provider_stt'] = Variable<String>(providerStt);
    }
    if (!nullToAbsent || providerTts != null) {
      map['provider_tts'] = Variable<String>(providerTts);
    }
    if (!nullToAbsent || voiceModel != null) {
      map['voice_model'] = Variable<String>(voiceModel);
    }
    if (!nullToAbsent || accent != null) {
      map['accent'] = Variable<String>(accent);
    }
    if (!nullToAbsent || pitch != null) {
      map['pitch'] = Variable<String>(pitch);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<double>(speed);
    }
    if (!nullToAbsent || volume != null) {
      map['volume'] = Variable<double>(volume);
    }
    if (!nullToAbsent || emotion != null) {
      map['emotion'] = Variable<String>(emotion);
    }
    if (!nullToAbsent || pauseDuration != null) {
      map['pause_duration'] = Variable<double>(pauseDuration);
    }
    if (!nullToAbsent || speakingStyle != null) {
      map['speaking_style'] = Variable<String>(speakingStyle);
    }
    if (!nullToAbsent || silenceTimeout != null) {
      map['silence_timeout'] = Variable<int>(silenceTimeout);
    }
    if (!nullToAbsent || noiseSuppression != null) {
      map['noise_suppression'] = Variable<int>(noiseSuppression);
    }
    if (!nullToAbsent || echoCancellation != null) {
      map['echo_cancellation'] = Variable<int>(echoCancellation);
    }
    if (!nullToAbsent || autoGainControl != null) {
      map['auto_gain_control'] = Variable<int>(autoGainControl);
    }
    if (!nullToAbsent || voiceSensitivity != null) {
      map['voice_sensitivity'] = Variable<double>(voiceSensitivity);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VoiceSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return VoiceSettingsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      providerStt: providerStt == null && nullToAbsent
          ? const Value.absent()
          : Value(providerStt),
      providerTts: providerTts == null && nullToAbsent
          ? const Value.absent()
          : Value(providerTts),
      voiceModel: voiceModel == null && nullToAbsent
          ? const Value.absent()
          : Value(voiceModel),
      accent: accent == null && nullToAbsent
          ? const Value.absent()
          : Value(accent),
      pitch: pitch == null && nullToAbsent
          ? const Value.absent()
          : Value(pitch),
      speed: speed == null && nullToAbsent
          ? const Value.absent()
          : Value(speed),
      volume: volume == null && nullToAbsent
          ? const Value.absent()
          : Value(volume),
      emotion: emotion == null && nullToAbsent
          ? const Value.absent()
          : Value(emotion),
      pauseDuration: pauseDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(pauseDuration),
      speakingStyle: speakingStyle == null && nullToAbsent
          ? const Value.absent()
          : Value(speakingStyle),
      silenceTimeout: silenceTimeout == null && nullToAbsent
          ? const Value.absent()
          : Value(silenceTimeout),
      noiseSuppression: noiseSuppression == null && nullToAbsent
          ? const Value.absent()
          : Value(noiseSuppression),
      echoCancellation: echoCancellation == null && nullToAbsent
          ? const Value.absent()
          : Value(echoCancellation),
      autoGainControl: autoGainControl == null && nullToAbsent
          ? const Value.absent()
          : Value(autoGainControl),
      voiceSensitivity: voiceSensitivity == null && nullToAbsent
          ? const Value.absent()
          : Value(voiceSensitivity),
      updatedAt: Value(updatedAt),
    );
  }

  factory VoiceSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VoiceSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      providerStt: serializer.fromJson<String?>(json['providerStt']),
      providerTts: serializer.fromJson<String?>(json['providerTts']),
      voiceModel: serializer.fromJson<String?>(json['voiceModel']),
      accent: serializer.fromJson<String?>(json['accent']),
      pitch: serializer.fromJson<String?>(json['pitch']),
      speed: serializer.fromJson<double?>(json['speed']),
      volume: serializer.fromJson<double?>(json['volume']),
      emotion: serializer.fromJson<String?>(json['emotion']),
      pauseDuration: serializer.fromJson<double?>(json['pauseDuration']),
      speakingStyle: serializer.fromJson<String?>(json['speakingStyle']),
      silenceTimeout: serializer.fromJson<int?>(json['silenceTimeout']),
      noiseSuppression: serializer.fromJson<int?>(json['noiseSuppression']),
      echoCancellation: serializer.fromJson<int?>(json['echoCancellation']),
      autoGainControl: serializer.fromJson<int?>(json['autoGainControl']),
      voiceSensitivity: serializer.fromJson<double?>(json['voiceSensitivity']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'providerStt': serializer.toJson<String?>(providerStt),
      'providerTts': serializer.toJson<String?>(providerTts),
      'voiceModel': serializer.toJson<String?>(voiceModel),
      'accent': serializer.toJson<String?>(accent),
      'pitch': serializer.toJson<String?>(pitch),
      'speed': serializer.toJson<double?>(speed),
      'volume': serializer.toJson<double?>(volume),
      'emotion': serializer.toJson<String?>(emotion),
      'pauseDuration': serializer.toJson<double?>(pauseDuration),
      'speakingStyle': serializer.toJson<String?>(speakingStyle),
      'silenceTimeout': serializer.toJson<int?>(silenceTimeout),
      'noiseSuppression': serializer.toJson<int?>(noiseSuppression),
      'echoCancellation': serializer.toJson<int?>(echoCancellation),
      'autoGainControl': serializer.toJson<int?>(autoGainControl),
      'voiceSensitivity': serializer.toJson<double?>(voiceSensitivity),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VoiceSettingsTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> providerStt = const Value.absent(),
    Value<String?> providerTts = const Value.absent(),
    Value<String?> voiceModel = const Value.absent(),
    Value<String?> accent = const Value.absent(),
    Value<String?> pitch = const Value.absent(),
    Value<double?> speed = const Value.absent(),
    Value<double?> volume = const Value.absent(),
    Value<String?> emotion = const Value.absent(),
    Value<double?> pauseDuration = const Value.absent(),
    Value<String?> speakingStyle = const Value.absent(),
    Value<int?> silenceTimeout = const Value.absent(),
    Value<int?> noiseSuppression = const Value.absent(),
    Value<int?> echoCancellation = const Value.absent(),
    Value<int?> autoGainControl = const Value.absent(),
    Value<double?> voiceSensitivity = const Value.absent(),
    DateTime? updatedAt,
  }) => VoiceSettingsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    providerStt: providerStt.present ? providerStt.value : this.providerStt,
    providerTts: providerTts.present ? providerTts.value : this.providerTts,
    voiceModel: voiceModel.present ? voiceModel.value : this.voiceModel,
    accent: accent.present ? accent.value : this.accent,
    pitch: pitch.present ? pitch.value : this.pitch,
    speed: speed.present ? speed.value : this.speed,
    volume: volume.present ? volume.value : this.volume,
    emotion: emotion.present ? emotion.value : this.emotion,
    pauseDuration: pauseDuration.present
        ? pauseDuration.value
        : this.pauseDuration,
    speakingStyle: speakingStyle.present
        ? speakingStyle.value
        : this.speakingStyle,
    silenceTimeout: silenceTimeout.present
        ? silenceTimeout.value
        : this.silenceTimeout,
    noiseSuppression: noiseSuppression.present
        ? noiseSuppression.value
        : this.noiseSuppression,
    echoCancellation: echoCancellation.present
        ? echoCancellation.value
        : this.echoCancellation,
    autoGainControl: autoGainControl.present
        ? autoGainControl.value
        : this.autoGainControl,
    voiceSensitivity: voiceSensitivity.present
        ? voiceSensitivity.value
        : this.voiceSensitivity,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VoiceSettingsTableData copyWithCompanion(VoiceSettingsTableCompanion data) {
    return VoiceSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      providerStt: data.providerStt.present
          ? data.providerStt.value
          : this.providerStt,
      providerTts: data.providerTts.present
          ? data.providerTts.value
          : this.providerTts,
      voiceModel: data.voiceModel.present
          ? data.voiceModel.value
          : this.voiceModel,
      accent: data.accent.present ? data.accent.value : this.accent,
      pitch: data.pitch.present ? data.pitch.value : this.pitch,
      speed: data.speed.present ? data.speed.value : this.speed,
      volume: data.volume.present ? data.volume.value : this.volume,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      pauseDuration: data.pauseDuration.present
          ? data.pauseDuration.value
          : this.pauseDuration,
      speakingStyle: data.speakingStyle.present
          ? data.speakingStyle.value
          : this.speakingStyle,
      silenceTimeout: data.silenceTimeout.present
          ? data.silenceTimeout.value
          : this.silenceTimeout,
      noiseSuppression: data.noiseSuppression.present
          ? data.noiseSuppression.value
          : this.noiseSuppression,
      echoCancellation: data.echoCancellation.present
          ? data.echoCancellation.value
          : this.echoCancellation,
      autoGainControl: data.autoGainControl.present
          ? data.autoGainControl.value
          : this.autoGainControl,
      voiceSensitivity: data.voiceSensitivity.present
          ? data.voiceSensitivity.value
          : this.voiceSensitivity,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VoiceSettingsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('providerStt: $providerStt, ')
          ..write('providerTts: $providerTts, ')
          ..write('voiceModel: $voiceModel, ')
          ..write('accent: $accent, ')
          ..write('pitch: $pitch, ')
          ..write('speed: $speed, ')
          ..write('volume: $volume, ')
          ..write('emotion: $emotion, ')
          ..write('pauseDuration: $pauseDuration, ')
          ..write('speakingStyle: $speakingStyle, ')
          ..write('silenceTimeout: $silenceTimeout, ')
          ..write('noiseSuppression: $noiseSuppression, ')
          ..write('echoCancellation: $echoCancellation, ')
          ..write('autoGainControl: $autoGainControl, ')
          ..write('voiceSensitivity: $voiceSensitivity, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    providerStt,
    providerTts,
    voiceModel,
    accent,
    pitch,
    speed,
    volume,
    emotion,
    pauseDuration,
    speakingStyle,
    silenceTimeout,
    noiseSuppression,
    echoCancellation,
    autoGainControl,
    voiceSensitivity,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VoiceSettingsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.providerStt == this.providerStt &&
          other.providerTts == this.providerTts &&
          other.voiceModel == this.voiceModel &&
          other.accent == this.accent &&
          other.pitch == this.pitch &&
          other.speed == this.speed &&
          other.volume == this.volume &&
          other.emotion == this.emotion &&
          other.pauseDuration == this.pauseDuration &&
          other.speakingStyle == this.speakingStyle &&
          other.silenceTimeout == this.silenceTimeout &&
          other.noiseSuppression == this.noiseSuppression &&
          other.echoCancellation == this.echoCancellation &&
          other.autoGainControl == this.autoGainControl &&
          other.voiceSensitivity == this.voiceSensitivity &&
          other.updatedAt == this.updatedAt);
}

class VoiceSettingsTableCompanion
    extends UpdateCompanion<VoiceSettingsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> providerStt;
  final Value<String?> providerTts;
  final Value<String?> voiceModel;
  final Value<String?> accent;
  final Value<String?> pitch;
  final Value<double?> speed;
  final Value<double?> volume;
  final Value<String?> emotion;
  final Value<double?> pauseDuration;
  final Value<String?> speakingStyle;
  final Value<int?> silenceTimeout;
  final Value<int?> noiseSuppression;
  final Value<int?> echoCancellation;
  final Value<int?> autoGainControl;
  final Value<double?> voiceSensitivity;
  final Value<DateTime> updatedAt;
  const VoiceSettingsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.providerStt = const Value.absent(),
    this.providerTts = const Value.absent(),
    this.voiceModel = const Value.absent(),
    this.accent = const Value.absent(),
    this.pitch = const Value.absent(),
    this.speed = const Value.absent(),
    this.volume = const Value.absent(),
    this.emotion = const Value.absent(),
    this.pauseDuration = const Value.absent(),
    this.speakingStyle = const Value.absent(),
    this.silenceTimeout = const Value.absent(),
    this.noiseSuppression = const Value.absent(),
    this.echoCancellation = const Value.absent(),
    this.autoGainControl = const Value.absent(),
    this.voiceSensitivity = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VoiceSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.providerStt = const Value.absent(),
    this.providerTts = const Value.absent(),
    this.voiceModel = const Value.absent(),
    this.accent = const Value.absent(),
    this.pitch = const Value.absent(),
    this.speed = const Value.absent(),
    this.volume = const Value.absent(),
    this.emotion = const Value.absent(),
    this.pauseDuration = const Value.absent(),
    this.speakingStyle = const Value.absent(),
    this.silenceTimeout = const Value.absent(),
    this.noiseSuppression = const Value.absent(),
    this.echoCancellation = const Value.absent(),
    this.autoGainControl = const Value.absent(),
    this.voiceSensitivity = const Value.absent(),
    required DateTime updatedAt,
  }) : humanId = Value(humanId),
       updatedAt = Value(updatedAt);
  static Insertable<VoiceSettingsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? providerStt,
    Expression<String>? providerTts,
    Expression<String>? voiceModel,
    Expression<String>? accent,
    Expression<String>? pitch,
    Expression<double>? speed,
    Expression<double>? volume,
    Expression<String>? emotion,
    Expression<double>? pauseDuration,
    Expression<String>? speakingStyle,
    Expression<int>? silenceTimeout,
    Expression<int>? noiseSuppression,
    Expression<int>? echoCancellation,
    Expression<int>? autoGainControl,
    Expression<double>? voiceSensitivity,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (providerStt != null) 'provider_stt': providerStt,
      if (providerTts != null) 'provider_tts': providerTts,
      if (voiceModel != null) 'voice_model': voiceModel,
      if (accent != null) 'accent': accent,
      if (pitch != null) 'pitch': pitch,
      if (speed != null) 'speed': speed,
      if (volume != null) 'volume': volume,
      if (emotion != null) 'emotion': emotion,
      if (pauseDuration != null) 'pause_duration': pauseDuration,
      if (speakingStyle != null) 'speaking_style': speakingStyle,
      if (silenceTimeout != null) 'silence_timeout': silenceTimeout,
      if (noiseSuppression != null) 'noise_suppression': noiseSuppression,
      if (echoCancellation != null) 'echo_cancellation': echoCancellation,
      if (autoGainControl != null) 'auto_gain_control': autoGainControl,
      if (voiceSensitivity != null) 'voice_sensitivity': voiceSensitivity,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VoiceSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? providerStt,
    Value<String?>? providerTts,
    Value<String?>? voiceModel,
    Value<String?>? accent,
    Value<String?>? pitch,
    Value<double?>? speed,
    Value<double?>? volume,
    Value<String?>? emotion,
    Value<double?>? pauseDuration,
    Value<String?>? speakingStyle,
    Value<int?>? silenceTimeout,
    Value<int?>? noiseSuppression,
    Value<int?>? echoCancellation,
    Value<int?>? autoGainControl,
    Value<double?>? voiceSensitivity,
    Value<DateTime>? updatedAt,
  }) {
    return VoiceSettingsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      providerStt: providerStt ?? this.providerStt,
      providerTts: providerTts ?? this.providerTts,
      voiceModel: voiceModel ?? this.voiceModel,
      accent: accent ?? this.accent,
      pitch: pitch ?? this.pitch,
      speed: speed ?? this.speed,
      volume: volume ?? this.volume,
      emotion: emotion ?? this.emotion,
      pauseDuration: pauseDuration ?? this.pauseDuration,
      speakingStyle: speakingStyle ?? this.speakingStyle,
      silenceTimeout: silenceTimeout ?? this.silenceTimeout,
      noiseSuppression: noiseSuppression ?? this.noiseSuppression,
      echoCancellation: echoCancellation ?? this.echoCancellation,
      autoGainControl: autoGainControl ?? this.autoGainControl,
      voiceSensitivity: voiceSensitivity ?? this.voiceSensitivity,
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
    if (providerStt.present) {
      map['provider_stt'] = Variable<String>(providerStt.value);
    }
    if (providerTts.present) {
      map['provider_tts'] = Variable<String>(providerTts.value);
    }
    if (voiceModel.present) {
      map['voice_model'] = Variable<String>(voiceModel.value);
    }
    if (accent.present) {
      map['accent'] = Variable<String>(accent.value);
    }
    if (pitch.present) {
      map['pitch'] = Variable<String>(pitch.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (pauseDuration.present) {
      map['pause_duration'] = Variable<double>(pauseDuration.value);
    }
    if (speakingStyle.present) {
      map['speaking_style'] = Variable<String>(speakingStyle.value);
    }
    if (silenceTimeout.present) {
      map['silence_timeout'] = Variable<int>(silenceTimeout.value);
    }
    if (noiseSuppression.present) {
      map['noise_suppression'] = Variable<int>(noiseSuppression.value);
    }
    if (echoCancellation.present) {
      map['echo_cancellation'] = Variable<int>(echoCancellation.value);
    }
    if (autoGainControl.present) {
      map['auto_gain_control'] = Variable<int>(autoGainControl.value);
    }
    if (voiceSensitivity.present) {
      map['voice_sensitivity'] = Variable<double>(voiceSensitivity.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VoiceSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('providerStt: $providerStt, ')
          ..write('providerTts: $providerTts, ')
          ..write('voiceModel: $voiceModel, ')
          ..write('accent: $accent, ')
          ..write('pitch: $pitch, ')
          ..write('speed: $speed, ')
          ..write('volume: $volume, ')
          ..write('emotion: $emotion, ')
          ..write('pauseDuration: $pauseDuration, ')
          ..write('speakingStyle: $speakingStyle, ')
          ..write('silenceTimeout: $silenceTimeout, ')
          ..write('noiseSuppression: $noiseSuppression, ')
          ..write('echoCancellation: $echoCancellation, ')
          ..write('autoGainControl: $autoGainControl, ')
          ..write('voiceSensitivity: $voiceSensitivity, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LegacyMessagesTableTable extends LegacyMessagesTable
    with TableInfo<$LegacyMessagesTableTable, LegacyMessagesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LegacyMessagesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recipientMeta = const VerificationMeta(
    'recipient',
  );
  @override
  late final GeneratedColumn<String> recipient = GeneratedColumn<String>(
    'recipient',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _audioPathMeta = const VerificationMeta(
    'audioPath',
  );
  @override
  late final GeneratedColumn<String> audioPath = GeneratedColumn<String>(
    'audio_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoPathMeta = const VerificationMeta(
    'videoPath',
  );
  @override
  late final GeneratedColumn<String> videoPath = GeneratedColumn<String>(
    'video_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _triggerMeta = const VerificationMeta(
    'trigger',
  );
  @override
  late final GeneratedColumn<String> trigger = GeneratedColumn<String>(
    'trigger',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deliveryRuleMeta = const VerificationMeta(
    'deliveryRule',
  );
  @override
  late final GeneratedColumn<String> deliveryRule = GeneratedColumn<String>(
    'delivery_rule',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    category,
    recipient,
    relationship,
    message,
    audioPath,
    videoPath,
    trigger,
    deliveryRule,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'legacy_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<LegacyMessagesTableData> instance, {
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
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('recipient')) {
      context.handle(
        _recipientMeta,
        recipient.isAcceptableOrUnknown(data['recipient']!, _recipientMeta),
      );
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
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('audio_path')) {
      context.handle(
        _audioPathMeta,
        audioPath.isAcceptableOrUnknown(data['audio_path']!, _audioPathMeta),
      );
    }
    if (data.containsKey('video_path')) {
      context.handle(
        _videoPathMeta,
        videoPath.isAcceptableOrUnknown(data['video_path']!, _videoPathMeta),
      );
    }
    if (data.containsKey('trigger')) {
      context.handle(
        _triggerMeta,
        trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta),
      );
    }
    if (data.containsKey('delivery_rule')) {
      context.handle(
        _deliveryRuleMeta,
        deliveryRule.isAcceptableOrUnknown(
          data['delivery_rule']!,
          _deliveryRuleMeta,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LegacyMessagesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LegacyMessagesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      recipient: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient'],
      ),
      relationship: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship'],
      ),
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      audioPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_path'],
      ),
      videoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_path'],
      ),
      trigger: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger'],
      ),
      deliveryRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}delivery_rule'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LegacyMessagesTableTable createAlias(String alias) {
    return $LegacyMessagesTableTable(attachedDatabase, alias);
  }
}

class LegacyMessagesTableData extends DataClass
    implements Insertable<LegacyMessagesTableData> {
  final int id;
  final int humanId;
  final String? category;
  final String? recipient;
  final String? relationship;
  final String? message;
  final String? audioPath;
  final String? videoPath;
  final String? trigger;
  final String? deliveryRule;
  final DateTime createdAt;
  const LegacyMessagesTableData({
    required this.id,
    required this.humanId,
    this.category,
    this.recipient,
    this.relationship,
    this.message,
    this.audioPath,
    this.videoPath,
    this.trigger,
    this.deliveryRule,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || recipient != null) {
      map['recipient'] = Variable<String>(recipient);
    }
    if (!nullToAbsent || relationship != null) {
      map['relationship'] = Variable<String>(relationship);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    if (!nullToAbsent || audioPath != null) {
      map['audio_path'] = Variable<String>(audioPath);
    }
    if (!nullToAbsent || videoPath != null) {
      map['video_path'] = Variable<String>(videoPath);
    }
    if (!nullToAbsent || trigger != null) {
      map['trigger'] = Variable<String>(trigger);
    }
    if (!nullToAbsent || deliveryRule != null) {
      map['delivery_rule'] = Variable<String>(deliveryRule);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LegacyMessagesTableCompanion toCompanion(bool nullToAbsent) {
    return LegacyMessagesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      recipient: recipient == null && nullToAbsent
          ? const Value.absent()
          : Value(recipient),
      relationship: relationship == null && nullToAbsent
          ? const Value.absent()
          : Value(relationship),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      audioPath: audioPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioPath),
      videoPath: videoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(videoPath),
      trigger: trigger == null && nullToAbsent
          ? const Value.absent()
          : Value(trigger),
      deliveryRule: deliveryRule == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryRule),
      createdAt: Value(createdAt),
    );
  }

  factory LegacyMessagesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LegacyMessagesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      category: serializer.fromJson<String?>(json['category']),
      recipient: serializer.fromJson<String?>(json['recipient']),
      relationship: serializer.fromJson<String?>(json['relationship']),
      message: serializer.fromJson<String?>(json['message']),
      audioPath: serializer.fromJson<String?>(json['audioPath']),
      videoPath: serializer.fromJson<String?>(json['videoPath']),
      trigger: serializer.fromJson<String?>(json['trigger']),
      deliveryRule: serializer.fromJson<String?>(json['deliveryRule']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'category': serializer.toJson<String?>(category),
      'recipient': serializer.toJson<String?>(recipient),
      'relationship': serializer.toJson<String?>(relationship),
      'message': serializer.toJson<String?>(message),
      'audioPath': serializer.toJson<String?>(audioPath),
      'videoPath': serializer.toJson<String?>(videoPath),
      'trigger': serializer.toJson<String?>(trigger),
      'deliveryRule': serializer.toJson<String?>(deliveryRule),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LegacyMessagesTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> category = const Value.absent(),
    Value<String?> recipient = const Value.absent(),
    Value<String?> relationship = const Value.absent(),
    Value<String?> message = const Value.absent(),
    Value<String?> audioPath = const Value.absent(),
    Value<String?> videoPath = const Value.absent(),
    Value<String?> trigger = const Value.absent(),
    Value<String?> deliveryRule = const Value.absent(),
    DateTime? createdAt,
  }) => LegacyMessagesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    category: category.present ? category.value : this.category,
    recipient: recipient.present ? recipient.value : this.recipient,
    relationship: relationship.present ? relationship.value : this.relationship,
    message: message.present ? message.value : this.message,
    audioPath: audioPath.present ? audioPath.value : this.audioPath,
    videoPath: videoPath.present ? videoPath.value : this.videoPath,
    trigger: trigger.present ? trigger.value : this.trigger,
    deliveryRule: deliveryRule.present ? deliveryRule.value : this.deliveryRule,
    createdAt: createdAt ?? this.createdAt,
  );
  LegacyMessagesTableData copyWithCompanion(LegacyMessagesTableCompanion data) {
    return LegacyMessagesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      category: data.category.present ? data.category.value : this.category,
      recipient: data.recipient.present ? data.recipient.value : this.recipient,
      relationship: data.relationship.present
          ? data.relationship.value
          : this.relationship,
      message: data.message.present ? data.message.value : this.message,
      audioPath: data.audioPath.present ? data.audioPath.value : this.audioPath,
      videoPath: data.videoPath.present ? data.videoPath.value : this.videoPath,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      deliveryRule: data.deliveryRule.present
          ? data.deliveryRule.value
          : this.deliveryRule,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LegacyMessagesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('category: $category, ')
          ..write('recipient: $recipient, ')
          ..write('relationship: $relationship, ')
          ..write('message: $message, ')
          ..write('audioPath: $audioPath, ')
          ..write('videoPath: $videoPath, ')
          ..write('trigger: $trigger, ')
          ..write('deliveryRule: $deliveryRule, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    category,
    recipient,
    relationship,
    message,
    audioPath,
    videoPath,
    trigger,
    deliveryRule,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LegacyMessagesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.category == this.category &&
          other.recipient == this.recipient &&
          other.relationship == this.relationship &&
          other.message == this.message &&
          other.audioPath == this.audioPath &&
          other.videoPath == this.videoPath &&
          other.trigger == this.trigger &&
          other.deliveryRule == this.deliveryRule &&
          other.createdAt == this.createdAt);
}

class LegacyMessagesTableCompanion
    extends UpdateCompanion<LegacyMessagesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> category;
  final Value<String?> recipient;
  final Value<String?> relationship;
  final Value<String?> message;
  final Value<String?> audioPath;
  final Value<String?> videoPath;
  final Value<String?> trigger;
  final Value<String?> deliveryRule;
  final Value<DateTime> createdAt;
  const LegacyMessagesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.category = const Value.absent(),
    this.recipient = const Value.absent(),
    this.relationship = const Value.absent(),
    this.message = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.videoPath = const Value.absent(),
    this.trigger = const Value.absent(),
    this.deliveryRule = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LegacyMessagesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.category = const Value.absent(),
    this.recipient = const Value.absent(),
    this.relationship = const Value.absent(),
    this.message = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.videoPath = const Value.absent(),
    this.trigger = const Value.absent(),
    this.deliveryRule = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<LegacyMessagesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? category,
    Expression<String>? recipient,
    Expression<String>? relationship,
    Expression<String>? message,
    Expression<String>? audioPath,
    Expression<String>? videoPath,
    Expression<String>? trigger,
    Expression<String>? deliveryRule,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (category != null) 'category': category,
      if (recipient != null) 'recipient': recipient,
      if (relationship != null) 'relationship': relationship,
      if (message != null) 'message': message,
      if (audioPath != null) 'audio_path': audioPath,
      if (videoPath != null) 'video_path': videoPath,
      if (trigger != null) 'trigger': trigger,
      if (deliveryRule != null) 'delivery_rule': deliveryRule,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LegacyMessagesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? category,
    Value<String?>? recipient,
    Value<String?>? relationship,
    Value<String?>? message,
    Value<String?>? audioPath,
    Value<String?>? videoPath,
    Value<String?>? trigger,
    Value<String?>? deliveryRule,
    Value<DateTime>? createdAt,
  }) {
    return LegacyMessagesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      category: category ?? this.category,
      recipient: recipient ?? this.recipient,
      relationship: relationship ?? this.relationship,
      message: message ?? this.message,
      audioPath: audioPath ?? this.audioPath,
      videoPath: videoPath ?? this.videoPath,
      trigger: trigger ?? this.trigger,
      deliveryRule: deliveryRule ?? this.deliveryRule,
      createdAt: createdAt ?? this.createdAt,
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (recipient.present) {
      map['recipient'] = Variable<String>(recipient.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<String>(relationship.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (audioPath.present) {
      map['audio_path'] = Variable<String>(audioPath.value);
    }
    if (videoPath.present) {
      map['video_path'] = Variable<String>(videoPath.value);
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(trigger.value);
    }
    if (deliveryRule.present) {
      map['delivery_rule'] = Variable<String>(deliveryRule.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LegacyMessagesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('category: $category, ')
          ..write('recipient: $recipient, ')
          ..write('relationship: $relationship, ')
          ..write('message: $message, ')
          ..write('audioPath: $audioPath, ')
          ..write('videoPath: $videoPath, ')
          ..write('trigger: $trigger, ')
          ..write('deliveryRule: $deliveryRule, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AiProvidersTableTable extends AiProvidersTable
    with TableInfo<$AiProvidersTableTable, AiProvidersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiProvidersTableTable(this.attachedDatabase, [this._alias]);
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
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _providerTypeMeta = const VerificationMeta(
    'providerType',
  );
  @override
  late final GeneratedColumn<String> providerType = GeneratedColumn<String>(
    'provider_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _apiKeyMeta = const VerificationMeta('apiKey');
  @override
  late final GeneratedColumn<String> apiKey = GeneratedColumn<String>(
    'api_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _baseUrlMeta = const VerificationMeta(
    'baseUrl',
  );
  @override
  late final GeneratedColumn<String> baseUrl = GeneratedColumn<String>(
    'base_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _temperatureMeta = const VerificationMeta(
    'temperature',
  );
  @override
  late final GeneratedColumn<String> temperature = GeneratedColumn<String>(
    'temperature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maxTokensMeta = const VerificationMeta(
    'maxTokens',
  );
  @override
  late final GeneratedColumn<int> maxTokens = GeneratedColumn<int>(
    'max_tokens',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timeoutMeta = const VerificationMeta(
    'timeout',
  );
  @override
  late final GeneratedColumn<int> timeout = GeneratedColumn<int>(
    'timeout',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBackupMeta = const VerificationMeta(
    'isBackup',
  );
  @override
  late final GeneratedColumn<int> isBackup = GeneratedColumn<int>(
    'is_backup',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latencyMeta = const VerificationMeta(
    'latency',
  );
  @override
  late final GeneratedColumn<int> latency = GeneratedColumn<int>(
    'latency',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalRequestsMeta = const VerificationMeta(
    'totalRequests',
  );
  @override
  late final GeneratedColumn<int> totalRequests = GeneratedColumn<int>(
    'total_requests',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalTokensMeta = const VerificationMeta(
    'totalTokens',
  );
  @override
  late final GeneratedColumn<int> totalTokens = GeneratedColumn<int>(
    'total_tokens',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalCostMeta = const VerificationMeta(
    'totalCost',
  );
  @override
  late final GeneratedColumn<String> totalCost = GeneratedColumn<String>(
    'total_cost',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _failuresMeta = const VerificationMeta(
    'failures',
  );
  @override
  late final GeneratedColumn<int> failures = GeneratedColumn<int>(
    'failures',
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
    providerType,
    apiKey,
    baseUrl,
    model,
    temperature,
    maxTokens,
    timeout,
    retryCount,
    priority,
    isBackup,
    status,
    latency,
    totalRequests,
    totalTokens,
    totalCost,
    failures,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_providers';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiProvidersTableData> instance, {
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
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('provider_type')) {
      context.handle(
        _providerTypeMeta,
        providerType.isAcceptableOrUnknown(
          data['provider_type']!,
          _providerTypeMeta,
        ),
      );
    }
    if (data.containsKey('api_key')) {
      context.handle(
        _apiKeyMeta,
        apiKey.isAcceptableOrUnknown(data['api_key']!, _apiKeyMeta),
      );
    }
    if (data.containsKey('base_url')) {
      context.handle(
        _baseUrlMeta,
        baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta),
      );
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    }
    if (data.containsKey('temperature')) {
      context.handle(
        _temperatureMeta,
        temperature.isAcceptableOrUnknown(
          data['temperature']!,
          _temperatureMeta,
        ),
      );
    }
    if (data.containsKey('max_tokens')) {
      context.handle(
        _maxTokensMeta,
        maxTokens.isAcceptableOrUnknown(data['max_tokens']!, _maxTokensMeta),
      );
    }
    if (data.containsKey('timeout')) {
      context.handle(
        _timeoutMeta,
        timeout.isAcceptableOrUnknown(data['timeout']!, _timeoutMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('is_backup')) {
      context.handle(
        _isBackupMeta,
        isBackup.isAcceptableOrUnknown(data['is_backup']!, _isBackupMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('latency')) {
      context.handle(
        _latencyMeta,
        latency.isAcceptableOrUnknown(data['latency']!, _latencyMeta),
      );
    }
    if (data.containsKey('total_requests')) {
      context.handle(
        _totalRequestsMeta,
        totalRequests.isAcceptableOrUnknown(
          data['total_requests']!,
          _totalRequestsMeta,
        ),
      );
    }
    if (data.containsKey('total_tokens')) {
      context.handle(
        _totalTokensMeta,
        totalTokens.isAcceptableOrUnknown(
          data['total_tokens']!,
          _totalTokensMeta,
        ),
      );
    }
    if (data.containsKey('total_cost')) {
      context.handle(
        _totalCostMeta,
        totalCost.isAcceptableOrUnknown(data['total_cost']!, _totalCostMeta),
      );
    }
    if (data.containsKey('failures')) {
      context.handle(
        _failuresMeta,
        failures.isAcceptableOrUnknown(data['failures']!, _failuresMeta),
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
  AiProvidersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiProvidersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      providerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_type'],
      ),
      apiKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_key'],
      ),
      baseUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_url'],
      ),
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      ),
      temperature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}temperature'],
      ),
      maxTokens: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_tokens'],
      ),
      timeout: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timeout'],
      ),
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      ),
      isBackup: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_backup'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      latency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}latency'],
      ),
      totalRequests: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_requests'],
      ),
      totalTokens: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_tokens'],
      ),
      totalCost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}total_cost'],
      ),
      failures: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}failures'],
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
  $AiProvidersTableTable createAlias(String alias) {
    return $AiProvidersTableTable(attachedDatabase, alias);
  }
}

class AiProvidersTableData extends DataClass
    implements Insertable<AiProvidersTableData> {
  final int id;
  final int? humanId;
  final String name;
  final String? providerType;
  final String? apiKey;
  final String? baseUrl;
  final String? model;
  final String? temperature;
  final int? maxTokens;
  final int? timeout;
  final int? retryCount;
  final int? priority;
  final int? isBackup;
  final String? status;
  final int? latency;
  final int? totalRequests;
  final int? totalTokens;
  final String? totalCost;
  final int? failures;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AiProvidersTableData({
    required this.id,
    this.humanId,
    required this.name,
    this.providerType,
    this.apiKey,
    this.baseUrl,
    this.model,
    this.temperature,
    this.maxTokens,
    this.timeout,
    this.retryCount,
    this.priority,
    this.isBackup,
    this.status,
    this.latency,
    this.totalRequests,
    this.totalTokens,
    this.totalCost,
    this.failures,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || humanId != null) {
      map['human_id'] = Variable<int>(humanId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || providerType != null) {
      map['provider_type'] = Variable<String>(providerType);
    }
    if (!nullToAbsent || apiKey != null) {
      map['api_key'] = Variable<String>(apiKey);
    }
    if (!nullToAbsent || baseUrl != null) {
      map['base_url'] = Variable<String>(baseUrl);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<String>(temperature);
    }
    if (!nullToAbsent || maxTokens != null) {
      map['max_tokens'] = Variable<int>(maxTokens);
    }
    if (!nullToAbsent || timeout != null) {
      map['timeout'] = Variable<int>(timeout);
    }
    if (!nullToAbsent || retryCount != null) {
      map['retry_count'] = Variable<int>(retryCount);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<int>(priority);
    }
    if (!nullToAbsent || isBackup != null) {
      map['is_backup'] = Variable<int>(isBackup);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || latency != null) {
      map['latency'] = Variable<int>(latency);
    }
    if (!nullToAbsent || totalRequests != null) {
      map['total_requests'] = Variable<int>(totalRequests);
    }
    if (!nullToAbsent || totalTokens != null) {
      map['total_tokens'] = Variable<int>(totalTokens);
    }
    if (!nullToAbsent || totalCost != null) {
      map['total_cost'] = Variable<String>(totalCost);
    }
    if (!nullToAbsent || failures != null) {
      map['failures'] = Variable<int>(failures);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AiProvidersTableCompanion toCompanion(bool nullToAbsent) {
    return AiProvidersTableCompanion(
      id: Value(id),
      humanId: humanId == null && nullToAbsent
          ? const Value.absent()
          : Value(humanId),
      name: Value(name),
      providerType: providerType == null && nullToAbsent
          ? const Value.absent()
          : Value(providerType),
      apiKey: apiKey == null && nullToAbsent
          ? const Value.absent()
          : Value(apiKey),
      baseUrl: baseUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(baseUrl),
      model: model == null && nullToAbsent
          ? const Value.absent()
          : Value(model),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      maxTokens: maxTokens == null && nullToAbsent
          ? const Value.absent()
          : Value(maxTokens),
      timeout: timeout == null && nullToAbsent
          ? const Value.absent()
          : Value(timeout),
      retryCount: retryCount == null && nullToAbsent
          ? const Value.absent()
          : Value(retryCount),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      isBackup: isBackup == null && nullToAbsent
          ? const Value.absent()
          : Value(isBackup),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      latency: latency == null && nullToAbsent
          ? const Value.absent()
          : Value(latency),
      totalRequests: totalRequests == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRequests),
      totalTokens: totalTokens == null && nullToAbsent
          ? const Value.absent()
          : Value(totalTokens),
      totalCost: totalCost == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCost),
      failures: failures == null && nullToAbsent
          ? const Value.absent()
          : Value(failures),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AiProvidersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiProvidersTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int?>(json['humanId']),
      name: serializer.fromJson<String>(json['name']),
      providerType: serializer.fromJson<String?>(json['providerType']),
      apiKey: serializer.fromJson<String?>(json['apiKey']),
      baseUrl: serializer.fromJson<String?>(json['baseUrl']),
      model: serializer.fromJson<String?>(json['model']),
      temperature: serializer.fromJson<String?>(json['temperature']),
      maxTokens: serializer.fromJson<int?>(json['maxTokens']),
      timeout: serializer.fromJson<int?>(json['timeout']),
      retryCount: serializer.fromJson<int?>(json['retryCount']),
      priority: serializer.fromJson<int?>(json['priority']),
      isBackup: serializer.fromJson<int?>(json['isBackup']),
      status: serializer.fromJson<String?>(json['status']),
      latency: serializer.fromJson<int?>(json['latency']),
      totalRequests: serializer.fromJson<int?>(json['totalRequests']),
      totalTokens: serializer.fromJson<int?>(json['totalTokens']),
      totalCost: serializer.fromJson<String?>(json['totalCost']),
      failures: serializer.fromJson<int?>(json['failures']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int?>(humanId),
      'name': serializer.toJson<String>(name),
      'providerType': serializer.toJson<String?>(providerType),
      'apiKey': serializer.toJson<String?>(apiKey),
      'baseUrl': serializer.toJson<String?>(baseUrl),
      'model': serializer.toJson<String?>(model),
      'temperature': serializer.toJson<String?>(temperature),
      'maxTokens': serializer.toJson<int?>(maxTokens),
      'timeout': serializer.toJson<int?>(timeout),
      'retryCount': serializer.toJson<int?>(retryCount),
      'priority': serializer.toJson<int?>(priority),
      'isBackup': serializer.toJson<int?>(isBackup),
      'status': serializer.toJson<String?>(status),
      'latency': serializer.toJson<int?>(latency),
      'totalRequests': serializer.toJson<int?>(totalRequests),
      'totalTokens': serializer.toJson<int?>(totalTokens),
      'totalCost': serializer.toJson<String?>(totalCost),
      'failures': serializer.toJson<int?>(failures),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AiProvidersTableData copyWith({
    int? id,
    Value<int?> humanId = const Value.absent(),
    String? name,
    Value<String?> providerType = const Value.absent(),
    Value<String?> apiKey = const Value.absent(),
    Value<String?> baseUrl = const Value.absent(),
    Value<String?> model = const Value.absent(),
    Value<String?> temperature = const Value.absent(),
    Value<int?> maxTokens = const Value.absent(),
    Value<int?> timeout = const Value.absent(),
    Value<int?> retryCount = const Value.absent(),
    Value<int?> priority = const Value.absent(),
    Value<int?> isBackup = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<int?> latency = const Value.absent(),
    Value<int?> totalRequests = const Value.absent(),
    Value<int?> totalTokens = const Value.absent(),
    Value<String?> totalCost = const Value.absent(),
    Value<int?> failures = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AiProvidersTableData(
    id: id ?? this.id,
    humanId: humanId.present ? humanId.value : this.humanId,
    name: name ?? this.name,
    providerType: providerType.present ? providerType.value : this.providerType,
    apiKey: apiKey.present ? apiKey.value : this.apiKey,
    baseUrl: baseUrl.present ? baseUrl.value : this.baseUrl,
    model: model.present ? model.value : this.model,
    temperature: temperature.present ? temperature.value : this.temperature,
    maxTokens: maxTokens.present ? maxTokens.value : this.maxTokens,
    timeout: timeout.present ? timeout.value : this.timeout,
    retryCount: retryCount.present ? retryCount.value : this.retryCount,
    priority: priority.present ? priority.value : this.priority,
    isBackup: isBackup.present ? isBackup.value : this.isBackup,
    status: status.present ? status.value : this.status,
    latency: latency.present ? latency.value : this.latency,
    totalRequests: totalRequests.present
        ? totalRequests.value
        : this.totalRequests,
    totalTokens: totalTokens.present ? totalTokens.value : this.totalTokens,
    totalCost: totalCost.present ? totalCost.value : this.totalCost,
    failures: failures.present ? failures.value : this.failures,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AiProvidersTableData copyWithCompanion(AiProvidersTableCompanion data) {
    return AiProvidersTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      name: data.name.present ? data.name.value : this.name,
      providerType: data.providerType.present
          ? data.providerType.value
          : this.providerType,
      apiKey: data.apiKey.present ? data.apiKey.value : this.apiKey,
      baseUrl: data.baseUrl.present ? data.baseUrl.value : this.baseUrl,
      model: data.model.present ? data.model.value : this.model,
      temperature: data.temperature.present
          ? data.temperature.value
          : this.temperature,
      maxTokens: data.maxTokens.present ? data.maxTokens.value : this.maxTokens,
      timeout: data.timeout.present ? data.timeout.value : this.timeout,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      priority: data.priority.present ? data.priority.value : this.priority,
      isBackup: data.isBackup.present ? data.isBackup.value : this.isBackup,
      status: data.status.present ? data.status.value : this.status,
      latency: data.latency.present ? data.latency.value : this.latency,
      totalRequests: data.totalRequests.present
          ? data.totalRequests.value
          : this.totalRequests,
      totalTokens: data.totalTokens.present
          ? data.totalTokens.value
          : this.totalTokens,
      totalCost: data.totalCost.present ? data.totalCost.value : this.totalCost,
      failures: data.failures.present ? data.failures.value : this.failures,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiProvidersTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('providerType: $providerType, ')
          ..write('apiKey: $apiKey, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('model: $model, ')
          ..write('temperature: $temperature, ')
          ..write('maxTokens: $maxTokens, ')
          ..write('timeout: $timeout, ')
          ..write('retryCount: $retryCount, ')
          ..write('priority: $priority, ')
          ..write('isBackup: $isBackup, ')
          ..write('status: $status, ')
          ..write('latency: $latency, ')
          ..write('totalRequests: $totalRequests, ')
          ..write('totalTokens: $totalTokens, ')
          ..write('totalCost: $totalCost, ')
          ..write('failures: $failures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    humanId,
    name,
    providerType,
    apiKey,
    baseUrl,
    model,
    temperature,
    maxTokens,
    timeout,
    retryCount,
    priority,
    isBackup,
    status,
    latency,
    totalRequests,
    totalTokens,
    totalCost,
    failures,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiProvidersTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.name == this.name &&
          other.providerType == this.providerType &&
          other.apiKey == this.apiKey &&
          other.baseUrl == this.baseUrl &&
          other.model == this.model &&
          other.temperature == this.temperature &&
          other.maxTokens == this.maxTokens &&
          other.timeout == this.timeout &&
          other.retryCount == this.retryCount &&
          other.priority == this.priority &&
          other.isBackup == this.isBackup &&
          other.status == this.status &&
          other.latency == this.latency &&
          other.totalRequests == this.totalRequests &&
          other.totalTokens == this.totalTokens &&
          other.totalCost == this.totalCost &&
          other.failures == this.failures &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AiProvidersTableCompanion extends UpdateCompanion<AiProvidersTableData> {
  final Value<int> id;
  final Value<int?> humanId;
  final Value<String> name;
  final Value<String?> providerType;
  final Value<String?> apiKey;
  final Value<String?> baseUrl;
  final Value<String?> model;
  final Value<String?> temperature;
  final Value<int?> maxTokens;
  final Value<int?> timeout;
  final Value<int?> retryCount;
  final Value<int?> priority;
  final Value<int?> isBackup;
  final Value<String?> status;
  final Value<int?> latency;
  final Value<int?> totalRequests;
  final Value<int?> totalTokens;
  final Value<String?> totalCost;
  final Value<int?> failures;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AiProvidersTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.name = const Value.absent(),
    this.providerType = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.model = const Value.absent(),
    this.temperature = const Value.absent(),
    this.maxTokens = const Value.absent(),
    this.timeout = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.priority = const Value.absent(),
    this.isBackup = const Value.absent(),
    this.status = const Value.absent(),
    this.latency = const Value.absent(),
    this.totalRequests = const Value.absent(),
    this.totalTokens = const Value.absent(),
    this.totalCost = const Value.absent(),
    this.failures = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AiProvidersTableCompanion.insert({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    required String name,
    this.providerType = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.model = const Value.absent(),
    this.temperature = const Value.absent(),
    this.maxTokens = const Value.absent(),
    this.timeout = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.priority = const Value.absent(),
    this.isBackup = const Value.absent(),
    this.status = const Value.absent(),
    this.latency = const Value.absent(),
    this.totalRequests = const Value.absent(),
    this.totalTokens = const Value.absent(),
    this.totalCost = const Value.absent(),
    this.failures = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AiProvidersTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? name,
    Expression<String>? providerType,
    Expression<String>? apiKey,
    Expression<String>? baseUrl,
    Expression<String>? model,
    Expression<String>? temperature,
    Expression<int>? maxTokens,
    Expression<int>? timeout,
    Expression<int>? retryCount,
    Expression<int>? priority,
    Expression<int>? isBackup,
    Expression<String>? status,
    Expression<int>? latency,
    Expression<int>? totalRequests,
    Expression<int>? totalTokens,
    Expression<String>? totalCost,
    Expression<int>? failures,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (name != null) 'name': name,
      if (providerType != null) 'provider_type': providerType,
      if (apiKey != null) 'api_key': apiKey,
      if (baseUrl != null) 'base_url': baseUrl,
      if (model != null) 'model': model,
      if (temperature != null) 'temperature': temperature,
      if (maxTokens != null) 'max_tokens': maxTokens,
      if (timeout != null) 'timeout': timeout,
      if (retryCount != null) 'retry_count': retryCount,
      if (priority != null) 'priority': priority,
      if (isBackup != null) 'is_backup': isBackup,
      if (status != null) 'status': status,
      if (latency != null) 'latency': latency,
      if (totalRequests != null) 'total_requests': totalRequests,
      if (totalTokens != null) 'total_tokens': totalTokens,
      if (totalCost != null) 'total_cost': totalCost,
      if (failures != null) 'failures': failures,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AiProvidersTableCompanion copyWith({
    Value<int>? id,
    Value<int?>? humanId,
    Value<String>? name,
    Value<String?>? providerType,
    Value<String?>? apiKey,
    Value<String?>? baseUrl,
    Value<String?>? model,
    Value<String?>? temperature,
    Value<int?>? maxTokens,
    Value<int?>? timeout,
    Value<int?>? retryCount,
    Value<int?>? priority,
    Value<int?>? isBackup,
    Value<String?>? status,
    Value<int?>? latency,
    Value<int?>? totalRequests,
    Value<int?>? totalTokens,
    Value<String?>? totalCost,
    Value<int?>? failures,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return AiProvidersTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      name: name ?? this.name,
      providerType: providerType ?? this.providerType,
      apiKey: apiKey ?? this.apiKey,
      baseUrl: baseUrl ?? this.baseUrl,
      model: model ?? this.model,
      temperature: temperature ?? this.temperature,
      maxTokens: maxTokens ?? this.maxTokens,
      timeout: timeout ?? this.timeout,
      retryCount: retryCount ?? this.retryCount,
      priority: priority ?? this.priority,
      isBackup: isBackup ?? this.isBackup,
      status: status ?? this.status,
      latency: latency ?? this.latency,
      totalRequests: totalRequests ?? this.totalRequests,
      totalTokens: totalTokens ?? this.totalTokens,
      totalCost: totalCost ?? this.totalCost,
      failures: failures ?? this.failures,
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
    if (providerType.present) {
      map['provider_type'] = Variable<String>(providerType.value);
    }
    if (apiKey.present) {
      map['api_key'] = Variable<String>(apiKey.value);
    }
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<String>(temperature.value);
    }
    if (maxTokens.present) {
      map['max_tokens'] = Variable<int>(maxTokens.value);
    }
    if (timeout.present) {
      map['timeout'] = Variable<int>(timeout.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (isBackup.present) {
      map['is_backup'] = Variable<int>(isBackup.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (latency.present) {
      map['latency'] = Variable<int>(latency.value);
    }
    if (totalRequests.present) {
      map['total_requests'] = Variable<int>(totalRequests.value);
    }
    if (totalTokens.present) {
      map['total_tokens'] = Variable<int>(totalTokens.value);
    }
    if (totalCost.present) {
      map['total_cost'] = Variable<String>(totalCost.value);
    }
    if (failures.present) {
      map['failures'] = Variable<int>(failures.value);
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
    return (StringBuffer('AiProvidersTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('name: $name, ')
          ..write('providerType: $providerType, ')
          ..write('apiKey: $apiKey, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('model: $model, ')
          ..write('temperature: $temperature, ')
          ..write('maxTokens: $maxTokens, ')
          ..write('timeout: $timeout, ')
          ..write('retryCount: $retryCount, ')
          ..write('priority: $priority, ')
          ..write('isBackup: $isBackup, ')
          ..write('status: $status, ')
          ..write('latency: $latency, ')
          ..write('totalRequests: $totalRequests, ')
          ..write('totalTokens: $totalTokens, ')
          ..write('totalCost: $totalCost, ')
          ..write('failures: $failures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AiSettingsTableTable extends AiSettingsTable
    with TableInfo<$AiSettingsTableTable, AiSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiSettingsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
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
    key,
    value,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiSettingsTableData> instance, {
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
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
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
  AiSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
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
  $AiSettingsTableTable createAlias(String alias) {
    return $AiSettingsTableTable(attachedDatabase, alias);
  }
}

class AiSettingsTableData extends DataClass
    implements Insertable<AiSettingsTableData> {
  final int id;
  final int humanId;
  final String key;
  final String? value;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AiSettingsTableData({
    required this.id,
    required this.humanId,
    required this.key,
    this.value,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AiSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AiSettingsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      key: Value(key),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AiSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String?>(json['value']),
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
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String?>(value),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AiSettingsTableData copyWith({
    int? id,
    int? humanId,
    String? key,
    Value<String?> value = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AiSettingsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    key: key ?? this.key,
    value: value.present ? value.value : this.value,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AiSettingsTableData copyWithCompanion(AiSettingsTableCompanion data) {
    return AiSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiSettingsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, humanId, key, value, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiSettingsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.key == this.key &&
          other.value == this.value &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AiSettingsTableCompanion extends UpdateCompanion<AiSettingsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> key;
  final Value<String?> value;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AiSettingsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AiSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String key,
    this.value = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : humanId = Value(humanId),
       key = Value(key),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AiSettingsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AiSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? key,
    Value<String?>? value,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return AiSettingsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      key: key ?? this.key,
      value: value ?? this.value,
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
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
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
    return (StringBuffer('AiSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AvatarsTableTable extends AvatarsTable
    with TableInfo<$AvatarsTableTable, AvatarsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AvatarsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
    'style',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expressionMeta = const VerificationMeta(
    'expression',
  );
  @override
  late final GeneratedColumn<String> expression = GeneratedColumn<String>(
    'expression',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<int> isDefault = GeneratedColumn<int>(
    'is_default',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    filePath,
    style,
    expression,
    isDefault,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'avatars';
  @override
  VerificationContext validateIntegrity(
    Insertable<AvatarsTableData> instance, {
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
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('style')) {
      context.handle(
        _styleMeta,
        style.isAcceptableOrUnknown(data['style']!, _styleMeta),
      );
    }
    if (data.containsKey('expression')) {
      context.handle(
        _expressionMeta,
        expression.isAcceptableOrUnknown(data['expression']!, _expressionMeta),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AvatarsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AvatarsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      style: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}style'],
      ),
      expression: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expression'],
      ),
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_default'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AvatarsTableTable createAlias(String alias) {
    return $AvatarsTableTable(attachedDatabase, alias);
  }
}

class AvatarsTableData extends DataClass
    implements Insertable<AvatarsTableData> {
  final int id;
  final int humanId;
  final String? filePath;
  final String? style;
  final String? expression;
  final int? isDefault;
  final DateTime createdAt;
  const AvatarsTableData({
    required this.id,
    required this.humanId,
    this.filePath,
    this.style,
    this.expression,
    this.isDefault,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || style != null) {
      map['style'] = Variable<String>(style);
    }
    if (!nullToAbsent || expression != null) {
      map['expression'] = Variable<String>(expression);
    }
    if (!nullToAbsent || isDefault != null) {
      map['is_default'] = Variable<int>(isDefault);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AvatarsTableCompanion toCompanion(bool nullToAbsent) {
    return AvatarsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      style: style == null && nullToAbsent
          ? const Value.absent()
          : Value(style),
      expression: expression == null && nullToAbsent
          ? const Value.absent()
          : Value(expression),
      isDefault: isDefault == null && nullToAbsent
          ? const Value.absent()
          : Value(isDefault),
      createdAt: Value(createdAt),
    );
  }

  factory AvatarsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AvatarsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      style: serializer.fromJson<String?>(json['style']),
      expression: serializer.fromJson<String?>(json['expression']),
      isDefault: serializer.fromJson<int?>(json['isDefault']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'filePath': serializer.toJson<String?>(filePath),
      'style': serializer.toJson<String?>(style),
      'expression': serializer.toJson<String?>(expression),
      'isDefault': serializer.toJson<int?>(isDefault),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AvatarsTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> filePath = const Value.absent(),
    Value<String?> style = const Value.absent(),
    Value<String?> expression = const Value.absent(),
    Value<int?> isDefault = const Value.absent(),
    DateTime? createdAt,
  }) => AvatarsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    filePath: filePath.present ? filePath.value : this.filePath,
    style: style.present ? style.value : this.style,
    expression: expression.present ? expression.value : this.expression,
    isDefault: isDefault.present ? isDefault.value : this.isDefault,
    createdAt: createdAt ?? this.createdAt,
  );
  AvatarsTableData copyWithCompanion(AvatarsTableCompanion data) {
    return AvatarsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      style: data.style.present ? data.style.value : this.style,
      expression: data.expression.present
          ? data.expression.value
          : this.expression,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AvatarsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('filePath: $filePath, ')
          ..write('style: $style, ')
          ..write('expression: $expression, ')
          ..write('isDefault: $isDefault, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    filePath,
    style,
    expression,
    isDefault,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AvatarsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.filePath == this.filePath &&
          other.style == this.style &&
          other.expression == this.expression &&
          other.isDefault == this.isDefault &&
          other.createdAt == this.createdAt);
}

class AvatarsTableCompanion extends UpdateCompanion<AvatarsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> filePath;
  final Value<String?> style;
  final Value<String?> expression;
  final Value<int?> isDefault;
  final Value<DateTime> createdAt;
  const AvatarsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.style = const Value.absent(),
    this.expression = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AvatarsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.filePath = const Value.absent(),
    this.style = const Value.absent(),
    this.expression = const Value.absent(),
    this.isDefault = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<AvatarsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? filePath,
    Expression<String>? style,
    Expression<String>? expression,
    Expression<int>? isDefault,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (filePath != null) 'file_path': filePath,
      if (style != null) 'style': style,
      if (expression != null) 'expression': expression,
      if (isDefault != null) 'is_default': isDefault,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AvatarsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? filePath,
    Value<String?>? style,
    Value<String?>? expression,
    Value<int?>? isDefault,
    Value<DateTime>? createdAt,
  }) {
    return AvatarsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      filePath: filePath ?? this.filePath,
      style: style ?? this.style,
      expression: expression ?? this.expression,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
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
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (expression.present) {
      map['expression'] = Variable<String>(expression.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<int>(isDefault.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AvatarsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('filePath: $filePath, ')
          ..write('style: $style, ')
          ..write('expression: $expression, ')
          ..write('isDefault: $isDefault, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ChatHistoryTableTable extends ChatHistoryTable
    with TableInfo<$ChatHistoryTableTable, ChatHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatHistoryTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attachmentsMeta = const VerificationMeta(
    'attachments',
  );
  @override
  late final GeneratedColumn<String> attachments = GeneratedColumn<String>(
    'attachments',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourcesMeta = const VerificationMeta(
    'sources',
  );
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
    'sources',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    role,
    message,
    attachments,
    sources,
    provider,
    model,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatHistoryTableData> instance, {
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
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('attachments')) {
      context.handle(
        _attachmentsMeta,
        attachments.isAcceptableOrUnknown(
          data['attachments']!,
          _attachmentsMeta,
        ),
      );
    }
    if (data.containsKey('sources')) {
      context.handle(
        _sourcesMeta,
        sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta),
      );
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatHistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      attachments: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachments'],
      ),
      sources: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sources'],
      ),
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      ),
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ChatHistoryTableTable createAlias(String alias) {
    return $ChatHistoryTableTable(attachedDatabase, alias);
  }
}

class ChatHistoryTableData extends DataClass
    implements Insertable<ChatHistoryTableData> {
  final int id;
  final int humanId;
  final String role;
  final String message;
  final String? attachments;
  final String? sources;
  final String? provider;
  final String? model;
  final DateTime createdAt;
  const ChatHistoryTableData({
    required this.id,
    required this.humanId,
    required this.role,
    required this.message,
    this.attachments,
    this.sources,
    this.provider,
    this.model,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['role'] = Variable<String>(role);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || attachments != null) {
      map['attachments'] = Variable<String>(attachments);
    }
    if (!nullToAbsent || sources != null) {
      map['sources'] = Variable<String>(sources);
    }
    if (!nullToAbsent || provider != null) {
      map['provider'] = Variable<String>(provider);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChatHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return ChatHistoryTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      role: Value(role),
      message: Value(message),
      attachments: attachments == null && nullToAbsent
          ? const Value.absent()
          : Value(attachments),
      sources: sources == null && nullToAbsent
          ? const Value.absent()
          : Value(sources),
      provider: provider == null && nullToAbsent
          ? const Value.absent()
          : Value(provider),
      model: model == null && nullToAbsent
          ? const Value.absent()
          : Value(model),
      createdAt: Value(createdAt),
    );
  }

  factory ChatHistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      role: serializer.fromJson<String>(json['role']),
      message: serializer.fromJson<String>(json['message']),
      attachments: serializer.fromJson<String?>(json['attachments']),
      sources: serializer.fromJson<String?>(json['sources']),
      provider: serializer.fromJson<String?>(json['provider']),
      model: serializer.fromJson<String?>(json['model']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'role': serializer.toJson<String>(role),
      'message': serializer.toJson<String>(message),
      'attachments': serializer.toJson<String?>(attachments),
      'sources': serializer.toJson<String?>(sources),
      'provider': serializer.toJson<String?>(provider),
      'model': serializer.toJson<String?>(model),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ChatHistoryTableData copyWith({
    int? id,
    int? humanId,
    String? role,
    String? message,
    Value<String?> attachments = const Value.absent(),
    Value<String?> sources = const Value.absent(),
    Value<String?> provider = const Value.absent(),
    Value<String?> model = const Value.absent(),
    DateTime? createdAt,
  }) => ChatHistoryTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    role: role ?? this.role,
    message: message ?? this.message,
    attachments: attachments.present ? attachments.value : this.attachments,
    sources: sources.present ? sources.value : this.sources,
    provider: provider.present ? provider.value : this.provider,
    model: model.present ? model.value : this.model,
    createdAt: createdAt ?? this.createdAt,
  );
  ChatHistoryTableData copyWithCompanion(ChatHistoryTableCompanion data) {
    return ChatHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      role: data.role.present ? data.role.value : this.role,
      message: data.message.present ? data.message.value : this.message,
      attachments: data.attachments.present
          ? data.attachments.value
          : this.attachments,
      sources: data.sources.present ? data.sources.value : this.sources,
      provider: data.provider.present ? data.provider.value : this.provider,
      model: data.model.present ? data.model.value : this.model,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('role: $role, ')
          ..write('message: $message, ')
          ..write('attachments: $attachments, ')
          ..write('sources: $sources, ')
          ..write('provider: $provider, ')
          ..write('model: $model, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    role,
    message,
    attachments,
    sources,
    provider,
    model,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatHistoryTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.role == this.role &&
          other.message == this.message &&
          other.attachments == this.attachments &&
          other.sources == this.sources &&
          other.provider == this.provider &&
          other.model == this.model &&
          other.createdAt == this.createdAt);
}

class ChatHistoryTableCompanion extends UpdateCompanion<ChatHistoryTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> role;
  final Value<String> message;
  final Value<String?> attachments;
  final Value<String?> sources;
  final Value<String?> provider;
  final Value<String?> model;
  final Value<DateTime> createdAt;
  const ChatHistoryTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.role = const Value.absent(),
    this.message = const Value.absent(),
    this.attachments = const Value.absent(),
    this.sources = const Value.absent(),
    this.provider = const Value.absent(),
    this.model = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChatHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String role,
    required String message,
    this.attachments = const Value.absent(),
    this.sources = const Value.absent(),
    this.provider = const Value.absent(),
    this.model = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       role = Value(role),
       message = Value(message),
       createdAt = Value(createdAt);
  static Insertable<ChatHistoryTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? role,
    Expression<String>? message,
    Expression<String>? attachments,
    Expression<String>? sources,
    Expression<String>? provider,
    Expression<String>? model,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (role != null) 'role': role,
      if (message != null) 'message': message,
      if (attachments != null) 'attachments': attachments,
      if (sources != null) 'sources': sources,
      if (provider != null) 'provider': provider,
      if (model != null) 'model': model,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChatHistoryTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? role,
    Value<String>? message,
    Value<String?>? attachments,
    Value<String?>? sources,
    Value<String?>? provider,
    Value<String?>? model,
    Value<DateTime>? createdAt,
  }) {
    return ChatHistoryTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      role: role ?? this.role,
      message: message ?? this.message,
      attachments: attachments ?? this.attachments,
      sources: sources ?? this.sources,
      provider: provider ?? this.provider,
      model: model ?? this.model,
      createdAt: createdAt ?? this.createdAt,
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
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (attachments.present) {
      map['attachments'] = Variable<String>(attachments.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('role: $role, ')
          ..write('message: $message, ')
          ..write('attachments: $attachments, ')
          ..write('sources: $sources, ')
          ..write('provider: $provider, ')
          ..write('model: $model, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LifePlacesTableTable extends LifePlacesTable
    with TableInfo<$LifePlacesTableTable, LifePlacesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LifePlacesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _placeNameMeta = const VerificationMeta(
    'placeName',
  );
  @override
  late final GeneratedColumn<String> placeName = GeneratedColumn<String>(
    'place_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<String> latitude = GeneratedColumn<String>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<String> longitude = GeneratedColumn<String>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    humanId,
    type,
    placeName,
    latitude,
    longitude,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'life_places';
  @override
  VerificationContext validateIntegrity(
    Insertable<LifePlacesTableData> instance, {
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
    if (data.containsKey('place_name')) {
      context.handle(
        _placeNameMeta,
        placeName.isAcceptableOrUnknown(data['place_name']!, _placeNameMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LifePlacesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LifePlacesTableData(
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
      placeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_name'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}longitude'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LifePlacesTableTable createAlias(String alias) {
    return $LifePlacesTableTable(attachedDatabase, alias);
  }
}

class LifePlacesTableData extends DataClass
    implements Insertable<LifePlacesTableData> {
  final int id;
  final int humanId;
  final String? type;
  final String? placeName;
  final String? latitude;
  final String? longitude;
  final String? description;
  final DateTime createdAt;
  const LifePlacesTableData({
    required this.id,
    required this.humanId,
    this.type,
    this.placeName,
    this.latitude,
    this.longitude,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || placeName != null) {
      map['place_name'] = Variable<String>(placeName);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String>(longitude);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LifePlacesTableCompanion toCompanion(bool nullToAbsent) {
    return LifePlacesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      placeName: placeName == null && nullToAbsent
          ? const Value.absent()
          : Value(placeName),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory LifePlacesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LifePlacesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      type: serializer.fromJson<String?>(json['type']),
      placeName: serializer.fromJson<String?>(json['placeName']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      longitude: serializer.fromJson<String?>(json['longitude']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'type': serializer.toJson<String?>(type),
      'placeName': serializer.toJson<String?>(placeName),
      'latitude': serializer.toJson<String?>(latitude),
      'longitude': serializer.toJson<String?>(longitude),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LifePlacesTableData copyWith({
    int? id,
    int? humanId,
    Value<String?> type = const Value.absent(),
    Value<String?> placeName = const Value.absent(),
    Value<String?> latitude = const Value.absent(),
    Value<String?> longitude = const Value.absent(),
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => LifePlacesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    type: type.present ? type.value : this.type,
    placeName: placeName.present ? placeName.value : this.placeName,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  LifePlacesTableData copyWithCompanion(LifePlacesTableCompanion data) {
    return LifePlacesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      type: data.type.present ? data.type.value : this.type,
      placeName: data.placeName.present ? data.placeName.value : this.placeName,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LifePlacesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('placeName: $placeName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    humanId,
    type,
    placeName,
    latitude,
    longitude,
    description,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LifePlacesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.type == this.type &&
          other.placeName == this.placeName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class LifePlacesTableCompanion extends UpdateCompanion<LifePlacesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String?> type;
  final Value<String?> placeName;
  final Value<String?> latitude;
  final Value<String?> longitude;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  const LifePlacesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.type = const Value.absent(),
    this.placeName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LifePlacesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    this.type = const Value.absent(),
    this.placeName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       createdAt = Value(createdAt);
  static Insertable<LifePlacesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? type,
    Expression<String>? placeName,
    Expression<String>? latitude,
    Expression<String>? longitude,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (type != null) 'type': type,
      if (placeName != null) 'place_name': placeName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LifePlacesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String?>? type,
    Value<String?>? placeName,
    Value<String?>? latitude,
    Value<String?>? longitude,
    Value<String?>? description,
    Value<DateTime>? createdAt,
  }) {
    return LifePlacesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      type: type ?? this.type,
      placeName: placeName ?? this.placeName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
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
    if (placeName.present) {
      map['place_name'] = Variable<String>(placeName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String>(longitude.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LifePlacesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('placeName: $placeName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FavoriteQuotesTableTable extends FavoriteQuotesTable
    with TableInfo<$FavoriteQuotesTableTable, FavoriteQuotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteQuotesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _quoteMeta = const VerificationMeta('quote');
  @override
  late final GeneratedColumn<String> quote = GeneratedColumn<String>(
    'quote',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, humanId, quote, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_quotes';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteQuotesTableData> instance, {
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
    if (data.containsKey('quote')) {
      context.handle(
        _quoteMeta,
        quote.isAcceptableOrUnknown(data['quote']!, _quoteMeta),
      );
    } else if (isInserting) {
      context.missing(_quoteMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteQuotesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteQuotesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      quote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FavoriteQuotesTableTable createAlias(String alias) {
    return $FavoriteQuotesTableTable(attachedDatabase, alias);
  }
}

class FavoriteQuotesTableData extends DataClass
    implements Insertable<FavoriteQuotesTableData> {
  final int id;
  final int humanId;
  final String quote;
  final DateTime createdAt;
  const FavoriteQuotesTableData({
    required this.id,
    required this.humanId,
    required this.quote,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['quote'] = Variable<String>(quote);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoriteQuotesTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteQuotesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      quote: Value(quote),
      createdAt: Value(createdAt),
    );
  }

  factory FavoriteQuotesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteQuotesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      quote: serializer.fromJson<String>(json['quote']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'quote': serializer.toJson<String>(quote),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoriteQuotesTableData copyWith({
    int? id,
    int? humanId,
    String? quote,
    DateTime? createdAt,
  }) => FavoriteQuotesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    quote: quote ?? this.quote,
    createdAt: createdAt ?? this.createdAt,
  );
  FavoriteQuotesTableData copyWithCompanion(FavoriteQuotesTableCompanion data) {
    return FavoriteQuotesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      quote: data.quote.present ? data.quote.value : this.quote,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteQuotesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('quote: $quote, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, humanId, quote, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteQuotesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.quote == this.quote &&
          other.createdAt == this.createdAt);
}

class FavoriteQuotesTableCompanion
    extends UpdateCompanion<FavoriteQuotesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> quote;
  final Value<DateTime> createdAt;
  const FavoriteQuotesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.quote = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoriteQuotesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String quote,
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       quote = Value(quote),
       createdAt = Value(createdAt);
  static Insertable<FavoriteQuotesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? quote,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (quote != null) 'quote': quote,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoriteQuotesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? quote,
    Value<DateTime>? createdAt,
  }) {
    return FavoriteQuotesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      quote: quote ?? this.quote,
      createdAt: createdAt ?? this.createdAt,
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
    if (quote.present) {
      map['quote'] = Variable<String>(quote.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteQuotesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('quote: $quote, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FavoriteWordsTableTable extends FavoriteWordsTable
    with TableInfo<$FavoriteWordsTableTable, FavoriteWordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteWordsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, humanId, word, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_words';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteWordsTableData> instance, {
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
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteWordsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteWordsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      humanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}human_id'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FavoriteWordsTableTable createAlias(String alias) {
    return $FavoriteWordsTableTable(attachedDatabase, alias);
  }
}

class FavoriteWordsTableData extends DataClass
    implements Insertable<FavoriteWordsTableData> {
  final int id;
  final int humanId;
  final String word;
  final DateTime createdAt;
  const FavoriteWordsTableData({
    required this.id,
    required this.humanId,
    required this.word,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['word'] = Variable<String>(word);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoriteWordsTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteWordsTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      word: Value(word),
      createdAt: Value(createdAt),
    );
  }

  factory FavoriteWordsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteWordsTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      word: serializer.fromJson<String>(json['word']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'word': serializer.toJson<String>(word),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoriteWordsTableData copyWith({
    int? id,
    int? humanId,
    String? word,
    DateTime? createdAt,
  }) => FavoriteWordsTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    word: word ?? this.word,
    createdAt: createdAt ?? this.createdAt,
  );
  FavoriteWordsTableData copyWithCompanion(FavoriteWordsTableCompanion data) {
    return FavoriteWordsTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      word: data.word.present ? data.word.value : this.word,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteWordsTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('word: $word, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, humanId, word, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteWordsTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.word == this.word &&
          other.createdAt == this.createdAt);
}

class FavoriteWordsTableCompanion
    extends UpdateCompanion<FavoriteWordsTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> word;
  final Value<DateTime> createdAt;
  const FavoriteWordsTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.word = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoriteWordsTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String word,
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       word = Value(word),
       createdAt = Value(createdAt);
  static Insertable<FavoriteWordsTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? word,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (word != null) 'word': word,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoriteWordsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? word,
    Value<DateTime>? createdAt,
  }) {
    return FavoriteWordsTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      word: word ?? this.word,
      createdAt: createdAt ?? this.createdAt,
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
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteWordsTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('word: $word, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTableTable extends FavoritesTable
    with TableInfo<$FavoritesTableTable, FavoritesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTableTable(this.attachedDatabase, [this._alias]);
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, humanId, type, value, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoritesTableData> instance, {
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
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoritesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritesTableData(
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
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FavoritesTableTable createAlias(String alias) {
    return $FavoritesTableTable(attachedDatabase, alias);
  }
}

class FavoritesTableData extends DataClass
    implements Insertable<FavoritesTableData> {
  final int id;
  final int humanId;
  final String type;
  final String value;
  final DateTime createdAt;
  const FavoritesTableData({
    required this.id,
    required this.humanId,
    required this.type,
    required this.value,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['human_id'] = Variable<int>(humanId);
    map['type'] = Variable<String>(type);
    map['value'] = Variable<String>(value);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritesTableCompanion toCompanion(bool nullToAbsent) {
    return FavoritesTableCompanion(
      id: Value(id),
      humanId: Value(humanId),
      type: Value(type),
      value: Value(value),
      createdAt: Value(createdAt),
    );
  }

  factory FavoritesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritesTableData(
      id: serializer.fromJson<int>(json['id']),
      humanId: serializer.fromJson<int>(json['humanId']),
      type: serializer.fromJson<String>(json['type']),
      value: serializer.fromJson<String>(json['value']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'humanId': serializer.toJson<int>(humanId),
      'type': serializer.toJson<String>(type),
      'value': serializer.toJson<String>(value),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoritesTableData copyWith({
    int? id,
    int? humanId,
    String? type,
    String? value,
    DateTime? createdAt,
  }) => FavoritesTableData(
    id: id ?? this.id,
    humanId: humanId ?? this.humanId,
    type: type ?? this.type,
    value: value ?? this.value,
    createdAt: createdAt ?? this.createdAt,
  );
  FavoritesTableData copyWithCompanion(FavoritesTableCompanion data) {
    return FavoritesTableData(
      id: data.id.present ? data.id.value : this.id,
      humanId: data.humanId.present ? data.humanId.value : this.humanId,
      type: data.type.present ? data.type.value : this.type,
      value: data.value.present ? data.value.value : this.value,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesTableData(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, humanId, type, value, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritesTableData &&
          other.id == this.id &&
          other.humanId == this.humanId &&
          other.type == this.type &&
          other.value == this.value &&
          other.createdAt == this.createdAt);
}

class FavoritesTableCompanion extends UpdateCompanion<FavoritesTableData> {
  final Value<int> id;
  final Value<int> humanId;
  final Value<String> type;
  final Value<String> value;
  final Value<DateTime> createdAt;
  const FavoritesTableCompanion({
    this.id = const Value.absent(),
    this.humanId = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoritesTableCompanion.insert({
    this.id = const Value.absent(),
    required int humanId,
    required String type,
    required String value,
    required DateTime createdAt,
  }) : humanId = Value(humanId),
       type = Value(type),
       value = Value(value),
       createdAt = Value(createdAt);
  static Insertable<FavoritesTableData> custom({
    Expression<int>? id,
    Expression<int>? humanId,
    Expression<String>? type,
    Expression<String>? value,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (humanId != null) 'human_id': humanId,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoritesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? humanId,
    Value<String>? type,
    Value<String>? value,
    Value<DateTime>? createdAt,
  }) {
    return FavoritesTableCompanion(
      id: id ?? this.id,
      humanId: humanId ?? this.humanId,
      type: type ?? this.type,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
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
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesTableCompanion(')
          ..write('id: $id, ')
          ..write('humanId: $humanId, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt')
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
  late final $SkillsTableTable skillsTable = $SkillsTableTable(this);
  late final $LanguagesTableTable languagesTable = $LanguagesTableTable(this);
  late final $InterestsTableTable interestsTable = $InterestsTableTable(this);
  late final $GoalsTableTable goalsTable = $GoalsTableTable(this);
  late final $PersonalityTraitsTableTable personalityTraitsTable =
      $PersonalityTraitsTableTable(this);
  late final $ConversationStylesTableTable conversationStylesTable =
      $ConversationStylesTableTable(this);
  late final $DailyHabitsTableTable dailyHabitsTable = $DailyHabitsTableTable(
    this,
  );
  late final $ValuesBeliefsTableTable valuesBeliefsTable =
      $ValuesBeliefsTableTable(this);
  late final $DecisionProfilesTableTable decisionProfilesTable =
      $DecisionProfilesTableTable(this);
  late final $LifeStoriesTableTable lifeStoriesTable = $LifeStoriesTableTable(
    this,
  );
  late final $TimelineTableTable timelineTable = $TimelineTableTable(this);
  late final $DailyJournalsTableTable dailyJournalsTable =
      $DailyJournalsTableTable(this);
  late final $MemoriesTableTable memoriesTable = $MemoriesTableTable(this);
  late final $MemoryTagsTableTable memoryTagsTable = $MemoryTagsTableTable(
    this,
  );
  late final $MemoryLinksTableTable memoryLinksTable = $MemoryLinksTableTable(
    this,
  );
  late final $PhotosTableTable photosTable = $PhotosTableTable(this);
  late final $PhotoAlbumsTableTable photoAlbumsTable = $PhotoAlbumsTableTable(
    this,
  );
  late final $DocumentsTableTable documentsTable = $DocumentsTableTable(this);
  late final $AudioFilesTableTable audioFilesTable = $AudioFilesTableTable(
    this,
  );
  late final $VoiceSettingsTableTable voiceSettingsTable =
      $VoiceSettingsTableTable(this);
  late final $LegacyMessagesTableTable legacyMessagesTable =
      $LegacyMessagesTableTable(this);
  late final $AiProvidersTableTable aiProvidersTable = $AiProvidersTableTable(
    this,
  );
  late final $AiSettingsTableTable aiSettingsTable = $AiSettingsTableTable(
    this,
  );
  late final $AvatarsTableTable avatarsTable = $AvatarsTableTable(this);
  late final $ChatHistoryTableTable chatHistoryTable = $ChatHistoryTableTable(
    this,
  );
  late final $LifePlacesTableTable lifePlacesTable = $LifePlacesTableTable(
    this,
  );
  late final $FavoriteQuotesTableTable favoriteQuotesTable =
      $FavoriteQuotesTableTable(this);
  late final $FavoriteWordsTableTable favoriteWordsTable =
      $FavoriteWordsTableTable(this);
  late final $FavoritesTableTable favoritesTable = $FavoritesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    humansTable,
    familyMembersTable,
    educationTable,
    careerHistoryTable,
    skillsTable,
    languagesTable,
    interestsTable,
    goalsTable,
    personalityTraitsTable,
    conversationStylesTable,
    dailyHabitsTable,
    valuesBeliefsTable,
    decisionProfilesTable,
    lifeStoriesTable,
    timelineTable,
    dailyJournalsTable,
    memoriesTable,
    memoryTagsTable,
    memoryLinksTable,
    photosTable,
    photoAlbumsTable,
    documentsTable,
    audioFilesTable,
    voiceSettingsTable,
    legacyMessagesTable,
    aiProvidersTable,
    aiSettingsTable,
    avatarsTable,
    chatHistoryTable,
    lifePlacesTable,
    favoriteQuotesTable,
    favoriteWordsTable,
    favoritesTable,
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
typedef $$SkillsTableTableCreateCompanionBuilder =
    SkillsTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String name,
      required DateTime createdAt,
    });
typedef $$SkillsTableTableUpdateCompanionBuilder =
    SkillsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> name,
      Value<DateTime> createdAt,
    });

class $$SkillsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SkillsTableTable> {
  $$SkillsTableTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SkillsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SkillsTableTable> {
  $$SkillsTableTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SkillsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SkillsTableTable> {
  $$SkillsTableTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SkillsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SkillsTableTable,
          SkillsTableData,
          $$SkillsTableTableFilterComposer,
          $$SkillsTableTableOrderingComposer,
          $$SkillsTableTableAnnotationComposer,
          $$SkillsTableTableCreateCompanionBuilder,
          $$SkillsTableTableUpdateCompanionBuilder,
          (
            SkillsTableData,
            BaseReferences<_$AppDatabase, $SkillsTableTable, SkillsTableData>,
          ),
          SkillsTableData,
          PrefetchHooks Function()
        > {
  $$SkillsTableTableTableManager(_$AppDatabase db, $SkillsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SkillsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SkillsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SkillsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SkillsTableCompanion(
                id: id,
                humanId: humanId,
                name: name,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String name,
                required DateTime createdAt,
              }) => SkillsTableCompanion.insert(
                id: id,
                humanId: humanId,
                name: name,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SkillsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SkillsTableTable,
      SkillsTableData,
      $$SkillsTableTableFilterComposer,
      $$SkillsTableTableOrderingComposer,
      $$SkillsTableTableAnnotationComposer,
      $$SkillsTableTableCreateCompanionBuilder,
      $$SkillsTableTableUpdateCompanionBuilder,
      (
        SkillsTableData,
        BaseReferences<_$AppDatabase, $SkillsTableTable, SkillsTableData>,
      ),
      SkillsTableData,
      PrefetchHooks Function()
    >;
typedef $$LanguagesTableTableCreateCompanionBuilder =
    LanguagesTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String language,
      Value<int?> readingRating,
      Value<int?> writingRating,
      Value<int?> speakingRating,
      required DateTime createdAt,
    });
typedef $$LanguagesTableTableUpdateCompanionBuilder =
    LanguagesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> language,
      Value<int?> readingRating,
      Value<int?> writingRating,
      Value<int?> speakingRating,
      Value<DateTime> createdAt,
    });

class $$LanguagesTableTableFilterComposer
    extends Composer<_$AppDatabase, $LanguagesTableTable> {
  $$LanguagesTableTableFilterComposer({
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

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readingRating => $composableBuilder(
    column: $table.readingRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get writingRating => $composableBuilder(
    column: $table.writingRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get speakingRating => $composableBuilder(
    column: $table.speakingRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LanguagesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LanguagesTableTable> {
  $$LanguagesTableTableOrderingComposer({
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

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readingRating => $composableBuilder(
    column: $table.readingRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get writingRating => $composableBuilder(
    column: $table.writingRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get speakingRating => $composableBuilder(
    column: $table.speakingRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LanguagesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LanguagesTableTable> {
  $$LanguagesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<int> get readingRating => $composableBuilder(
    column: $table.readingRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get writingRating => $composableBuilder(
    column: $table.writingRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get speakingRating => $composableBuilder(
    column: $table.speakingRating,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LanguagesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LanguagesTableTable,
          LanguagesTableData,
          $$LanguagesTableTableFilterComposer,
          $$LanguagesTableTableOrderingComposer,
          $$LanguagesTableTableAnnotationComposer,
          $$LanguagesTableTableCreateCompanionBuilder,
          $$LanguagesTableTableUpdateCompanionBuilder,
          (
            LanguagesTableData,
            BaseReferences<
              _$AppDatabase,
              $LanguagesTableTable,
              LanguagesTableData
            >,
          ),
          LanguagesTableData,
          PrefetchHooks Function()
        > {
  $$LanguagesTableTableTableManager(
    _$AppDatabase db,
    $LanguagesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LanguagesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LanguagesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LanguagesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<int?> readingRating = const Value.absent(),
                Value<int?> writingRating = const Value.absent(),
                Value<int?> speakingRating = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LanguagesTableCompanion(
                id: id,
                humanId: humanId,
                language: language,
                readingRating: readingRating,
                writingRating: writingRating,
                speakingRating: speakingRating,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String language,
                Value<int?> readingRating = const Value.absent(),
                Value<int?> writingRating = const Value.absent(),
                Value<int?> speakingRating = const Value.absent(),
                required DateTime createdAt,
              }) => LanguagesTableCompanion.insert(
                id: id,
                humanId: humanId,
                language: language,
                readingRating: readingRating,
                writingRating: writingRating,
                speakingRating: speakingRating,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LanguagesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LanguagesTableTable,
      LanguagesTableData,
      $$LanguagesTableTableFilterComposer,
      $$LanguagesTableTableOrderingComposer,
      $$LanguagesTableTableAnnotationComposer,
      $$LanguagesTableTableCreateCompanionBuilder,
      $$LanguagesTableTableUpdateCompanionBuilder,
      (
        LanguagesTableData,
        BaseReferences<_$AppDatabase, $LanguagesTableTable, LanguagesTableData>,
      ),
      LanguagesTableData,
      PrefetchHooks Function()
    >;
typedef $$InterestsTableTableCreateCompanionBuilder =
    InterestsTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String name,
      required DateTime createdAt,
    });
typedef $$InterestsTableTableUpdateCompanionBuilder =
    InterestsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> name,
      Value<DateTime> createdAt,
    });

class $$InterestsTableTableFilterComposer
    extends Composer<_$AppDatabase, $InterestsTableTable> {
  $$InterestsTableTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InterestsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InterestsTableTable> {
  $$InterestsTableTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InterestsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InterestsTableTable> {
  $$InterestsTableTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$InterestsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InterestsTableTable,
          InterestsTableData,
          $$InterestsTableTableFilterComposer,
          $$InterestsTableTableOrderingComposer,
          $$InterestsTableTableAnnotationComposer,
          $$InterestsTableTableCreateCompanionBuilder,
          $$InterestsTableTableUpdateCompanionBuilder,
          (
            InterestsTableData,
            BaseReferences<
              _$AppDatabase,
              $InterestsTableTable,
              InterestsTableData
            >,
          ),
          InterestsTableData,
          PrefetchHooks Function()
        > {
  $$InterestsTableTableTableManager(
    _$AppDatabase db,
    $InterestsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InterestsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InterestsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InterestsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => InterestsTableCompanion(
                id: id,
                humanId: humanId,
                name: name,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String name,
                required DateTime createdAt,
              }) => InterestsTableCompanion.insert(
                id: id,
                humanId: humanId,
                name: name,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InterestsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InterestsTableTable,
      InterestsTableData,
      $$InterestsTableTableFilterComposer,
      $$InterestsTableTableOrderingComposer,
      $$InterestsTableTableAnnotationComposer,
      $$InterestsTableTableCreateCompanionBuilder,
      $$InterestsTableTableUpdateCompanionBuilder,
      (
        InterestsTableData,
        BaseReferences<_$AppDatabase, $InterestsTableTable, InterestsTableData>,
      ),
      InterestsTableData,
      PrefetchHooks Function()
    >;
typedef $$GoalsTableTableCreateCompanionBuilder =
    GoalsTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> type,
      Value<String?> description,
      required DateTime createdAt,
    });
typedef $$GoalsTableTableUpdateCompanionBuilder =
    GoalsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> type,
      Value<String?> description,
      Value<DateTime> createdAt,
    });

class $$GoalsTableTableFilterComposer
    extends Composer<_$AppDatabase, $GoalsTableTable> {
  $$GoalsTableTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GoalsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTableTable> {
  $$GoalsTableTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GoalsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTableTable> {
  $$GoalsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$GoalsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTableTable,
          GoalsTableData,
          $$GoalsTableTableFilterComposer,
          $$GoalsTableTableOrderingComposer,
          $$GoalsTableTableAnnotationComposer,
          $$GoalsTableTableCreateCompanionBuilder,
          $$GoalsTableTableUpdateCompanionBuilder,
          (
            GoalsTableData,
            BaseReferences<_$AppDatabase, $GoalsTableTable, GoalsTableData>,
          ),
          GoalsTableData,
          PrefetchHooks Function()
        > {
  $$GoalsTableTableTableManager(_$AppDatabase db, $GoalsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GoalsTableCompanion(
                id: id,
                humanId: humanId,
                type: type,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required DateTime createdAt,
              }) => GoalsTableCompanion.insert(
                id: id,
                humanId: humanId,
                type: type,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GoalsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTableTable,
      GoalsTableData,
      $$GoalsTableTableFilterComposer,
      $$GoalsTableTableOrderingComposer,
      $$GoalsTableTableAnnotationComposer,
      $$GoalsTableTableCreateCompanionBuilder,
      $$GoalsTableTableUpdateCompanionBuilder,
      (
        GoalsTableData,
        BaseReferences<_$AppDatabase, $GoalsTableTable, GoalsTableData>,
      ),
      GoalsTableData,
      PrefetchHooks Function()
    >;
typedef $$PersonalityTraitsTableTableCreateCompanionBuilder =
    PersonalityTraitsTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<int?> kindness,
      Value<int?> patience,
      Value<int?> leadership,
      Value<int?> confidence,
      Value<int?> humor,
      Value<int?> creativity,
      Value<int?> optimism,
      Value<int?> discipline,
      Value<int?> curiosity,
      Value<int?> emotional,
      Value<String?> speakingStyle,
      required DateTime createdAt,
    });
typedef $$PersonalityTraitsTableTableUpdateCompanionBuilder =
    PersonalityTraitsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<int?> kindness,
      Value<int?> patience,
      Value<int?> leadership,
      Value<int?> confidence,
      Value<int?> humor,
      Value<int?> creativity,
      Value<int?> optimism,
      Value<int?> discipline,
      Value<int?> curiosity,
      Value<int?> emotional,
      Value<String?> speakingStyle,
      Value<DateTime> createdAt,
    });

class $$PersonalityTraitsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PersonalityTraitsTableTable> {
  $$PersonalityTraitsTableTableFilterComposer({
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

  ColumnFilters<int> get kindness => $composableBuilder(
    column: $table.kindness,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get patience => $composableBuilder(
    column: $table.patience,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get humor => $composableBuilder(
    column: $table.humor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creativity => $composableBuilder(
    column: $table.creativity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get optimism => $composableBuilder(
    column: $table.optimism,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get curiosity => $composableBuilder(
    column: $table.curiosity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get emotional => $composableBuilder(
    column: $table.emotional,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speakingStyle => $composableBuilder(
    column: $table.speakingStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonalityTraitsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonalityTraitsTableTable> {
  $$PersonalityTraitsTableTableOrderingComposer({
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

  ColumnOrderings<int> get kindness => $composableBuilder(
    column: $table.kindness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get patience => $composableBuilder(
    column: $table.patience,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get humor => $composableBuilder(
    column: $table.humor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creativity => $composableBuilder(
    column: $table.creativity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get optimism => $composableBuilder(
    column: $table.optimism,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get curiosity => $composableBuilder(
    column: $table.curiosity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get emotional => $composableBuilder(
    column: $table.emotional,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speakingStyle => $composableBuilder(
    column: $table.speakingStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonalityTraitsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonalityTraitsTableTable> {
  $$PersonalityTraitsTableTableAnnotationComposer({
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

  GeneratedColumn<int> get kindness =>
      $composableBuilder(column: $table.kindness, builder: (column) => column);

  GeneratedColumn<int> get patience =>
      $composableBuilder(column: $table.patience, builder: (column) => column);

  GeneratedColumn<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => column,
  );

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get humor =>
      $composableBuilder(column: $table.humor, builder: (column) => column);

  GeneratedColumn<int> get creativity => $composableBuilder(
    column: $table.creativity,
    builder: (column) => column,
  );

  GeneratedColumn<int> get optimism =>
      $composableBuilder(column: $table.optimism, builder: (column) => column);

  GeneratedColumn<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => column,
  );

  GeneratedColumn<int> get curiosity =>
      $composableBuilder(column: $table.curiosity, builder: (column) => column);

  GeneratedColumn<int> get emotional =>
      $composableBuilder(column: $table.emotional, builder: (column) => column);

  GeneratedColumn<String> get speakingStyle => $composableBuilder(
    column: $table.speakingStyle,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PersonalityTraitsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonalityTraitsTableTable,
          PersonalityTraitsTableData,
          $$PersonalityTraitsTableTableFilterComposer,
          $$PersonalityTraitsTableTableOrderingComposer,
          $$PersonalityTraitsTableTableAnnotationComposer,
          $$PersonalityTraitsTableTableCreateCompanionBuilder,
          $$PersonalityTraitsTableTableUpdateCompanionBuilder,
          (
            PersonalityTraitsTableData,
            BaseReferences<
              _$AppDatabase,
              $PersonalityTraitsTableTable,
              PersonalityTraitsTableData
            >,
          ),
          PersonalityTraitsTableData,
          PrefetchHooks Function()
        > {
  $$PersonalityTraitsTableTableTableManager(
    _$AppDatabase db,
    $PersonalityTraitsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonalityTraitsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PersonalityTraitsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PersonalityTraitsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<int?> kindness = const Value.absent(),
                Value<int?> patience = const Value.absent(),
                Value<int?> leadership = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<int?> humor = const Value.absent(),
                Value<int?> creativity = const Value.absent(),
                Value<int?> optimism = const Value.absent(),
                Value<int?> discipline = const Value.absent(),
                Value<int?> curiosity = const Value.absent(),
                Value<int?> emotional = const Value.absent(),
                Value<String?> speakingStyle = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PersonalityTraitsTableCompanion(
                id: id,
                humanId: humanId,
                kindness: kindness,
                patience: patience,
                leadership: leadership,
                confidence: confidence,
                humor: humor,
                creativity: creativity,
                optimism: optimism,
                discipline: discipline,
                curiosity: curiosity,
                emotional: emotional,
                speakingStyle: speakingStyle,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<int?> kindness = const Value.absent(),
                Value<int?> patience = const Value.absent(),
                Value<int?> leadership = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<int?> humor = const Value.absent(),
                Value<int?> creativity = const Value.absent(),
                Value<int?> optimism = const Value.absent(),
                Value<int?> discipline = const Value.absent(),
                Value<int?> curiosity = const Value.absent(),
                Value<int?> emotional = const Value.absent(),
                Value<String?> speakingStyle = const Value.absent(),
                required DateTime createdAt,
              }) => PersonalityTraitsTableCompanion.insert(
                id: id,
                humanId: humanId,
                kindness: kindness,
                patience: patience,
                leadership: leadership,
                confidence: confidence,
                humor: humor,
                creativity: creativity,
                optimism: optimism,
                discipline: discipline,
                curiosity: curiosity,
                emotional: emotional,
                speakingStyle: speakingStyle,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonalityTraitsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonalityTraitsTableTable,
      PersonalityTraitsTableData,
      $$PersonalityTraitsTableTableFilterComposer,
      $$PersonalityTraitsTableTableOrderingComposer,
      $$PersonalityTraitsTableTableAnnotationComposer,
      $$PersonalityTraitsTableTableCreateCompanionBuilder,
      $$PersonalityTraitsTableTableUpdateCompanionBuilder,
      (
        PersonalityTraitsTableData,
        BaseReferences<
          _$AppDatabase,
          $PersonalityTraitsTableTable,
          PersonalityTraitsTableData
        >,
      ),
      PersonalityTraitsTableData,
      PrefetchHooks Function()
    >;
typedef $$ConversationStylesTableTableCreateCompanionBuilder =
    ConversationStylesTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> tone,
      Value<int?> storyTeller,
      Value<int?> teacherMode,
      Value<int?> motivational,
      Value<String?> replyLength,
      Value<String?> emojiUsage,
      Value<String?> localLanguage,
      Value<String?> proverbs,
      Value<String?> quotes,
      Value<String?> religiousExpressions,
      Value<String?> favoriteGreetings,
      Value<String?> signatureClosing,
      required DateTime createdAt,
    });
typedef $$ConversationStylesTableTableUpdateCompanionBuilder =
    ConversationStylesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> tone,
      Value<int?> storyTeller,
      Value<int?> teacherMode,
      Value<int?> motivational,
      Value<String?> replyLength,
      Value<String?> emojiUsage,
      Value<String?> localLanguage,
      Value<String?> proverbs,
      Value<String?> quotes,
      Value<String?> religiousExpressions,
      Value<String?> favoriteGreetings,
      Value<String?> signatureClosing,
      Value<DateTime> createdAt,
    });

class $$ConversationStylesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ConversationStylesTableTable> {
  $$ConversationStylesTableTableFilterComposer({
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

  ColumnFilters<String> get tone => $composableBuilder(
    column: $table.tone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get storyTeller => $composableBuilder(
    column: $table.storyTeller,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get teacherMode => $composableBuilder(
    column: $table.teacherMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get motivational => $composableBuilder(
    column: $table.motivational,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get replyLength => $composableBuilder(
    column: $table.replyLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emojiUsage => $composableBuilder(
    column: $table.emojiUsage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localLanguage => $composableBuilder(
    column: $table.localLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get proverbs => $composableBuilder(
    column: $table.proverbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quotes => $composableBuilder(
    column: $table.quotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get religiousExpressions => $composableBuilder(
    column: $table.religiousExpressions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get favoriteGreetings => $composableBuilder(
    column: $table.favoriteGreetings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signatureClosing => $composableBuilder(
    column: $table.signatureClosing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConversationStylesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ConversationStylesTableTable> {
  $$ConversationStylesTableTableOrderingComposer({
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

  ColumnOrderings<String> get tone => $composableBuilder(
    column: $table.tone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get storyTeller => $composableBuilder(
    column: $table.storyTeller,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get teacherMode => $composableBuilder(
    column: $table.teacherMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get motivational => $composableBuilder(
    column: $table.motivational,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get replyLength => $composableBuilder(
    column: $table.replyLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emojiUsage => $composableBuilder(
    column: $table.emojiUsage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localLanguage => $composableBuilder(
    column: $table.localLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get proverbs => $composableBuilder(
    column: $table.proverbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quotes => $composableBuilder(
    column: $table.quotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get religiousExpressions => $composableBuilder(
    column: $table.religiousExpressions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get favoriteGreetings => $composableBuilder(
    column: $table.favoriteGreetings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signatureClosing => $composableBuilder(
    column: $table.signatureClosing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConversationStylesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConversationStylesTableTable> {
  $$ConversationStylesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get tone =>
      $composableBuilder(column: $table.tone, builder: (column) => column);

  GeneratedColumn<int> get storyTeller => $composableBuilder(
    column: $table.storyTeller,
    builder: (column) => column,
  );

  GeneratedColumn<int> get teacherMode => $composableBuilder(
    column: $table.teacherMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get motivational => $composableBuilder(
    column: $table.motivational,
    builder: (column) => column,
  );

  GeneratedColumn<String> get replyLength => $composableBuilder(
    column: $table.replyLength,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emojiUsage => $composableBuilder(
    column: $table.emojiUsage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localLanguage => $composableBuilder(
    column: $table.localLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get proverbs =>
      $composableBuilder(column: $table.proverbs, builder: (column) => column);

  GeneratedColumn<String> get quotes =>
      $composableBuilder(column: $table.quotes, builder: (column) => column);

  GeneratedColumn<String> get religiousExpressions => $composableBuilder(
    column: $table.religiousExpressions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get favoriteGreetings => $composableBuilder(
    column: $table.favoriteGreetings,
    builder: (column) => column,
  );

  GeneratedColumn<String> get signatureClosing => $composableBuilder(
    column: $table.signatureClosing,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ConversationStylesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConversationStylesTableTable,
          ConversationStylesTableData,
          $$ConversationStylesTableTableFilterComposer,
          $$ConversationStylesTableTableOrderingComposer,
          $$ConversationStylesTableTableAnnotationComposer,
          $$ConversationStylesTableTableCreateCompanionBuilder,
          $$ConversationStylesTableTableUpdateCompanionBuilder,
          (
            ConversationStylesTableData,
            BaseReferences<
              _$AppDatabase,
              $ConversationStylesTableTable,
              ConversationStylesTableData
            >,
          ),
          ConversationStylesTableData,
          PrefetchHooks Function()
        > {
  $$ConversationStylesTableTableTableManager(
    _$AppDatabase db,
    $ConversationStylesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversationStylesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ConversationStylesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ConversationStylesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> tone = const Value.absent(),
                Value<int?> storyTeller = const Value.absent(),
                Value<int?> teacherMode = const Value.absent(),
                Value<int?> motivational = const Value.absent(),
                Value<String?> replyLength = const Value.absent(),
                Value<String?> emojiUsage = const Value.absent(),
                Value<String?> localLanguage = const Value.absent(),
                Value<String?> proverbs = const Value.absent(),
                Value<String?> quotes = const Value.absent(),
                Value<String?> religiousExpressions = const Value.absent(),
                Value<String?> favoriteGreetings = const Value.absent(),
                Value<String?> signatureClosing = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ConversationStylesTableCompanion(
                id: id,
                humanId: humanId,
                tone: tone,
                storyTeller: storyTeller,
                teacherMode: teacherMode,
                motivational: motivational,
                replyLength: replyLength,
                emojiUsage: emojiUsage,
                localLanguage: localLanguage,
                proverbs: proverbs,
                quotes: quotes,
                religiousExpressions: religiousExpressions,
                favoriteGreetings: favoriteGreetings,
                signatureClosing: signatureClosing,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> tone = const Value.absent(),
                Value<int?> storyTeller = const Value.absent(),
                Value<int?> teacherMode = const Value.absent(),
                Value<int?> motivational = const Value.absent(),
                Value<String?> replyLength = const Value.absent(),
                Value<String?> emojiUsage = const Value.absent(),
                Value<String?> localLanguage = const Value.absent(),
                Value<String?> proverbs = const Value.absent(),
                Value<String?> quotes = const Value.absent(),
                Value<String?> religiousExpressions = const Value.absent(),
                Value<String?> favoriteGreetings = const Value.absent(),
                Value<String?> signatureClosing = const Value.absent(),
                required DateTime createdAt,
              }) => ConversationStylesTableCompanion.insert(
                id: id,
                humanId: humanId,
                tone: tone,
                storyTeller: storyTeller,
                teacherMode: teacherMode,
                motivational: motivational,
                replyLength: replyLength,
                emojiUsage: emojiUsage,
                localLanguage: localLanguage,
                proverbs: proverbs,
                quotes: quotes,
                religiousExpressions: religiousExpressions,
                favoriteGreetings: favoriteGreetings,
                signatureClosing: signatureClosing,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConversationStylesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConversationStylesTableTable,
      ConversationStylesTableData,
      $$ConversationStylesTableTableFilterComposer,
      $$ConversationStylesTableTableOrderingComposer,
      $$ConversationStylesTableTableAnnotationComposer,
      $$ConversationStylesTableTableCreateCompanionBuilder,
      $$ConversationStylesTableTableUpdateCompanionBuilder,
      (
        ConversationStylesTableData,
        BaseReferences<
          _$AppDatabase,
          $ConversationStylesTableTable,
          ConversationStylesTableData
        >,
      ),
      ConversationStylesTableData,
      PrefetchHooks Function()
    >;
typedef $$DailyHabitsTableTableCreateCompanionBuilder =
    DailyHabitsTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> wakeTime,
      Value<String?> sleepTime,
      Value<String?> prayer,
      Value<String?> exercise,
      Value<String?> reading,
      Value<String?> coding,
      Value<String?> teaCoffee,
      Value<String?> smokingAlcohol,
      Value<String?> meditationWalking,
      Value<String?> customHabits,
      required DateTime createdAt,
    });
typedef $$DailyHabitsTableTableUpdateCompanionBuilder =
    DailyHabitsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> wakeTime,
      Value<String?> sleepTime,
      Value<String?> prayer,
      Value<String?> exercise,
      Value<String?> reading,
      Value<String?> coding,
      Value<String?> teaCoffee,
      Value<String?> smokingAlcohol,
      Value<String?> meditationWalking,
      Value<String?> customHabits,
      Value<DateTime> createdAt,
    });

class $$DailyHabitsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DailyHabitsTableTable> {
  $$DailyHabitsTableTableFilterComposer({
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

  ColumnFilters<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sleepTime => $composableBuilder(
    column: $table.sleepTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prayer => $composableBuilder(
    column: $table.prayer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reading => $composableBuilder(
    column: $table.reading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coding => $composableBuilder(
    column: $table.coding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teaCoffee => $composableBuilder(
    column: $table.teaCoffee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smokingAlcohol => $composableBuilder(
    column: $table.smokingAlcohol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meditationWalking => $composableBuilder(
    column: $table.meditationWalking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customHabits => $composableBuilder(
    column: $table.customHabits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyHabitsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyHabitsTableTable> {
  $$DailyHabitsTableTableOrderingComposer({
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

  ColumnOrderings<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sleepTime => $composableBuilder(
    column: $table.sleepTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prayer => $composableBuilder(
    column: $table.prayer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reading => $composableBuilder(
    column: $table.reading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coding => $composableBuilder(
    column: $table.coding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teaCoffee => $composableBuilder(
    column: $table.teaCoffee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smokingAlcohol => $composableBuilder(
    column: $table.smokingAlcohol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meditationWalking => $composableBuilder(
    column: $table.meditationWalking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customHabits => $composableBuilder(
    column: $table.customHabits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyHabitsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyHabitsTableTable> {
  $$DailyHabitsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get wakeTime =>
      $composableBuilder(column: $table.wakeTime, builder: (column) => column);

  GeneratedColumn<String> get sleepTime =>
      $composableBuilder(column: $table.sleepTime, builder: (column) => column);

  GeneratedColumn<String> get prayer =>
      $composableBuilder(column: $table.prayer, builder: (column) => column);

  GeneratedColumn<String> get exercise =>
      $composableBuilder(column: $table.exercise, builder: (column) => column);

  GeneratedColumn<String> get reading =>
      $composableBuilder(column: $table.reading, builder: (column) => column);

  GeneratedColumn<String> get coding =>
      $composableBuilder(column: $table.coding, builder: (column) => column);

  GeneratedColumn<String> get teaCoffee =>
      $composableBuilder(column: $table.teaCoffee, builder: (column) => column);

  GeneratedColumn<String> get smokingAlcohol => $composableBuilder(
    column: $table.smokingAlcohol,
    builder: (column) => column,
  );

  GeneratedColumn<String> get meditationWalking => $composableBuilder(
    column: $table.meditationWalking,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customHabits => $composableBuilder(
    column: $table.customHabits,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DailyHabitsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyHabitsTableTable,
          DailyHabitsTableData,
          $$DailyHabitsTableTableFilterComposer,
          $$DailyHabitsTableTableOrderingComposer,
          $$DailyHabitsTableTableAnnotationComposer,
          $$DailyHabitsTableTableCreateCompanionBuilder,
          $$DailyHabitsTableTableUpdateCompanionBuilder,
          (
            DailyHabitsTableData,
            BaseReferences<
              _$AppDatabase,
              $DailyHabitsTableTable,
              DailyHabitsTableData
            >,
          ),
          DailyHabitsTableData,
          PrefetchHooks Function()
        > {
  $$DailyHabitsTableTableTableManager(
    _$AppDatabase db,
    $DailyHabitsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyHabitsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyHabitsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyHabitsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> wakeTime = const Value.absent(),
                Value<String?> sleepTime = const Value.absent(),
                Value<String?> prayer = const Value.absent(),
                Value<String?> exercise = const Value.absent(),
                Value<String?> reading = const Value.absent(),
                Value<String?> coding = const Value.absent(),
                Value<String?> teaCoffee = const Value.absent(),
                Value<String?> smokingAlcohol = const Value.absent(),
                Value<String?> meditationWalking = const Value.absent(),
                Value<String?> customHabits = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DailyHabitsTableCompanion(
                id: id,
                humanId: humanId,
                wakeTime: wakeTime,
                sleepTime: sleepTime,
                prayer: prayer,
                exercise: exercise,
                reading: reading,
                coding: coding,
                teaCoffee: teaCoffee,
                smokingAlcohol: smokingAlcohol,
                meditationWalking: meditationWalking,
                customHabits: customHabits,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> wakeTime = const Value.absent(),
                Value<String?> sleepTime = const Value.absent(),
                Value<String?> prayer = const Value.absent(),
                Value<String?> exercise = const Value.absent(),
                Value<String?> reading = const Value.absent(),
                Value<String?> coding = const Value.absent(),
                Value<String?> teaCoffee = const Value.absent(),
                Value<String?> smokingAlcohol = const Value.absent(),
                Value<String?> meditationWalking = const Value.absent(),
                Value<String?> customHabits = const Value.absent(),
                required DateTime createdAt,
              }) => DailyHabitsTableCompanion.insert(
                id: id,
                humanId: humanId,
                wakeTime: wakeTime,
                sleepTime: sleepTime,
                prayer: prayer,
                exercise: exercise,
                reading: reading,
                coding: coding,
                teaCoffee: teaCoffee,
                smokingAlcohol: smokingAlcohol,
                meditationWalking: meditationWalking,
                customHabits: customHabits,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyHabitsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyHabitsTableTable,
      DailyHabitsTableData,
      $$DailyHabitsTableTableFilterComposer,
      $$DailyHabitsTableTableOrderingComposer,
      $$DailyHabitsTableTableAnnotationComposer,
      $$DailyHabitsTableTableCreateCompanionBuilder,
      $$DailyHabitsTableTableUpdateCompanionBuilder,
      (
        DailyHabitsTableData,
        BaseReferences<
          _$AppDatabase,
          $DailyHabitsTableTable,
          DailyHabitsTableData
        >,
      ),
      DailyHabitsTableData,
      PrefetchHooks Function()
    >;
typedef $$ValuesBeliefsTableTableCreateCompanionBuilder =
    ValuesBeliefsTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> religion,
      Value<String?> coreValues,
      Value<String?> lifePrinciples,
      Value<String?> ethics,
      Value<String?> thingsNeverDo,
      Value<String?> thingsAlwaysDo,
      Value<String?> politicalPreference,
      required DateTime createdAt,
    });
typedef $$ValuesBeliefsTableTableUpdateCompanionBuilder =
    ValuesBeliefsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> religion,
      Value<String?> coreValues,
      Value<String?> lifePrinciples,
      Value<String?> ethics,
      Value<String?> thingsNeverDo,
      Value<String?> thingsAlwaysDo,
      Value<String?> politicalPreference,
      Value<DateTime> createdAt,
    });

class $$ValuesBeliefsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ValuesBeliefsTableTable> {
  $$ValuesBeliefsTableTableFilterComposer({
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

  ColumnFilters<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coreValues => $composableBuilder(
    column: $table.coreValues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifePrinciples => $composableBuilder(
    column: $table.lifePrinciples,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ethics => $composableBuilder(
    column: $table.ethics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thingsNeverDo => $composableBuilder(
    column: $table.thingsNeverDo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thingsAlwaysDo => $composableBuilder(
    column: $table.thingsAlwaysDo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get politicalPreference => $composableBuilder(
    column: $table.politicalPreference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ValuesBeliefsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ValuesBeliefsTableTable> {
  $$ValuesBeliefsTableTableOrderingComposer({
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

  ColumnOrderings<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coreValues => $composableBuilder(
    column: $table.coreValues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifePrinciples => $composableBuilder(
    column: $table.lifePrinciples,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ethics => $composableBuilder(
    column: $table.ethics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thingsNeverDo => $composableBuilder(
    column: $table.thingsNeverDo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thingsAlwaysDo => $composableBuilder(
    column: $table.thingsAlwaysDo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get politicalPreference => $composableBuilder(
    column: $table.politicalPreference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ValuesBeliefsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ValuesBeliefsTableTable> {
  $$ValuesBeliefsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get religion =>
      $composableBuilder(column: $table.religion, builder: (column) => column);

  GeneratedColumn<String> get coreValues => $composableBuilder(
    column: $table.coreValues,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lifePrinciples => $composableBuilder(
    column: $table.lifePrinciples,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ethics =>
      $composableBuilder(column: $table.ethics, builder: (column) => column);

  GeneratedColumn<String> get thingsNeverDo => $composableBuilder(
    column: $table.thingsNeverDo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thingsAlwaysDo => $composableBuilder(
    column: $table.thingsAlwaysDo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get politicalPreference => $composableBuilder(
    column: $table.politicalPreference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ValuesBeliefsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ValuesBeliefsTableTable,
          ValuesBeliefsTableData,
          $$ValuesBeliefsTableTableFilterComposer,
          $$ValuesBeliefsTableTableOrderingComposer,
          $$ValuesBeliefsTableTableAnnotationComposer,
          $$ValuesBeliefsTableTableCreateCompanionBuilder,
          $$ValuesBeliefsTableTableUpdateCompanionBuilder,
          (
            ValuesBeliefsTableData,
            BaseReferences<
              _$AppDatabase,
              $ValuesBeliefsTableTable,
              ValuesBeliefsTableData
            >,
          ),
          ValuesBeliefsTableData,
          PrefetchHooks Function()
        > {
  $$ValuesBeliefsTableTableTableManager(
    _$AppDatabase db,
    $ValuesBeliefsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ValuesBeliefsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ValuesBeliefsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ValuesBeliefsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> religion = const Value.absent(),
                Value<String?> coreValues = const Value.absent(),
                Value<String?> lifePrinciples = const Value.absent(),
                Value<String?> ethics = const Value.absent(),
                Value<String?> thingsNeverDo = const Value.absent(),
                Value<String?> thingsAlwaysDo = const Value.absent(),
                Value<String?> politicalPreference = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ValuesBeliefsTableCompanion(
                id: id,
                humanId: humanId,
                religion: religion,
                coreValues: coreValues,
                lifePrinciples: lifePrinciples,
                ethics: ethics,
                thingsNeverDo: thingsNeverDo,
                thingsAlwaysDo: thingsAlwaysDo,
                politicalPreference: politicalPreference,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> religion = const Value.absent(),
                Value<String?> coreValues = const Value.absent(),
                Value<String?> lifePrinciples = const Value.absent(),
                Value<String?> ethics = const Value.absent(),
                Value<String?> thingsNeverDo = const Value.absent(),
                Value<String?> thingsAlwaysDo = const Value.absent(),
                Value<String?> politicalPreference = const Value.absent(),
                required DateTime createdAt,
              }) => ValuesBeliefsTableCompanion.insert(
                id: id,
                humanId: humanId,
                religion: religion,
                coreValues: coreValues,
                lifePrinciples: lifePrinciples,
                ethics: ethics,
                thingsNeverDo: thingsNeverDo,
                thingsAlwaysDo: thingsAlwaysDo,
                politicalPreference: politicalPreference,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ValuesBeliefsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ValuesBeliefsTableTable,
      ValuesBeliefsTableData,
      $$ValuesBeliefsTableTableFilterComposer,
      $$ValuesBeliefsTableTableOrderingComposer,
      $$ValuesBeliefsTableTableAnnotationComposer,
      $$ValuesBeliefsTableTableCreateCompanionBuilder,
      $$ValuesBeliefsTableTableUpdateCompanionBuilder,
      (
        ValuesBeliefsTableData,
        BaseReferences<
          _$AppDatabase,
          $ValuesBeliefsTableTable,
          ValuesBeliefsTableData
        >,
      ),
      ValuesBeliefsTableData,
      PrefetchHooks Function()
    >;
typedef $$DecisionProfilesTableTableCreateCompanionBuilder =
    DecisionProfilesTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<int?> logicLevel,
      Value<int?> emotionLevel,
      Value<int?> faithLevel,
      Value<int?> researchLevel,
      Value<int?> experienceLevel,
      Value<int?> friendsInfluence,
      Value<int?> familyInfluence,
      Value<String?> riskLevel,
      Value<String?> financialStyle,
      Value<String?> leadershipStyle,
      Value<String?> conflictHandling,
      required DateTime createdAt,
    });
typedef $$DecisionProfilesTableTableUpdateCompanionBuilder =
    DecisionProfilesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<int?> logicLevel,
      Value<int?> emotionLevel,
      Value<int?> faithLevel,
      Value<int?> researchLevel,
      Value<int?> experienceLevel,
      Value<int?> friendsInfluence,
      Value<int?> familyInfluence,
      Value<String?> riskLevel,
      Value<String?> financialStyle,
      Value<String?> leadershipStyle,
      Value<String?> conflictHandling,
      Value<DateTime> createdAt,
    });

class $$DecisionProfilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionProfilesTableTable> {
  $$DecisionProfilesTableTableFilterComposer({
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

  ColumnFilters<int> get logicLevel => $composableBuilder(
    column: $table.logicLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get emotionLevel => $composableBuilder(
    column: $table.emotionLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get faithLevel => $composableBuilder(
    column: $table.faithLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get researchLevel => $composableBuilder(
    column: $table.researchLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get experienceLevel => $composableBuilder(
    column: $table.experienceLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get friendsInfluence => $composableBuilder(
    column: $table.friendsInfluence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get familyInfluence => $composableBuilder(
    column: $table.familyInfluence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get riskLevel => $composableBuilder(
    column: $table.riskLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get financialStyle => $composableBuilder(
    column: $table.financialStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get leadershipStyle => $composableBuilder(
    column: $table.leadershipStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictHandling => $composableBuilder(
    column: $table.conflictHandling,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DecisionProfilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionProfilesTableTable> {
  $$DecisionProfilesTableTableOrderingComposer({
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

  ColumnOrderings<int> get logicLevel => $composableBuilder(
    column: $table.logicLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get emotionLevel => $composableBuilder(
    column: $table.emotionLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get faithLevel => $composableBuilder(
    column: $table.faithLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get researchLevel => $composableBuilder(
    column: $table.researchLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get experienceLevel => $composableBuilder(
    column: $table.experienceLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get friendsInfluence => $composableBuilder(
    column: $table.friendsInfluence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get familyInfluence => $composableBuilder(
    column: $table.familyInfluence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get riskLevel => $composableBuilder(
    column: $table.riskLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get financialStyle => $composableBuilder(
    column: $table.financialStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get leadershipStyle => $composableBuilder(
    column: $table.leadershipStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictHandling => $composableBuilder(
    column: $table.conflictHandling,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DecisionProfilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionProfilesTableTable> {
  $$DecisionProfilesTableTableAnnotationComposer({
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

  GeneratedColumn<int> get logicLevel => $composableBuilder(
    column: $table.logicLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get emotionLevel => $composableBuilder(
    column: $table.emotionLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get faithLevel => $composableBuilder(
    column: $table.faithLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get researchLevel => $composableBuilder(
    column: $table.researchLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get experienceLevel => $composableBuilder(
    column: $table.experienceLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get friendsInfluence => $composableBuilder(
    column: $table.friendsInfluence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get familyInfluence => $composableBuilder(
    column: $table.familyInfluence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get riskLevel =>
      $composableBuilder(column: $table.riskLevel, builder: (column) => column);

  GeneratedColumn<String> get financialStyle => $composableBuilder(
    column: $table.financialStyle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get leadershipStyle => $composableBuilder(
    column: $table.leadershipStyle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictHandling => $composableBuilder(
    column: $table.conflictHandling,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DecisionProfilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionProfilesTableTable,
          DecisionProfilesTableData,
          $$DecisionProfilesTableTableFilterComposer,
          $$DecisionProfilesTableTableOrderingComposer,
          $$DecisionProfilesTableTableAnnotationComposer,
          $$DecisionProfilesTableTableCreateCompanionBuilder,
          $$DecisionProfilesTableTableUpdateCompanionBuilder,
          (
            DecisionProfilesTableData,
            BaseReferences<
              _$AppDatabase,
              $DecisionProfilesTableTable,
              DecisionProfilesTableData
            >,
          ),
          DecisionProfilesTableData,
          PrefetchHooks Function()
        > {
  $$DecisionProfilesTableTableTableManager(
    _$AppDatabase db,
    $DecisionProfilesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionProfilesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DecisionProfilesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DecisionProfilesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<int?> logicLevel = const Value.absent(),
                Value<int?> emotionLevel = const Value.absent(),
                Value<int?> faithLevel = const Value.absent(),
                Value<int?> researchLevel = const Value.absent(),
                Value<int?> experienceLevel = const Value.absent(),
                Value<int?> friendsInfluence = const Value.absent(),
                Value<int?> familyInfluence = const Value.absent(),
                Value<String?> riskLevel = const Value.absent(),
                Value<String?> financialStyle = const Value.absent(),
                Value<String?> leadershipStyle = const Value.absent(),
                Value<String?> conflictHandling = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DecisionProfilesTableCompanion(
                id: id,
                humanId: humanId,
                logicLevel: logicLevel,
                emotionLevel: emotionLevel,
                faithLevel: faithLevel,
                researchLevel: researchLevel,
                experienceLevel: experienceLevel,
                friendsInfluence: friendsInfluence,
                familyInfluence: familyInfluence,
                riskLevel: riskLevel,
                financialStyle: financialStyle,
                leadershipStyle: leadershipStyle,
                conflictHandling: conflictHandling,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<int?> logicLevel = const Value.absent(),
                Value<int?> emotionLevel = const Value.absent(),
                Value<int?> faithLevel = const Value.absent(),
                Value<int?> researchLevel = const Value.absent(),
                Value<int?> experienceLevel = const Value.absent(),
                Value<int?> friendsInfluence = const Value.absent(),
                Value<int?> familyInfluence = const Value.absent(),
                Value<String?> riskLevel = const Value.absent(),
                Value<String?> financialStyle = const Value.absent(),
                Value<String?> leadershipStyle = const Value.absent(),
                Value<String?> conflictHandling = const Value.absent(),
                required DateTime createdAt,
              }) => DecisionProfilesTableCompanion.insert(
                id: id,
                humanId: humanId,
                logicLevel: logicLevel,
                emotionLevel: emotionLevel,
                faithLevel: faithLevel,
                researchLevel: researchLevel,
                experienceLevel: experienceLevel,
                friendsInfluence: friendsInfluence,
                familyInfluence: familyInfluence,
                riskLevel: riskLevel,
                financialStyle: financialStyle,
                leadershipStyle: leadershipStyle,
                conflictHandling: conflictHandling,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DecisionProfilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionProfilesTableTable,
      DecisionProfilesTableData,
      $$DecisionProfilesTableTableFilterComposer,
      $$DecisionProfilesTableTableOrderingComposer,
      $$DecisionProfilesTableTableAnnotationComposer,
      $$DecisionProfilesTableTableCreateCompanionBuilder,
      $$DecisionProfilesTableTableUpdateCompanionBuilder,
      (
        DecisionProfilesTableData,
        BaseReferences<
          _$AppDatabase,
          $DecisionProfilesTableTable,
          DecisionProfilesTableData
        >,
      ),
      DecisionProfilesTableData,
      PrefetchHooks Function()
    >;
typedef $$LifeStoriesTableTableCreateCompanionBuilder =
    LifeStoriesTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> sectionKey,
      Value<String?> title,
      Value<String?> content,
      Value<String?> tags,
      Value<String?> emotion,
      Value<int?> importance,
      required DateTime createdAt,
    });
typedef $$LifeStoriesTableTableUpdateCompanionBuilder =
    LifeStoriesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> sectionKey,
      Value<String?> title,
      Value<String?> content,
      Value<String?> tags,
      Value<String?> emotion,
      Value<int?> importance,
      Value<DateTime> createdAt,
    });

class $$LifeStoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $LifeStoriesTableTable> {
  $$LifeStoriesTableTableFilterComposer({
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

  ColumnFilters<String> get sectionKey => $composableBuilder(
    column: $table.sectionKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LifeStoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LifeStoriesTableTable> {
  $$LifeStoriesTableTableOrderingComposer({
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

  ColumnOrderings<String> get sectionKey => $composableBuilder(
    column: $table.sectionKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LifeStoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LifeStoriesTableTable> {
  $$LifeStoriesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get sectionKey => $composableBuilder(
    column: $table.sectionKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LifeStoriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LifeStoriesTableTable,
          LifeStoriesTableData,
          $$LifeStoriesTableTableFilterComposer,
          $$LifeStoriesTableTableOrderingComposer,
          $$LifeStoriesTableTableAnnotationComposer,
          $$LifeStoriesTableTableCreateCompanionBuilder,
          $$LifeStoriesTableTableUpdateCompanionBuilder,
          (
            LifeStoriesTableData,
            BaseReferences<
              _$AppDatabase,
              $LifeStoriesTableTable,
              LifeStoriesTableData
            >,
          ),
          LifeStoriesTableData,
          PrefetchHooks Function()
        > {
  $$LifeStoriesTableTableTableManager(
    _$AppDatabase db,
    $LifeStoriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LifeStoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LifeStoriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LifeStoriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> sectionKey = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<int?> importance = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LifeStoriesTableCompanion(
                id: id,
                humanId: humanId,
                sectionKey: sectionKey,
                title: title,
                content: content,
                tags: tags,
                emotion: emotion,
                importance: importance,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> sectionKey = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<int?> importance = const Value.absent(),
                required DateTime createdAt,
              }) => LifeStoriesTableCompanion.insert(
                id: id,
                humanId: humanId,
                sectionKey: sectionKey,
                title: title,
                content: content,
                tags: tags,
                emotion: emotion,
                importance: importance,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LifeStoriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LifeStoriesTableTable,
      LifeStoriesTableData,
      $$LifeStoriesTableTableFilterComposer,
      $$LifeStoriesTableTableOrderingComposer,
      $$LifeStoriesTableTableAnnotationComposer,
      $$LifeStoriesTableTableCreateCompanionBuilder,
      $$LifeStoriesTableTableUpdateCompanionBuilder,
      (
        LifeStoriesTableData,
        BaseReferences<
          _$AppDatabase,
          $LifeStoriesTableTable,
          LifeStoriesTableData
        >,
      ),
      LifeStoriesTableData,
      PrefetchHooks Function()
    >;
typedef $$TimelineTableTableCreateCompanionBuilder =
    TimelineTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> title,
      Value<String?> description,
      Value<String?> date,
      Value<int?> year,
      Value<String?> location,
      Value<String?> emotion,
      Value<String?> importance,
      required DateTime createdAt,
    });
typedef $$TimelineTableTableUpdateCompanionBuilder =
    TimelineTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> title,
      Value<String?> description,
      Value<String?> date,
      Value<int?> year,
      Value<String?> location,
      Value<String?> emotion,
      Value<String?> importance,
      Value<DateTime> createdAt,
    });

class $$TimelineTableTableFilterComposer
    extends Composer<_$AppDatabase, $TimelineTableTable> {
  $$TimelineTableTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TimelineTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TimelineTableTable> {
  $$TimelineTableTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TimelineTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimelineTableTable> {
  $$TimelineTableTableAnnotationComposer({
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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<String> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TimelineTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimelineTableTable,
          TimelineTableData,
          $$TimelineTableTableFilterComposer,
          $$TimelineTableTableOrderingComposer,
          $$TimelineTableTableAnnotationComposer,
          $$TimelineTableTableCreateCompanionBuilder,
          $$TimelineTableTableUpdateCompanionBuilder,
          (
            TimelineTableData,
            BaseReferences<
              _$AppDatabase,
              $TimelineTableTable,
              TimelineTableData
            >,
          ),
          TimelineTableData,
          PrefetchHooks Function()
        > {
  $$TimelineTableTableTableManager(_$AppDatabase db, $TimelineTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimelineTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimelineTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimelineTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<String?> importance = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TimelineTableCompanion(
                id: id,
                humanId: humanId,
                title: title,
                description: description,
                date: date,
                year: year,
                location: location,
                emotion: emotion,
                importance: importance,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<String?> importance = const Value.absent(),
                required DateTime createdAt,
              }) => TimelineTableCompanion.insert(
                id: id,
                humanId: humanId,
                title: title,
                description: description,
                date: date,
                year: year,
                location: location,
                emotion: emotion,
                importance: importance,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TimelineTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimelineTableTable,
      TimelineTableData,
      $$TimelineTableTableFilterComposer,
      $$TimelineTableTableOrderingComposer,
      $$TimelineTableTableAnnotationComposer,
      $$TimelineTableTableCreateCompanionBuilder,
      $$TimelineTableTableUpdateCompanionBuilder,
      (
        TimelineTableData,
        BaseReferences<_$AppDatabase, $TimelineTableTable, TimelineTableData>,
      ),
      TimelineTableData,
      PrefetchHooks Function()
    >;
typedef $$DailyJournalsTableTableCreateCompanionBuilder =
    DailyJournalsTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> date,
      Value<String?> mood,
      Value<String?> weather,
      Value<String?> location,
      Value<String?> journalText,
      Value<String?> voicePath,
      Value<String?> tags,
      Value<String?> favoriteMoment,
      Value<String?> lessonsLearned,
      required DateTime createdAt,
    });
typedef $$DailyJournalsTableTableUpdateCompanionBuilder =
    DailyJournalsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> date,
      Value<String?> mood,
      Value<String?> weather,
      Value<String?> location,
      Value<String?> journalText,
      Value<String?> voicePath,
      Value<String?> tags,
      Value<String?> favoriteMoment,
      Value<String?> lessonsLearned,
      Value<DateTime> createdAt,
    });

class $$DailyJournalsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DailyJournalsTableTable> {
  $$DailyJournalsTableTableFilterComposer({
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

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weather => $composableBuilder(
    column: $table.weather,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get journalText => $composableBuilder(
    column: $table.journalText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voicePath => $composableBuilder(
    column: $table.voicePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get favoriteMoment => $composableBuilder(
    column: $table.favoriteMoment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyJournalsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyJournalsTableTable> {
  $$DailyJournalsTableTableOrderingComposer({
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

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weather => $composableBuilder(
    column: $table.weather,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get journalText => $composableBuilder(
    column: $table.journalText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voicePath => $composableBuilder(
    column: $table.voicePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get favoriteMoment => $composableBuilder(
    column: $table.favoriteMoment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyJournalsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyJournalsTableTable> {
  $$DailyJournalsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<String> get weather =>
      $composableBuilder(column: $table.weather, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get journalText => $composableBuilder(
    column: $table.journalText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voicePath =>
      $composableBuilder(column: $table.voicePath, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get favoriteMoment => $composableBuilder(
    column: $table.favoriteMoment,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lessonsLearned => $composableBuilder(
    column: $table.lessonsLearned,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DailyJournalsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyJournalsTableTable,
          DailyJournalsTableData,
          $$DailyJournalsTableTableFilterComposer,
          $$DailyJournalsTableTableOrderingComposer,
          $$DailyJournalsTableTableAnnotationComposer,
          $$DailyJournalsTableTableCreateCompanionBuilder,
          $$DailyJournalsTableTableUpdateCompanionBuilder,
          (
            DailyJournalsTableData,
            BaseReferences<
              _$AppDatabase,
              $DailyJournalsTableTable,
              DailyJournalsTableData
            >,
          ),
          DailyJournalsTableData,
          PrefetchHooks Function()
        > {
  $$DailyJournalsTableTableTableManager(
    _$AppDatabase db,
    $DailyJournalsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyJournalsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyJournalsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyJournalsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> mood = const Value.absent(),
                Value<String?> weather = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> journalText = const Value.absent(),
                Value<String?> voicePath = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> favoriteMoment = const Value.absent(),
                Value<String?> lessonsLearned = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DailyJournalsTableCompanion(
                id: id,
                humanId: humanId,
                date: date,
                mood: mood,
                weather: weather,
                location: location,
                journalText: journalText,
                voicePath: voicePath,
                tags: tags,
                favoriteMoment: favoriteMoment,
                lessonsLearned: lessonsLearned,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> date = const Value.absent(),
                Value<String?> mood = const Value.absent(),
                Value<String?> weather = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> journalText = const Value.absent(),
                Value<String?> voicePath = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> favoriteMoment = const Value.absent(),
                Value<String?> lessonsLearned = const Value.absent(),
                required DateTime createdAt,
              }) => DailyJournalsTableCompanion.insert(
                id: id,
                humanId: humanId,
                date: date,
                mood: mood,
                weather: weather,
                location: location,
                journalText: journalText,
                voicePath: voicePath,
                tags: tags,
                favoriteMoment: favoriteMoment,
                lessonsLearned: lessonsLearned,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyJournalsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyJournalsTableTable,
      DailyJournalsTableData,
      $$DailyJournalsTableTableFilterComposer,
      $$DailyJournalsTableTableOrderingComposer,
      $$DailyJournalsTableTableAnnotationComposer,
      $$DailyJournalsTableTableCreateCompanionBuilder,
      $$DailyJournalsTableTableUpdateCompanionBuilder,
      (
        DailyJournalsTableData,
        BaseReferences<
          _$AppDatabase,
          $DailyJournalsTableTable,
          DailyJournalsTableData
        >,
      ),
      DailyJournalsTableData,
      PrefetchHooks Function()
    >;
typedef $$MemoriesTableTableCreateCompanionBuilder =
    MemoriesTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String title,
      Value<String?> description,
      Value<String?> category,
      Value<String?> date,
      Value<String?> emotion,
      Value<String?> location,
      Value<int?> importance,
      Value<String?> privacy,
      Value<String?> tags,
      required DateTime createdAt,
    });
typedef $$MemoriesTableTableUpdateCompanionBuilder =
    MemoriesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> title,
      Value<String?> description,
      Value<String?> category,
      Value<String?> date,
      Value<String?> emotion,
      Value<String?> location,
      Value<int?> importance,
      Value<String?> privacy,
      Value<String?> tags,
      Value<DateTime> createdAt,
    });

class $$MemoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $MemoriesTableTable> {
  $$MemoriesTableTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get privacy => $composableBuilder(
    column: $table.privacy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MemoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoriesTableTable> {
  $$MemoriesTableTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get privacy => $composableBuilder(
    column: $table.privacy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoriesTableTable> {
  $$MemoriesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => column,
  );

  GeneratedColumn<String> get privacy =>
      $composableBuilder(column: $table.privacy, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$MemoriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemoriesTableTable,
          MemoriesTableData,
          $$MemoriesTableTableFilterComposer,
          $$MemoriesTableTableOrderingComposer,
          $$MemoriesTableTableAnnotationComposer,
          $$MemoriesTableTableCreateCompanionBuilder,
          $$MemoriesTableTableUpdateCompanionBuilder,
          (
            MemoriesTableData,
            BaseReferences<
              _$AppDatabase,
              $MemoriesTableTable,
              MemoriesTableData
            >,
          ),
          MemoriesTableData,
          PrefetchHooks Function()
        > {
  $$MemoriesTableTableTableManager(_$AppDatabase db, $MemoriesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemoriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemoriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<int?> importance = const Value.absent(),
                Value<String?> privacy = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MemoriesTableCompanion(
                id: id,
                humanId: humanId,
                title: title,
                description: description,
                category: category,
                date: date,
                emotion: emotion,
                location: location,
                importance: importance,
                privacy: privacy,
                tags: tags,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<int?> importance = const Value.absent(),
                Value<String?> privacy = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                required DateTime createdAt,
              }) => MemoriesTableCompanion.insert(
                id: id,
                humanId: humanId,
                title: title,
                description: description,
                category: category,
                date: date,
                emotion: emotion,
                location: location,
                importance: importance,
                privacy: privacy,
                tags: tags,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MemoriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemoriesTableTable,
      MemoriesTableData,
      $$MemoriesTableTableFilterComposer,
      $$MemoriesTableTableOrderingComposer,
      $$MemoriesTableTableAnnotationComposer,
      $$MemoriesTableTableCreateCompanionBuilder,
      $$MemoriesTableTableUpdateCompanionBuilder,
      (
        MemoriesTableData,
        BaseReferences<_$AppDatabase, $MemoriesTableTable, MemoriesTableData>,
      ),
      MemoriesTableData,
      PrefetchHooks Function()
    >;
typedef $$MemoryTagsTableTableCreateCompanionBuilder =
    MemoryTagsTableCompanion Function({
      Value<int> id,
      required int memoryId,
      required String tag,
    });
typedef $$MemoryTagsTableTableUpdateCompanionBuilder =
    MemoryTagsTableCompanion Function({
      Value<int> id,
      Value<int> memoryId,
      Value<String> tag,
    });

class $$MemoryTagsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MemoryTagsTableTable> {
  $$MemoryTagsTableTableFilterComposer({
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

  ColumnFilters<int> get memoryId => $composableBuilder(
    column: $table.memoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MemoryTagsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoryTagsTableTable> {
  $$MemoryTagsTableTableOrderingComposer({
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

  ColumnOrderings<int> get memoryId => $composableBuilder(
    column: $table.memoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemoryTagsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoryTagsTableTable> {
  $$MemoryTagsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get memoryId =>
      $composableBuilder(column: $table.memoryId, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);
}

class $$MemoryTagsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemoryTagsTableTable,
          MemoryTagsTableData,
          $$MemoryTagsTableTableFilterComposer,
          $$MemoryTagsTableTableOrderingComposer,
          $$MemoryTagsTableTableAnnotationComposer,
          $$MemoryTagsTableTableCreateCompanionBuilder,
          $$MemoryTagsTableTableUpdateCompanionBuilder,
          (
            MemoryTagsTableData,
            BaseReferences<
              _$AppDatabase,
              $MemoryTagsTableTable,
              MemoryTagsTableData
            >,
          ),
          MemoryTagsTableData,
          PrefetchHooks Function()
        > {
  $$MemoryTagsTableTableTableManager(
    _$AppDatabase db,
    $MemoryTagsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemoryTagsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemoryTagsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemoryTagsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> memoryId = const Value.absent(),
                Value<String> tag = const Value.absent(),
              }) => MemoryTagsTableCompanion(
                id: id,
                memoryId: memoryId,
                tag: tag,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int memoryId,
                required String tag,
              }) => MemoryTagsTableCompanion.insert(
                id: id,
                memoryId: memoryId,
                tag: tag,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MemoryTagsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemoryTagsTableTable,
      MemoryTagsTableData,
      $$MemoryTagsTableTableFilterComposer,
      $$MemoryTagsTableTableOrderingComposer,
      $$MemoryTagsTableTableAnnotationComposer,
      $$MemoryTagsTableTableCreateCompanionBuilder,
      $$MemoryTagsTableTableUpdateCompanionBuilder,
      (
        MemoryTagsTableData,
        BaseReferences<
          _$AppDatabase,
          $MemoryTagsTableTable,
          MemoryTagsTableData
        >,
      ),
      MemoryTagsTableData,
      PrefetchHooks Function()
    >;
typedef $$MemoryLinksTableTableCreateCompanionBuilder =
    MemoryLinksTableCompanion Function({
      Value<int> id,
      required int memoryId,
      Value<String?> entityType,
      Value<int?> entityId,
    });
typedef $$MemoryLinksTableTableUpdateCompanionBuilder =
    MemoryLinksTableCompanion Function({
      Value<int> id,
      Value<int> memoryId,
      Value<String?> entityType,
      Value<int?> entityId,
    });

class $$MemoryLinksTableTableFilterComposer
    extends Composer<_$AppDatabase, $MemoryLinksTableTable> {
  $$MemoryLinksTableTableFilterComposer({
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

  ColumnFilters<int> get memoryId => $composableBuilder(
    column: $table.memoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MemoryLinksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoryLinksTableTable> {
  $$MemoryLinksTableTableOrderingComposer({
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

  ColumnOrderings<int> get memoryId => $composableBuilder(
    column: $table.memoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemoryLinksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoryLinksTableTable> {
  $$MemoryLinksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get memoryId =>
      $composableBuilder(column: $table.memoryId, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);
}

class $$MemoryLinksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemoryLinksTableTable,
          MemoryLinksTableData,
          $$MemoryLinksTableTableFilterComposer,
          $$MemoryLinksTableTableOrderingComposer,
          $$MemoryLinksTableTableAnnotationComposer,
          $$MemoryLinksTableTableCreateCompanionBuilder,
          $$MemoryLinksTableTableUpdateCompanionBuilder,
          (
            MemoryLinksTableData,
            BaseReferences<
              _$AppDatabase,
              $MemoryLinksTableTable,
              MemoryLinksTableData
            >,
          ),
          MemoryLinksTableData,
          PrefetchHooks Function()
        > {
  $$MemoryLinksTableTableTableManager(
    _$AppDatabase db,
    $MemoryLinksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemoryLinksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemoryLinksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemoryLinksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> memoryId = const Value.absent(),
                Value<String?> entityType = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
              }) => MemoryLinksTableCompanion(
                id: id,
                memoryId: memoryId,
                entityType: entityType,
                entityId: entityId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int memoryId,
                Value<String?> entityType = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
              }) => MemoryLinksTableCompanion.insert(
                id: id,
                memoryId: memoryId,
                entityType: entityType,
                entityId: entityId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MemoryLinksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemoryLinksTableTable,
      MemoryLinksTableData,
      $$MemoryLinksTableTableFilterComposer,
      $$MemoryLinksTableTableOrderingComposer,
      $$MemoryLinksTableTableAnnotationComposer,
      $$MemoryLinksTableTableCreateCompanionBuilder,
      $$MemoryLinksTableTableUpdateCompanionBuilder,
      (
        MemoryLinksTableData,
        BaseReferences<
          _$AppDatabase,
          $MemoryLinksTableTable,
          MemoryLinksTableData
        >,
      ),
      MemoryLinksTableData,
      PrefetchHooks Function()
    >;
typedef $$PhotosTableTableCreateCompanionBuilder =
    PhotosTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<int?> albumId,
      required String filePath,
      Value<String?> caption,
      Value<String?> takenDate,
      Value<String?> location,
      Value<String?> tags,
      required DateTime createdAt,
    });
typedef $$PhotosTableTableUpdateCompanionBuilder =
    PhotosTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<int?> albumId,
      Value<String> filePath,
      Value<String?> caption,
      Value<String?> takenDate,
      Value<String?> location,
      Value<String?> tags,
      Value<DateTime> createdAt,
    });

class $$PhotosTableTableFilterComposer
    extends Composer<_$AppDatabase, $PhotosTableTable> {
  $$PhotosTableTableFilterComposer({
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

  ColumnFilters<int> get albumId => $composableBuilder(
    column: $table.albumId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get takenDate => $composableBuilder(
    column: $table.takenDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhotosTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotosTableTable> {
  $$PhotosTableTableOrderingComposer({
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

  ColumnOrderings<int> get albumId => $composableBuilder(
    column: $table.albumId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get takenDate => $composableBuilder(
    column: $table.takenDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhotosTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotosTableTable> {
  $$PhotosTableTableAnnotationComposer({
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

  GeneratedColumn<int> get albumId =>
      $composableBuilder(column: $table.albumId, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get caption =>
      $composableBuilder(column: $table.caption, builder: (column) => column);

  GeneratedColumn<String> get takenDate =>
      $composableBuilder(column: $table.takenDate, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PhotosTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotosTableTable,
          PhotosTableData,
          $$PhotosTableTableFilterComposer,
          $$PhotosTableTableOrderingComposer,
          $$PhotosTableTableAnnotationComposer,
          $$PhotosTableTableCreateCompanionBuilder,
          $$PhotosTableTableUpdateCompanionBuilder,
          (
            PhotosTableData,
            BaseReferences<_$AppDatabase, $PhotosTableTable, PhotosTableData>,
          ),
          PhotosTableData,
          PrefetchHooks Function()
        > {
  $$PhotosTableTableTableManager(_$AppDatabase db, $PhotosTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<int?> albumId = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String?> caption = const Value.absent(),
                Value<String?> takenDate = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PhotosTableCompanion(
                id: id,
                humanId: humanId,
                albumId: albumId,
                filePath: filePath,
                caption: caption,
                takenDate: takenDate,
                location: location,
                tags: tags,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<int?> albumId = const Value.absent(),
                required String filePath,
                Value<String?> caption = const Value.absent(),
                Value<String?> takenDate = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                required DateTime createdAt,
              }) => PhotosTableCompanion.insert(
                id: id,
                humanId: humanId,
                albumId: albumId,
                filePath: filePath,
                caption: caption,
                takenDate: takenDate,
                location: location,
                tags: tags,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhotosTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotosTableTable,
      PhotosTableData,
      $$PhotosTableTableFilterComposer,
      $$PhotosTableTableOrderingComposer,
      $$PhotosTableTableAnnotationComposer,
      $$PhotosTableTableCreateCompanionBuilder,
      $$PhotosTableTableUpdateCompanionBuilder,
      (
        PhotosTableData,
        BaseReferences<_$AppDatabase, $PhotosTableTable, PhotosTableData>,
      ),
      PhotosTableData,
      PrefetchHooks Function()
    >;
typedef $$PhotoAlbumsTableTableCreateCompanionBuilder =
    PhotoAlbumsTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String name,
      required DateTime createdAt,
    });
typedef $$PhotoAlbumsTableTableUpdateCompanionBuilder =
    PhotoAlbumsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> name,
      Value<DateTime> createdAt,
    });

class $$PhotoAlbumsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoAlbumsTableTable> {
  $$PhotoAlbumsTableTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhotoAlbumsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoAlbumsTableTable> {
  $$PhotoAlbumsTableTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhotoAlbumsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoAlbumsTableTable> {
  $$PhotoAlbumsTableTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PhotoAlbumsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotoAlbumsTableTable,
          PhotoAlbumsTableData,
          $$PhotoAlbumsTableTableFilterComposer,
          $$PhotoAlbumsTableTableOrderingComposer,
          $$PhotoAlbumsTableTableAnnotationComposer,
          $$PhotoAlbumsTableTableCreateCompanionBuilder,
          $$PhotoAlbumsTableTableUpdateCompanionBuilder,
          (
            PhotoAlbumsTableData,
            BaseReferences<
              _$AppDatabase,
              $PhotoAlbumsTableTable,
              PhotoAlbumsTableData
            >,
          ),
          PhotoAlbumsTableData,
          PrefetchHooks Function()
        > {
  $$PhotoAlbumsTableTableTableManager(
    _$AppDatabase db,
    $PhotoAlbumsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotoAlbumsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotoAlbumsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotoAlbumsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PhotoAlbumsTableCompanion(
                id: id,
                humanId: humanId,
                name: name,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String name,
                required DateTime createdAt,
              }) => PhotoAlbumsTableCompanion.insert(
                id: id,
                humanId: humanId,
                name: name,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhotoAlbumsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotoAlbumsTableTable,
      PhotoAlbumsTableData,
      $$PhotoAlbumsTableTableFilterComposer,
      $$PhotoAlbumsTableTableOrderingComposer,
      $$PhotoAlbumsTableTableAnnotationComposer,
      $$PhotoAlbumsTableTableCreateCompanionBuilder,
      $$PhotoAlbumsTableTableUpdateCompanionBuilder,
      (
        PhotoAlbumsTableData,
        BaseReferences<
          _$AppDatabase,
          $PhotoAlbumsTableTable,
          PhotoAlbumsTableData
        >,
      ),
      PhotoAlbumsTableData,
      PrefetchHooks Function()
    >;
typedef $$DocumentsTableTableCreateCompanionBuilder =
    DocumentsTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String title,
      Value<String?> category,
      Value<String?> description,
      Value<String?> filePath,
      Value<String?> tags,
      required DateTime createdAt,
    });
typedef $$DocumentsTableTableUpdateCompanionBuilder =
    DocumentsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> title,
      Value<String?> category,
      Value<String?> description,
      Value<String?> filePath,
      Value<String?> tags,
      Value<DateTime> createdAt,
    });

class $$DocumentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DocumentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTableTable,
          DocumentsTableData,
          $$DocumentsTableTableFilterComposer,
          $$DocumentsTableTableOrderingComposer,
          $$DocumentsTableTableAnnotationComposer,
          $$DocumentsTableTableCreateCompanionBuilder,
          $$DocumentsTableTableUpdateCompanionBuilder,
          (
            DocumentsTableData,
            BaseReferences<
              _$AppDatabase,
              $DocumentsTableTable,
              DocumentsTableData
            >,
          ),
          DocumentsTableData,
          PrefetchHooks Function()
        > {
  $$DocumentsTableTableTableManager(
    _$AppDatabase db,
    $DocumentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DocumentsTableCompanion(
                id: id,
                humanId: humanId,
                title: title,
                category: category,
                description: description,
                filePath: filePath,
                tags: tags,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String title,
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                required DateTime createdAt,
              }) => DocumentsTableCompanion.insert(
                id: id,
                humanId: humanId,
                title: title,
                category: category,
                description: description,
                filePath: filePath,
                tags: tags,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTableTable,
      DocumentsTableData,
      $$DocumentsTableTableFilterComposer,
      $$DocumentsTableTableOrderingComposer,
      $$DocumentsTableTableAnnotationComposer,
      $$DocumentsTableTableCreateCompanionBuilder,
      $$DocumentsTableTableUpdateCompanionBuilder,
      (
        DocumentsTableData,
        BaseReferences<_$AppDatabase, $DocumentsTableTable, DocumentsTableData>,
      ),
      DocumentsTableData,
      PrefetchHooks Function()
    >;
typedef $$AudioFilesTableTableCreateCompanionBuilder =
    AudioFilesTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String filePath,
      Value<String?> transcript,
      Value<double?> duration,
      Value<String?> emotion,
      Value<String?> language,
      Value<String?> provider,
      required DateTime createdAt,
    });
typedef $$AudioFilesTableTableUpdateCompanionBuilder =
    AudioFilesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> filePath,
      Value<String?> transcript,
      Value<double?> duration,
      Value<String?> emotion,
      Value<String?> language,
      Value<String?> provider,
      Value<DateTime> createdAt,
    });

class $$AudioFilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $AudioFilesTableTable> {
  $$AudioFilesTableTableFilterComposer({
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

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transcript => $composableBuilder(
    column: $table.transcript,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AudioFilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AudioFilesTableTable> {
  $$AudioFilesTableTableOrderingComposer({
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

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transcript => $composableBuilder(
    column: $table.transcript,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AudioFilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudioFilesTableTable> {
  $$AudioFilesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get transcript => $composableBuilder(
    column: $table.transcript,
    builder: (column) => column,
  );

  GeneratedColumn<double> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AudioFilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudioFilesTableTable,
          AudioFilesTableData,
          $$AudioFilesTableTableFilterComposer,
          $$AudioFilesTableTableOrderingComposer,
          $$AudioFilesTableTableAnnotationComposer,
          $$AudioFilesTableTableCreateCompanionBuilder,
          $$AudioFilesTableTableUpdateCompanionBuilder,
          (
            AudioFilesTableData,
            BaseReferences<
              _$AppDatabase,
              $AudioFilesTableTable,
              AudioFilesTableData
            >,
          ),
          AudioFilesTableData,
          PrefetchHooks Function()
        > {
  $$AudioFilesTableTableTableManager(
    _$AppDatabase db,
    $AudioFilesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudioFilesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudioFilesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudioFilesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String?> transcript = const Value.absent(),
                Value<double?> duration = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AudioFilesTableCompanion(
                id: id,
                humanId: humanId,
                filePath: filePath,
                transcript: transcript,
                duration: duration,
                emotion: emotion,
                language: language,
                provider: provider,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String filePath,
                Value<String?> transcript = const Value.absent(),
                Value<double?> duration = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                required DateTime createdAt,
              }) => AudioFilesTableCompanion.insert(
                id: id,
                humanId: humanId,
                filePath: filePath,
                transcript: transcript,
                duration: duration,
                emotion: emotion,
                language: language,
                provider: provider,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AudioFilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudioFilesTableTable,
      AudioFilesTableData,
      $$AudioFilesTableTableFilterComposer,
      $$AudioFilesTableTableOrderingComposer,
      $$AudioFilesTableTableAnnotationComposer,
      $$AudioFilesTableTableCreateCompanionBuilder,
      $$AudioFilesTableTableUpdateCompanionBuilder,
      (
        AudioFilesTableData,
        BaseReferences<
          _$AppDatabase,
          $AudioFilesTableTable,
          AudioFilesTableData
        >,
      ),
      AudioFilesTableData,
      PrefetchHooks Function()
    >;
typedef $$VoiceSettingsTableTableCreateCompanionBuilder =
    VoiceSettingsTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> providerStt,
      Value<String?> providerTts,
      Value<String?> voiceModel,
      Value<String?> accent,
      Value<String?> pitch,
      Value<double?> speed,
      Value<double?> volume,
      Value<String?> emotion,
      Value<double?> pauseDuration,
      Value<String?> speakingStyle,
      Value<int?> silenceTimeout,
      Value<int?> noiseSuppression,
      Value<int?> echoCancellation,
      Value<int?> autoGainControl,
      Value<double?> voiceSensitivity,
      required DateTime updatedAt,
    });
typedef $$VoiceSettingsTableTableUpdateCompanionBuilder =
    VoiceSettingsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> providerStt,
      Value<String?> providerTts,
      Value<String?> voiceModel,
      Value<String?> accent,
      Value<String?> pitch,
      Value<double?> speed,
      Value<double?> volume,
      Value<String?> emotion,
      Value<double?> pauseDuration,
      Value<String?> speakingStyle,
      Value<int?> silenceTimeout,
      Value<int?> noiseSuppression,
      Value<int?> echoCancellation,
      Value<int?> autoGainControl,
      Value<double?> voiceSensitivity,
      Value<DateTime> updatedAt,
    });

class $$VoiceSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $VoiceSettingsTableTable> {
  $$VoiceSettingsTableTableFilterComposer({
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

  ColumnFilters<String> get providerStt => $composableBuilder(
    column: $table.providerStt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerTts => $composableBuilder(
    column: $table.providerTts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voiceModel => $composableBuilder(
    column: $table.voiceModel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accent => $composableBuilder(
    column: $table.accent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pitch => $composableBuilder(
    column: $table.pitch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pauseDuration => $composableBuilder(
    column: $table.pauseDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speakingStyle => $composableBuilder(
    column: $table.speakingStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get silenceTimeout => $composableBuilder(
    column: $table.silenceTimeout,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noiseSuppression => $composableBuilder(
    column: $table.noiseSuppression,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get echoCancellation => $composableBuilder(
    column: $table.echoCancellation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get autoGainControl => $composableBuilder(
    column: $table.autoGainControl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get voiceSensitivity => $composableBuilder(
    column: $table.voiceSensitivity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VoiceSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VoiceSettingsTableTable> {
  $$VoiceSettingsTableTableOrderingComposer({
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

  ColumnOrderings<String> get providerStt => $composableBuilder(
    column: $table.providerStt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerTts => $composableBuilder(
    column: $table.providerTts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voiceModel => $composableBuilder(
    column: $table.voiceModel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accent => $composableBuilder(
    column: $table.accent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pitch => $composableBuilder(
    column: $table.pitch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pauseDuration => $composableBuilder(
    column: $table.pauseDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speakingStyle => $composableBuilder(
    column: $table.speakingStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get silenceTimeout => $composableBuilder(
    column: $table.silenceTimeout,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noiseSuppression => $composableBuilder(
    column: $table.noiseSuppression,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get echoCancellation => $composableBuilder(
    column: $table.echoCancellation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get autoGainControl => $composableBuilder(
    column: $table.autoGainControl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get voiceSensitivity => $composableBuilder(
    column: $table.voiceSensitivity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VoiceSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VoiceSettingsTableTable> {
  $$VoiceSettingsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get providerStt => $composableBuilder(
    column: $table.providerStt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get providerTts => $composableBuilder(
    column: $table.providerTts,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voiceModel => $composableBuilder(
    column: $table.voiceModel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accent =>
      $composableBuilder(column: $table.accent, builder: (column) => column);

  GeneratedColumn<String> get pitch =>
      $composableBuilder(column: $table.pitch, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<double> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<double> get pauseDuration => $composableBuilder(
    column: $table.pauseDuration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get speakingStyle => $composableBuilder(
    column: $table.speakingStyle,
    builder: (column) => column,
  );

  GeneratedColumn<int> get silenceTimeout => $composableBuilder(
    column: $table.silenceTimeout,
    builder: (column) => column,
  );

  GeneratedColumn<int> get noiseSuppression => $composableBuilder(
    column: $table.noiseSuppression,
    builder: (column) => column,
  );

  GeneratedColumn<int> get echoCancellation => $composableBuilder(
    column: $table.echoCancellation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get autoGainControl => $composableBuilder(
    column: $table.autoGainControl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get voiceSensitivity => $composableBuilder(
    column: $table.voiceSensitivity,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$VoiceSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VoiceSettingsTableTable,
          VoiceSettingsTableData,
          $$VoiceSettingsTableTableFilterComposer,
          $$VoiceSettingsTableTableOrderingComposer,
          $$VoiceSettingsTableTableAnnotationComposer,
          $$VoiceSettingsTableTableCreateCompanionBuilder,
          $$VoiceSettingsTableTableUpdateCompanionBuilder,
          (
            VoiceSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $VoiceSettingsTableTable,
              VoiceSettingsTableData
            >,
          ),
          VoiceSettingsTableData,
          PrefetchHooks Function()
        > {
  $$VoiceSettingsTableTableTableManager(
    _$AppDatabase db,
    $VoiceSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VoiceSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VoiceSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VoiceSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> providerStt = const Value.absent(),
                Value<String?> providerTts = const Value.absent(),
                Value<String?> voiceModel = const Value.absent(),
                Value<String?> accent = const Value.absent(),
                Value<String?> pitch = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                Value<double?> volume = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<double?> pauseDuration = const Value.absent(),
                Value<String?> speakingStyle = const Value.absent(),
                Value<int?> silenceTimeout = const Value.absent(),
                Value<int?> noiseSuppression = const Value.absent(),
                Value<int?> echoCancellation = const Value.absent(),
                Value<int?> autoGainControl = const Value.absent(),
                Value<double?> voiceSensitivity = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VoiceSettingsTableCompanion(
                id: id,
                humanId: humanId,
                providerStt: providerStt,
                providerTts: providerTts,
                voiceModel: voiceModel,
                accent: accent,
                pitch: pitch,
                speed: speed,
                volume: volume,
                emotion: emotion,
                pauseDuration: pauseDuration,
                speakingStyle: speakingStyle,
                silenceTimeout: silenceTimeout,
                noiseSuppression: noiseSuppression,
                echoCancellation: echoCancellation,
                autoGainControl: autoGainControl,
                voiceSensitivity: voiceSensitivity,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> providerStt = const Value.absent(),
                Value<String?> providerTts = const Value.absent(),
                Value<String?> voiceModel = const Value.absent(),
                Value<String?> accent = const Value.absent(),
                Value<String?> pitch = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                Value<double?> volume = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<double?> pauseDuration = const Value.absent(),
                Value<String?> speakingStyle = const Value.absent(),
                Value<int?> silenceTimeout = const Value.absent(),
                Value<int?> noiseSuppression = const Value.absent(),
                Value<int?> echoCancellation = const Value.absent(),
                Value<int?> autoGainControl = const Value.absent(),
                Value<double?> voiceSensitivity = const Value.absent(),
                required DateTime updatedAt,
              }) => VoiceSettingsTableCompanion.insert(
                id: id,
                humanId: humanId,
                providerStt: providerStt,
                providerTts: providerTts,
                voiceModel: voiceModel,
                accent: accent,
                pitch: pitch,
                speed: speed,
                volume: volume,
                emotion: emotion,
                pauseDuration: pauseDuration,
                speakingStyle: speakingStyle,
                silenceTimeout: silenceTimeout,
                noiseSuppression: noiseSuppression,
                echoCancellation: echoCancellation,
                autoGainControl: autoGainControl,
                voiceSensitivity: voiceSensitivity,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VoiceSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VoiceSettingsTableTable,
      VoiceSettingsTableData,
      $$VoiceSettingsTableTableFilterComposer,
      $$VoiceSettingsTableTableOrderingComposer,
      $$VoiceSettingsTableTableAnnotationComposer,
      $$VoiceSettingsTableTableCreateCompanionBuilder,
      $$VoiceSettingsTableTableUpdateCompanionBuilder,
      (
        VoiceSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $VoiceSettingsTableTable,
          VoiceSettingsTableData
        >,
      ),
      VoiceSettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$LegacyMessagesTableTableCreateCompanionBuilder =
    LegacyMessagesTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> category,
      Value<String?> recipient,
      Value<String?> relationship,
      Value<String?> message,
      Value<String?> audioPath,
      Value<String?> videoPath,
      Value<String?> trigger,
      Value<String?> deliveryRule,
      required DateTime createdAt,
    });
typedef $$LegacyMessagesTableTableUpdateCompanionBuilder =
    LegacyMessagesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> category,
      Value<String?> recipient,
      Value<String?> relationship,
      Value<String?> message,
      Value<String?> audioPath,
      Value<String?> videoPath,
      Value<String?> trigger,
      Value<String?> deliveryRule,
      Value<DateTime> createdAt,
    });

class $$LegacyMessagesTableTableFilterComposer
    extends Composer<_$AppDatabase, $LegacyMessagesTableTable> {
  $$LegacyMessagesTableTableFilterComposer({
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

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipient => $composableBuilder(
    column: $table.recipient,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioPath => $composableBuilder(
    column: $table.audioPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoPath => $composableBuilder(
    column: $table.videoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliveryRule => $composableBuilder(
    column: $table.deliveryRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LegacyMessagesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LegacyMessagesTableTable> {
  $$LegacyMessagesTableTableOrderingComposer({
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

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipient => $composableBuilder(
    column: $table.recipient,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioPath => $composableBuilder(
    column: $table.audioPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoPath => $composableBuilder(
    column: $table.videoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliveryRule => $composableBuilder(
    column: $table.deliveryRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LegacyMessagesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LegacyMessagesTableTable> {
  $$LegacyMessagesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get recipient =>
      $composableBuilder(column: $table.recipient, builder: (column) => column);

  GeneratedColumn<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => column,
  );

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get audioPath =>
      $composableBuilder(column: $table.audioPath, builder: (column) => column);

  GeneratedColumn<String> get videoPath =>
      $composableBuilder(column: $table.videoPath, builder: (column) => column);

  GeneratedColumn<String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);

  GeneratedColumn<String> get deliveryRule => $composableBuilder(
    column: $table.deliveryRule,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LegacyMessagesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LegacyMessagesTableTable,
          LegacyMessagesTableData,
          $$LegacyMessagesTableTableFilterComposer,
          $$LegacyMessagesTableTableOrderingComposer,
          $$LegacyMessagesTableTableAnnotationComposer,
          $$LegacyMessagesTableTableCreateCompanionBuilder,
          $$LegacyMessagesTableTableUpdateCompanionBuilder,
          (
            LegacyMessagesTableData,
            BaseReferences<
              _$AppDatabase,
              $LegacyMessagesTableTable,
              LegacyMessagesTableData
            >,
          ),
          LegacyMessagesTableData,
          PrefetchHooks Function()
        > {
  $$LegacyMessagesTableTableTableManager(
    _$AppDatabase db,
    $LegacyMessagesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LegacyMessagesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LegacyMessagesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LegacyMessagesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> recipient = const Value.absent(),
                Value<String?> relationship = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<String?> audioPath = const Value.absent(),
                Value<String?> videoPath = const Value.absent(),
                Value<String?> trigger = const Value.absent(),
                Value<String?> deliveryRule = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LegacyMessagesTableCompanion(
                id: id,
                humanId: humanId,
                category: category,
                recipient: recipient,
                relationship: relationship,
                message: message,
                audioPath: audioPath,
                videoPath: videoPath,
                trigger: trigger,
                deliveryRule: deliveryRule,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> category = const Value.absent(),
                Value<String?> recipient = const Value.absent(),
                Value<String?> relationship = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<String?> audioPath = const Value.absent(),
                Value<String?> videoPath = const Value.absent(),
                Value<String?> trigger = const Value.absent(),
                Value<String?> deliveryRule = const Value.absent(),
                required DateTime createdAt,
              }) => LegacyMessagesTableCompanion.insert(
                id: id,
                humanId: humanId,
                category: category,
                recipient: recipient,
                relationship: relationship,
                message: message,
                audioPath: audioPath,
                videoPath: videoPath,
                trigger: trigger,
                deliveryRule: deliveryRule,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LegacyMessagesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LegacyMessagesTableTable,
      LegacyMessagesTableData,
      $$LegacyMessagesTableTableFilterComposer,
      $$LegacyMessagesTableTableOrderingComposer,
      $$LegacyMessagesTableTableAnnotationComposer,
      $$LegacyMessagesTableTableCreateCompanionBuilder,
      $$LegacyMessagesTableTableUpdateCompanionBuilder,
      (
        LegacyMessagesTableData,
        BaseReferences<
          _$AppDatabase,
          $LegacyMessagesTableTable,
          LegacyMessagesTableData
        >,
      ),
      LegacyMessagesTableData,
      PrefetchHooks Function()
    >;
typedef $$AiProvidersTableTableCreateCompanionBuilder =
    AiProvidersTableCompanion Function({
      Value<int> id,
      Value<int?> humanId,
      required String name,
      Value<String?> providerType,
      Value<String?> apiKey,
      Value<String?> baseUrl,
      Value<String?> model,
      Value<String?> temperature,
      Value<int?> maxTokens,
      Value<int?> timeout,
      Value<int?> retryCount,
      Value<int?> priority,
      Value<int?> isBackup,
      Value<String?> status,
      Value<int?> latency,
      Value<int?> totalRequests,
      Value<int?> totalTokens,
      Value<String?> totalCost,
      Value<int?> failures,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$AiProvidersTableTableUpdateCompanionBuilder =
    AiProvidersTableCompanion Function({
      Value<int> id,
      Value<int?> humanId,
      Value<String> name,
      Value<String?> providerType,
      Value<String?> apiKey,
      Value<String?> baseUrl,
      Value<String?> model,
      Value<String?> temperature,
      Value<int?> maxTokens,
      Value<int?> timeout,
      Value<int?> retryCount,
      Value<int?> priority,
      Value<int?> isBackup,
      Value<String?> status,
      Value<int?> latency,
      Value<int?> totalRequests,
      Value<int?> totalTokens,
      Value<String?> totalCost,
      Value<int?> failures,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$AiProvidersTableTableFilterComposer
    extends Composer<_$AppDatabase, $AiProvidersTableTable> {
  $$AiProvidersTableTableFilterComposer({
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

  ColumnFilters<String> get providerType => $composableBuilder(
    column: $table.providerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxTokens => $composableBuilder(
    column: $table.maxTokens,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timeout => $composableBuilder(
    column: $table.timeout,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isBackup => $composableBuilder(
    column: $table.isBackup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get latency => $composableBuilder(
    column: $table.latency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalRequests => $composableBuilder(
    column: $table.totalRequests,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalTokens => $composableBuilder(
    column: $table.totalTokens,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get totalCost => $composableBuilder(
    column: $table.totalCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get failures => $composableBuilder(
    column: $table.failures,
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

class $$AiProvidersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AiProvidersTableTable> {
  $$AiProvidersTableTableOrderingComposer({
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

  ColumnOrderings<String> get providerType => $composableBuilder(
    column: $table.providerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxTokens => $composableBuilder(
    column: $table.maxTokens,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timeout => $composableBuilder(
    column: $table.timeout,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isBackup => $composableBuilder(
    column: $table.isBackup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get latency => $composableBuilder(
    column: $table.latency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalRequests => $composableBuilder(
    column: $table.totalRequests,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalTokens => $composableBuilder(
    column: $table.totalTokens,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get totalCost => $composableBuilder(
    column: $table.totalCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get failures => $composableBuilder(
    column: $table.failures,
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

class $$AiProvidersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiProvidersTableTable> {
  $$AiProvidersTableTableAnnotationComposer({
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

  GeneratedColumn<String> get providerType => $composableBuilder(
    column: $table.providerType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get apiKey =>
      $composableBuilder(column: $table.apiKey, builder: (column) => column);

  GeneratedColumn<String> get baseUrl =>
      $composableBuilder(column: $table.baseUrl, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxTokens =>
      $composableBuilder(column: $table.maxTokens, builder: (column) => column);

  GeneratedColumn<int> get timeout =>
      $composableBuilder(column: $table.timeout, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get isBackup =>
      $composableBuilder(column: $table.isBackup, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get latency =>
      $composableBuilder(column: $table.latency, builder: (column) => column);

  GeneratedColumn<int> get totalRequests => $composableBuilder(
    column: $table.totalRequests,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalTokens => $composableBuilder(
    column: $table.totalTokens,
    builder: (column) => column,
  );

  GeneratedColumn<String> get totalCost =>
      $composableBuilder(column: $table.totalCost, builder: (column) => column);

  GeneratedColumn<int> get failures =>
      $composableBuilder(column: $table.failures, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AiProvidersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiProvidersTableTable,
          AiProvidersTableData,
          $$AiProvidersTableTableFilterComposer,
          $$AiProvidersTableTableOrderingComposer,
          $$AiProvidersTableTableAnnotationComposer,
          $$AiProvidersTableTableCreateCompanionBuilder,
          $$AiProvidersTableTableUpdateCompanionBuilder,
          (
            AiProvidersTableData,
            BaseReferences<
              _$AppDatabase,
              $AiProvidersTableTable,
              AiProvidersTableData
            >,
          ),
          AiProvidersTableData,
          PrefetchHooks Function()
        > {
  $$AiProvidersTableTableTableManager(
    _$AppDatabase db,
    $AiProvidersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiProvidersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiProvidersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiProvidersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> humanId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> providerType = const Value.absent(),
                Value<String?> apiKey = const Value.absent(),
                Value<String?> baseUrl = const Value.absent(),
                Value<String?> model = const Value.absent(),
                Value<String?> temperature = const Value.absent(),
                Value<int?> maxTokens = const Value.absent(),
                Value<int?> timeout = const Value.absent(),
                Value<int?> retryCount = const Value.absent(),
                Value<int?> priority = const Value.absent(),
                Value<int?> isBackup = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int?> latency = const Value.absent(),
                Value<int?> totalRequests = const Value.absent(),
                Value<int?> totalTokens = const Value.absent(),
                Value<String?> totalCost = const Value.absent(),
                Value<int?> failures = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AiProvidersTableCompanion(
                id: id,
                humanId: humanId,
                name: name,
                providerType: providerType,
                apiKey: apiKey,
                baseUrl: baseUrl,
                model: model,
                temperature: temperature,
                maxTokens: maxTokens,
                timeout: timeout,
                retryCount: retryCount,
                priority: priority,
                isBackup: isBackup,
                status: status,
                latency: latency,
                totalRequests: totalRequests,
                totalTokens: totalTokens,
                totalCost: totalCost,
                failures: failures,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> humanId = const Value.absent(),
                required String name,
                Value<String?> providerType = const Value.absent(),
                Value<String?> apiKey = const Value.absent(),
                Value<String?> baseUrl = const Value.absent(),
                Value<String?> model = const Value.absent(),
                Value<String?> temperature = const Value.absent(),
                Value<int?> maxTokens = const Value.absent(),
                Value<int?> timeout = const Value.absent(),
                Value<int?> retryCount = const Value.absent(),
                Value<int?> priority = const Value.absent(),
                Value<int?> isBackup = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int?> latency = const Value.absent(),
                Value<int?> totalRequests = const Value.absent(),
                Value<int?> totalTokens = const Value.absent(),
                Value<String?> totalCost = const Value.absent(),
                Value<int?> failures = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => AiProvidersTableCompanion.insert(
                id: id,
                humanId: humanId,
                name: name,
                providerType: providerType,
                apiKey: apiKey,
                baseUrl: baseUrl,
                model: model,
                temperature: temperature,
                maxTokens: maxTokens,
                timeout: timeout,
                retryCount: retryCount,
                priority: priority,
                isBackup: isBackup,
                status: status,
                latency: latency,
                totalRequests: totalRequests,
                totalTokens: totalTokens,
                totalCost: totalCost,
                failures: failures,
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

typedef $$AiProvidersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiProvidersTableTable,
      AiProvidersTableData,
      $$AiProvidersTableTableFilterComposer,
      $$AiProvidersTableTableOrderingComposer,
      $$AiProvidersTableTableAnnotationComposer,
      $$AiProvidersTableTableCreateCompanionBuilder,
      $$AiProvidersTableTableUpdateCompanionBuilder,
      (
        AiProvidersTableData,
        BaseReferences<
          _$AppDatabase,
          $AiProvidersTableTable,
          AiProvidersTableData
        >,
      ),
      AiProvidersTableData,
      PrefetchHooks Function()
    >;
typedef $$AiSettingsTableTableCreateCompanionBuilder =
    AiSettingsTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String key,
      Value<String?> value,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$AiSettingsTableTableUpdateCompanionBuilder =
    AiSettingsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> key,
      Value<String?> value,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$AiSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AiSettingsTableTable> {
  $$AiSettingsTableTableFilterComposer({
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

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
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

class $$AiSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AiSettingsTableTable> {
  $$AiSettingsTableTableOrderingComposer({
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

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
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

class $$AiSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiSettingsTableTable> {
  $$AiSettingsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AiSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiSettingsTableTable,
          AiSettingsTableData,
          $$AiSettingsTableTableFilterComposer,
          $$AiSettingsTableTableOrderingComposer,
          $$AiSettingsTableTableAnnotationComposer,
          $$AiSettingsTableTableCreateCompanionBuilder,
          $$AiSettingsTableTableUpdateCompanionBuilder,
          (
            AiSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $AiSettingsTableTable,
              AiSettingsTableData
            >,
          ),
          AiSettingsTableData,
          PrefetchHooks Function()
        > {
  $$AiSettingsTableTableTableManager(
    _$AppDatabase db,
    $AiSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiSettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AiSettingsTableCompanion(
                id: id,
                humanId: humanId,
                key: key,
                value: value,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String key,
                Value<String?> value = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => AiSettingsTableCompanion.insert(
                id: id,
                humanId: humanId,
                key: key,
                value: value,
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

typedef $$AiSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiSettingsTableTable,
      AiSettingsTableData,
      $$AiSettingsTableTableFilterComposer,
      $$AiSettingsTableTableOrderingComposer,
      $$AiSettingsTableTableAnnotationComposer,
      $$AiSettingsTableTableCreateCompanionBuilder,
      $$AiSettingsTableTableUpdateCompanionBuilder,
      (
        AiSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $AiSettingsTableTable,
          AiSettingsTableData
        >,
      ),
      AiSettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$AvatarsTableTableCreateCompanionBuilder =
    AvatarsTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> filePath,
      Value<String?> style,
      Value<String?> expression,
      Value<int?> isDefault,
      required DateTime createdAt,
    });
typedef $$AvatarsTableTableUpdateCompanionBuilder =
    AvatarsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> filePath,
      Value<String?> style,
      Value<String?> expression,
      Value<int?> isDefault,
      Value<DateTime> createdAt,
    });

class $$AvatarsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AvatarsTableTable> {
  $$AvatarsTableTableFilterComposer({
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

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get style => $composableBuilder(
    column: $table.style,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expression => $composableBuilder(
    column: $table.expression,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AvatarsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AvatarsTableTable> {
  $$AvatarsTableTableOrderingComposer({
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

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get style => $composableBuilder(
    column: $table.style,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expression => $composableBuilder(
    column: $table.expression,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AvatarsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AvatarsTableTable> {
  $$AvatarsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get style =>
      $composableBuilder(column: $table.style, builder: (column) => column);

  GeneratedColumn<String> get expression => $composableBuilder(
    column: $table.expression,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AvatarsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AvatarsTableTable,
          AvatarsTableData,
          $$AvatarsTableTableFilterComposer,
          $$AvatarsTableTableOrderingComposer,
          $$AvatarsTableTableAnnotationComposer,
          $$AvatarsTableTableCreateCompanionBuilder,
          $$AvatarsTableTableUpdateCompanionBuilder,
          (
            AvatarsTableData,
            BaseReferences<_$AppDatabase, $AvatarsTableTable, AvatarsTableData>,
          ),
          AvatarsTableData,
          PrefetchHooks Function()
        > {
  $$AvatarsTableTableTableManager(_$AppDatabase db, $AvatarsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AvatarsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AvatarsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AvatarsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> style = const Value.absent(),
                Value<String?> expression = const Value.absent(),
                Value<int?> isDefault = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AvatarsTableCompanion(
                id: id,
                humanId: humanId,
                filePath: filePath,
                style: style,
                expression: expression,
                isDefault: isDefault,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> filePath = const Value.absent(),
                Value<String?> style = const Value.absent(),
                Value<String?> expression = const Value.absent(),
                Value<int?> isDefault = const Value.absent(),
                required DateTime createdAt,
              }) => AvatarsTableCompanion.insert(
                id: id,
                humanId: humanId,
                filePath: filePath,
                style: style,
                expression: expression,
                isDefault: isDefault,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AvatarsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AvatarsTableTable,
      AvatarsTableData,
      $$AvatarsTableTableFilterComposer,
      $$AvatarsTableTableOrderingComposer,
      $$AvatarsTableTableAnnotationComposer,
      $$AvatarsTableTableCreateCompanionBuilder,
      $$AvatarsTableTableUpdateCompanionBuilder,
      (
        AvatarsTableData,
        BaseReferences<_$AppDatabase, $AvatarsTableTable, AvatarsTableData>,
      ),
      AvatarsTableData,
      PrefetchHooks Function()
    >;
typedef $$ChatHistoryTableTableCreateCompanionBuilder =
    ChatHistoryTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String role,
      required String message,
      Value<String?> attachments,
      Value<String?> sources,
      Value<String?> provider,
      Value<String?> model,
      required DateTime createdAt,
    });
typedef $$ChatHistoryTableTableUpdateCompanionBuilder =
    ChatHistoryTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> role,
      Value<String> message,
      Value<String?> attachments,
      Value<String?> sources,
      Value<String?> provider,
      Value<String?> model,
      Value<DateTime> createdAt,
    });

class $$ChatHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChatHistoryTableTable> {
  $$ChatHistoryTableTableFilterComposer({
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

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attachments => $composableBuilder(
    column: $table.attachments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatHistoryTableTable> {
  $$ChatHistoryTableTableOrderingComposer({
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

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attachments => $composableBuilder(
    column: $table.attachments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatHistoryTableTable> {
  $$ChatHistoryTableTableAnnotationComposer({
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

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get attachments => $composableBuilder(
    column: $table.attachments,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ChatHistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatHistoryTableTable,
          ChatHistoryTableData,
          $$ChatHistoryTableTableFilterComposer,
          $$ChatHistoryTableTableOrderingComposer,
          $$ChatHistoryTableTableAnnotationComposer,
          $$ChatHistoryTableTableCreateCompanionBuilder,
          $$ChatHistoryTableTableUpdateCompanionBuilder,
          (
            ChatHistoryTableData,
            BaseReferences<
              _$AppDatabase,
              $ChatHistoryTableTable,
              ChatHistoryTableData
            >,
          ),
          ChatHistoryTableData,
          PrefetchHooks Function()
        > {
  $$ChatHistoryTableTableTableManager(
    _$AppDatabase db,
    $ChatHistoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatHistoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String?> attachments = const Value.absent(),
                Value<String?> sources = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<String?> model = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ChatHistoryTableCompanion(
                id: id,
                humanId: humanId,
                role: role,
                message: message,
                attachments: attachments,
                sources: sources,
                provider: provider,
                model: model,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String role,
                required String message,
                Value<String?> attachments = const Value.absent(),
                Value<String?> sources = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<String?> model = const Value.absent(),
                required DateTime createdAt,
              }) => ChatHistoryTableCompanion.insert(
                id: id,
                humanId: humanId,
                role: role,
                message: message,
                attachments: attachments,
                sources: sources,
                provider: provider,
                model: model,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatHistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatHistoryTableTable,
      ChatHistoryTableData,
      $$ChatHistoryTableTableFilterComposer,
      $$ChatHistoryTableTableOrderingComposer,
      $$ChatHistoryTableTableAnnotationComposer,
      $$ChatHistoryTableTableCreateCompanionBuilder,
      $$ChatHistoryTableTableUpdateCompanionBuilder,
      (
        ChatHistoryTableData,
        BaseReferences<
          _$AppDatabase,
          $ChatHistoryTableTable,
          ChatHistoryTableData
        >,
      ),
      ChatHistoryTableData,
      PrefetchHooks Function()
    >;
typedef $$LifePlacesTableTableCreateCompanionBuilder =
    LifePlacesTableCompanion Function({
      Value<int> id,
      required int humanId,
      Value<String?> type,
      Value<String?> placeName,
      Value<String?> latitude,
      Value<String?> longitude,
      Value<String?> description,
      required DateTime createdAt,
    });
typedef $$LifePlacesTableTableUpdateCompanionBuilder =
    LifePlacesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String?> type,
      Value<String?> placeName,
      Value<String?> latitude,
      Value<String?> longitude,
      Value<String?> description,
      Value<DateTime> createdAt,
    });

class $$LifePlacesTableTableFilterComposer
    extends Composer<_$AppDatabase, $LifePlacesTableTable> {
  $$LifePlacesTableTableFilterComposer({
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

  ColumnFilters<String> get placeName => $composableBuilder(
    column: $table.placeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LifePlacesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LifePlacesTableTable> {
  $$LifePlacesTableTableOrderingComposer({
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

  ColumnOrderings<String> get placeName => $composableBuilder(
    column: $table.placeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LifePlacesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LifePlacesTableTable> {
  $$LifePlacesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get placeName =>
      $composableBuilder(column: $table.placeName, builder: (column) => column);

  GeneratedColumn<String> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<String> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LifePlacesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LifePlacesTableTable,
          LifePlacesTableData,
          $$LifePlacesTableTableFilterComposer,
          $$LifePlacesTableTableOrderingComposer,
          $$LifePlacesTableTableAnnotationComposer,
          $$LifePlacesTableTableCreateCompanionBuilder,
          $$LifePlacesTableTableUpdateCompanionBuilder,
          (
            LifePlacesTableData,
            BaseReferences<
              _$AppDatabase,
              $LifePlacesTableTable,
              LifePlacesTableData
            >,
          ),
          LifePlacesTableData,
          PrefetchHooks Function()
        > {
  $$LifePlacesTableTableTableManager(
    _$AppDatabase db,
    $LifePlacesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LifePlacesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LifePlacesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LifePlacesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> placeName = const Value.absent(),
                Value<String?> latitude = const Value.absent(),
                Value<String?> longitude = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LifePlacesTableCompanion(
                id: id,
                humanId: humanId,
                type: type,
                placeName: placeName,
                latitude: latitude,
                longitude: longitude,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                Value<String?> type = const Value.absent(),
                Value<String?> placeName = const Value.absent(),
                Value<String?> latitude = const Value.absent(),
                Value<String?> longitude = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required DateTime createdAt,
              }) => LifePlacesTableCompanion.insert(
                id: id,
                humanId: humanId,
                type: type,
                placeName: placeName,
                latitude: latitude,
                longitude: longitude,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LifePlacesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LifePlacesTableTable,
      LifePlacesTableData,
      $$LifePlacesTableTableFilterComposer,
      $$LifePlacesTableTableOrderingComposer,
      $$LifePlacesTableTableAnnotationComposer,
      $$LifePlacesTableTableCreateCompanionBuilder,
      $$LifePlacesTableTableUpdateCompanionBuilder,
      (
        LifePlacesTableData,
        BaseReferences<
          _$AppDatabase,
          $LifePlacesTableTable,
          LifePlacesTableData
        >,
      ),
      LifePlacesTableData,
      PrefetchHooks Function()
    >;
typedef $$FavoriteQuotesTableTableCreateCompanionBuilder =
    FavoriteQuotesTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String quote,
      required DateTime createdAt,
    });
typedef $$FavoriteQuotesTableTableUpdateCompanionBuilder =
    FavoriteQuotesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> quote,
      Value<DateTime> createdAt,
    });

class $$FavoriteQuotesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteQuotesTableTable> {
  $$FavoriteQuotesTableTableFilterComposer({
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

  ColumnFilters<String> get quote => $composableBuilder(
    column: $table.quote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteQuotesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteQuotesTableTable> {
  $$FavoriteQuotesTableTableOrderingComposer({
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

  ColumnOrderings<String> get quote => $composableBuilder(
    column: $table.quote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteQuotesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteQuotesTableTable> {
  $$FavoriteQuotesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get quote =>
      $composableBuilder(column: $table.quote, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoriteQuotesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteQuotesTableTable,
          FavoriteQuotesTableData,
          $$FavoriteQuotesTableTableFilterComposer,
          $$FavoriteQuotesTableTableOrderingComposer,
          $$FavoriteQuotesTableTableAnnotationComposer,
          $$FavoriteQuotesTableTableCreateCompanionBuilder,
          $$FavoriteQuotesTableTableUpdateCompanionBuilder,
          (
            FavoriteQuotesTableData,
            BaseReferences<
              _$AppDatabase,
              $FavoriteQuotesTableTable,
              FavoriteQuotesTableData
            >,
          ),
          FavoriteQuotesTableData,
          PrefetchHooks Function()
        > {
  $$FavoriteQuotesTableTableTableManager(
    _$AppDatabase db,
    $FavoriteQuotesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteQuotesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteQuotesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FavoriteQuotesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> quote = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FavoriteQuotesTableCompanion(
                id: id,
                humanId: humanId,
                quote: quote,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String quote,
                required DateTime createdAt,
              }) => FavoriteQuotesTableCompanion.insert(
                id: id,
                humanId: humanId,
                quote: quote,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteQuotesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteQuotesTableTable,
      FavoriteQuotesTableData,
      $$FavoriteQuotesTableTableFilterComposer,
      $$FavoriteQuotesTableTableOrderingComposer,
      $$FavoriteQuotesTableTableAnnotationComposer,
      $$FavoriteQuotesTableTableCreateCompanionBuilder,
      $$FavoriteQuotesTableTableUpdateCompanionBuilder,
      (
        FavoriteQuotesTableData,
        BaseReferences<
          _$AppDatabase,
          $FavoriteQuotesTableTable,
          FavoriteQuotesTableData
        >,
      ),
      FavoriteQuotesTableData,
      PrefetchHooks Function()
    >;
typedef $$FavoriteWordsTableTableCreateCompanionBuilder =
    FavoriteWordsTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String word,
      required DateTime createdAt,
    });
typedef $$FavoriteWordsTableTableUpdateCompanionBuilder =
    FavoriteWordsTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> word,
      Value<DateTime> createdAt,
    });

class $$FavoriteWordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteWordsTableTable> {
  $$FavoriteWordsTableTableFilterComposer({
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

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteWordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteWordsTableTable> {
  $$FavoriteWordsTableTableOrderingComposer({
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

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteWordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteWordsTableTable> {
  $$FavoriteWordsTableTableAnnotationComposer({
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

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoriteWordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteWordsTableTable,
          FavoriteWordsTableData,
          $$FavoriteWordsTableTableFilterComposer,
          $$FavoriteWordsTableTableOrderingComposer,
          $$FavoriteWordsTableTableAnnotationComposer,
          $$FavoriteWordsTableTableCreateCompanionBuilder,
          $$FavoriteWordsTableTableUpdateCompanionBuilder,
          (
            FavoriteWordsTableData,
            BaseReferences<
              _$AppDatabase,
              $FavoriteWordsTableTable,
              FavoriteWordsTableData
            >,
          ),
          FavoriteWordsTableData,
          PrefetchHooks Function()
        > {
  $$FavoriteWordsTableTableTableManager(
    _$AppDatabase db,
    $FavoriteWordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteWordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteWordsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteWordsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FavoriteWordsTableCompanion(
                id: id,
                humanId: humanId,
                word: word,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String word,
                required DateTime createdAt,
              }) => FavoriteWordsTableCompanion.insert(
                id: id,
                humanId: humanId,
                word: word,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteWordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteWordsTableTable,
      FavoriteWordsTableData,
      $$FavoriteWordsTableTableFilterComposer,
      $$FavoriteWordsTableTableOrderingComposer,
      $$FavoriteWordsTableTableAnnotationComposer,
      $$FavoriteWordsTableTableCreateCompanionBuilder,
      $$FavoriteWordsTableTableUpdateCompanionBuilder,
      (
        FavoriteWordsTableData,
        BaseReferences<
          _$AppDatabase,
          $FavoriteWordsTableTable,
          FavoriteWordsTableData
        >,
      ),
      FavoriteWordsTableData,
      PrefetchHooks Function()
    >;
typedef $$FavoritesTableTableCreateCompanionBuilder =
    FavoritesTableCompanion Function({
      Value<int> id,
      required int humanId,
      required String type,
      required String value,
      required DateTime createdAt,
    });
typedef $$FavoritesTableTableUpdateCompanionBuilder =
    FavoritesTableCompanion Function({
      Value<int> id,
      Value<int> humanId,
      Value<String> type,
      Value<String> value,
      Value<DateTime> createdAt,
    });

class $$FavoritesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableFilterComposer({
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

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableOrderingComposer({
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

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoritesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTableTable,
          FavoritesTableData,
          $$FavoritesTableTableFilterComposer,
          $$FavoritesTableTableOrderingComposer,
          $$FavoritesTableTableAnnotationComposer,
          $$FavoritesTableTableCreateCompanionBuilder,
          $$FavoritesTableTableUpdateCompanionBuilder,
          (
            FavoritesTableData,
            BaseReferences<
              _$AppDatabase,
              $FavoritesTableTable,
              FavoritesTableData
            >,
          ),
          FavoritesTableData,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableTableManager(
    _$AppDatabase db,
    $FavoritesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> humanId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FavoritesTableCompanion(
                id: id,
                humanId: humanId,
                type: type,
                value: value,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int humanId,
                required String type,
                required String value,
                required DateTime createdAt,
              }) => FavoritesTableCompanion.insert(
                id: id,
                humanId: humanId,
                type: type,
                value: value,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTableTable,
      FavoritesTableData,
      $$FavoritesTableTableFilterComposer,
      $$FavoritesTableTableOrderingComposer,
      $$FavoritesTableTableAnnotationComposer,
      $$FavoritesTableTableCreateCompanionBuilder,
      $$FavoritesTableTableUpdateCompanionBuilder,
      (
        FavoritesTableData,
        BaseReferences<_$AppDatabase, $FavoritesTableTable, FavoritesTableData>,
      ),
      FavoritesTableData,
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
  $$SkillsTableTableTableManager get skillsTable =>
      $$SkillsTableTableTableManager(_db, _db.skillsTable);
  $$LanguagesTableTableTableManager get languagesTable =>
      $$LanguagesTableTableTableManager(_db, _db.languagesTable);
  $$InterestsTableTableTableManager get interestsTable =>
      $$InterestsTableTableTableManager(_db, _db.interestsTable);
  $$GoalsTableTableTableManager get goalsTable =>
      $$GoalsTableTableTableManager(_db, _db.goalsTable);
  $$PersonalityTraitsTableTableTableManager get personalityTraitsTable =>
      $$PersonalityTraitsTableTableTableManager(
        _db,
        _db.personalityTraitsTable,
      );
  $$ConversationStylesTableTableTableManager get conversationStylesTable =>
      $$ConversationStylesTableTableTableManager(
        _db,
        _db.conversationStylesTable,
      );
  $$DailyHabitsTableTableTableManager get dailyHabitsTable =>
      $$DailyHabitsTableTableTableManager(_db, _db.dailyHabitsTable);
  $$ValuesBeliefsTableTableTableManager get valuesBeliefsTable =>
      $$ValuesBeliefsTableTableTableManager(_db, _db.valuesBeliefsTable);
  $$DecisionProfilesTableTableTableManager get decisionProfilesTable =>
      $$DecisionProfilesTableTableTableManager(_db, _db.decisionProfilesTable);
  $$LifeStoriesTableTableTableManager get lifeStoriesTable =>
      $$LifeStoriesTableTableTableManager(_db, _db.lifeStoriesTable);
  $$TimelineTableTableTableManager get timelineTable =>
      $$TimelineTableTableTableManager(_db, _db.timelineTable);
  $$DailyJournalsTableTableTableManager get dailyJournalsTable =>
      $$DailyJournalsTableTableTableManager(_db, _db.dailyJournalsTable);
  $$MemoriesTableTableTableManager get memoriesTable =>
      $$MemoriesTableTableTableManager(_db, _db.memoriesTable);
  $$MemoryTagsTableTableTableManager get memoryTagsTable =>
      $$MemoryTagsTableTableTableManager(_db, _db.memoryTagsTable);
  $$MemoryLinksTableTableTableManager get memoryLinksTable =>
      $$MemoryLinksTableTableTableManager(_db, _db.memoryLinksTable);
  $$PhotosTableTableTableManager get photosTable =>
      $$PhotosTableTableTableManager(_db, _db.photosTable);
  $$PhotoAlbumsTableTableTableManager get photoAlbumsTable =>
      $$PhotoAlbumsTableTableTableManager(_db, _db.photoAlbumsTable);
  $$DocumentsTableTableTableManager get documentsTable =>
      $$DocumentsTableTableTableManager(_db, _db.documentsTable);
  $$AudioFilesTableTableTableManager get audioFilesTable =>
      $$AudioFilesTableTableTableManager(_db, _db.audioFilesTable);
  $$VoiceSettingsTableTableTableManager get voiceSettingsTable =>
      $$VoiceSettingsTableTableTableManager(_db, _db.voiceSettingsTable);
  $$LegacyMessagesTableTableTableManager get legacyMessagesTable =>
      $$LegacyMessagesTableTableTableManager(_db, _db.legacyMessagesTable);
  $$AiProvidersTableTableTableManager get aiProvidersTable =>
      $$AiProvidersTableTableTableManager(_db, _db.aiProvidersTable);
  $$AiSettingsTableTableTableManager get aiSettingsTable =>
      $$AiSettingsTableTableTableManager(_db, _db.aiSettingsTable);
  $$AvatarsTableTableTableManager get avatarsTable =>
      $$AvatarsTableTableTableManager(_db, _db.avatarsTable);
  $$ChatHistoryTableTableTableManager get chatHistoryTable =>
      $$ChatHistoryTableTableTableManager(_db, _db.chatHistoryTable);
  $$LifePlacesTableTableTableManager get lifePlacesTable =>
      $$LifePlacesTableTableTableManager(_db, _db.lifePlacesTable);
  $$FavoriteQuotesTableTableTableManager get favoriteQuotesTable =>
      $$FavoriteQuotesTableTableTableManager(_db, _db.favoriteQuotesTable);
  $$FavoriteWordsTableTableTableManager get favoriteWordsTable =>
      $$FavoriteWordsTableTableTableManager(_db, _db.favoriteWordsTable);
  $$FavoritesTableTableTableManager get favoritesTable =>
      $$FavoritesTableTableTableManager(_db, _db.favoritesTable);
}
