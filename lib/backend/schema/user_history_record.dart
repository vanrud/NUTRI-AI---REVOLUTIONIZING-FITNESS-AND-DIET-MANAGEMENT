import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserHistoryRecord extends FirestoreRecord {
  UserHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "BMI" field.
  int? _bmi;
  int get bmi => _bmi ?? 0;
  bool hasBmi() => _bmi != null;

  // "SugarLevel" field.
  int? _sugarLevel;
  int get sugarLevel => _sugarLevel ?? 0;
  bool hasSugarLevel() => _sugarLevel != null;

  // "RecFood" field.
  List<String>? _recFood;
  List<String> get recFood => _recFood ?? const [];
  bool hasRecFood() => _recFood != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "breakfast" field.
  String? _breakfast;
  String get breakfast => _breakfast ?? '';
  bool hasBreakfast() => _breakfast != null;

  // "SuagrList" field.
  List<int>? _suagrList;
  List<int> get suagrList => _suagrList ?? const [];
  bool hasSuagrList() => _suagrList != null;

  void _initializeFields() {
    _bmi = castToType<int>(snapshotData['BMI']);
    _sugarLevel = castToType<int>(snapshotData['SugarLevel']);
    _recFood = getDataList(snapshotData['RecFood']);
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _breakfast = snapshotData['breakfast'] as String?;
    _suagrList = getDataList(snapshotData['SuagrList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserHistory');

  static Stream<UserHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserHistoryRecord.fromSnapshot(s));

  static Future<UserHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserHistoryRecord.fromSnapshot(s));

  static UserHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserHistoryRecordData({
  int? bmi,
  int? sugarLevel,
  DateTime? createdAt,
  String? breakfast,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'BMI': bmi,
      'SugarLevel': sugarLevel,
      'CreatedAt': createdAt,
      'breakfast': breakfast,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserHistoryRecordDocumentEquality implements Equality<UserHistoryRecord> {
  const UserHistoryRecordDocumentEquality();

  @override
  bool equals(UserHistoryRecord? e1, UserHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bmi == e2?.bmi &&
        e1?.sugarLevel == e2?.sugarLevel &&
        listEquality.equals(e1?.recFood, e2?.recFood) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.breakfast == e2?.breakfast &&
        listEquality.equals(e1?.suagrList, e2?.suagrList);
  }

  @override
  int hash(UserHistoryRecord? e) => const ListEquality().hash([
        e?.bmi,
        e?.sugarLevel,
        e?.recFood,
        e?.createdAt,
        e?.breakfast,
        e?.suagrList
      ]);

  @override
  bool isValidKey(Object? o) => o is UserHistoryRecord;
}
