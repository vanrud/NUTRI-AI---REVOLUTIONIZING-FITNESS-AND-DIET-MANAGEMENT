import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BasicDetailsRecord extends FirestoreRecord {
  BasicDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sugarLevel" field.
  int? _sugarLevel;
  int get sugarLevel => _sugarLevel ?? 0;
  bool hasSugarLevel() => _sugarLevel != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "activityLevel" field.
  String? _activityLevel;
  String get activityLevel => _activityLevel ?? '';
  bool hasActivityLevel() => _activityLevel != null;

  // "BMI" field.
  int? _bmi;
  int get bmi => _bmi ?? 0;
  bool hasBmi() => _bmi != null;

  void _initializeFields() {
    _sugarLevel = castToType<int>(snapshotData['sugarLevel']);
    _weight = castToType<int>(snapshotData['weight']);
    _height = castToType<int>(snapshotData['height']);
    _age = castToType<int>(snapshotData['age']);
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _activityLevel = snapshotData['activityLevel'] as String?;
    _bmi = castToType<int>(snapshotData['BMI']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('basicDetails');

  static Stream<BasicDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BasicDetailsRecord.fromSnapshot(s));

  static Future<BasicDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BasicDetailsRecord.fromSnapshot(s));

  static BasicDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BasicDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BasicDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BasicDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BasicDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BasicDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBasicDetailsRecordData({
  int? sugarLevel,
  int? weight,
  int? height,
  int? age,
  DateTime? createdAt,
  String? gender,
  String? activityLevel,
  int? bmi,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sugarLevel': sugarLevel,
      'weight': weight,
      'height': height,
      'age': age,
      'CreatedAt': createdAt,
      'gender': gender,
      'activityLevel': activityLevel,
      'BMI': bmi,
    }.withoutNulls,
  );

  return firestoreData;
}

class BasicDetailsRecordDocumentEquality
    implements Equality<BasicDetailsRecord> {
  const BasicDetailsRecordDocumentEquality();

  @override
  bool equals(BasicDetailsRecord? e1, BasicDetailsRecord? e2) {
    return e1?.sugarLevel == e2?.sugarLevel &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.age == e2?.age &&
        e1?.createdAt == e2?.createdAt &&
        e1?.gender == e2?.gender &&
        e1?.activityLevel == e2?.activityLevel &&
        e1?.bmi == e2?.bmi;
  }

  @override
  int hash(BasicDetailsRecord? e) => const ListEquality().hash([
        e?.sugarLevel,
        e?.weight,
        e?.height,
        e?.age,
        e?.createdAt,
        e?.gender,
        e?.activityLevel,
        e?.bmi
      ]);

  @override
  bool isValidKey(Object? o) => o is BasicDetailsRecord;
}
