import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BmiChartRecord extends FirestoreRecord {
  BmiChartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bmiLevel" field.
  String? _bmiLevel;
  String get bmiLevel => _bmiLevel ?? '';
  bool hasBmiLevel() => _bmiLevel != null;

  // "bmiValue" field.
  String? _bmiValue;
  String get bmiValue => _bmiValue ?? '';
  bool hasBmiValue() => _bmiValue != null;

  void _initializeFields() {
    _bmiLevel = snapshotData['bmiLevel'] as String?;
    _bmiValue = snapshotData['bmiValue'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BmiChart');

  static Stream<BmiChartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BmiChartRecord.fromSnapshot(s));

  static Future<BmiChartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BmiChartRecord.fromSnapshot(s));

  static BmiChartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BmiChartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BmiChartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BmiChartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BmiChartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BmiChartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBmiChartRecordData({
  String? bmiLevel,
  String? bmiValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bmiLevel': bmiLevel,
      'bmiValue': bmiValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class BmiChartRecordDocumentEquality implements Equality<BmiChartRecord> {
  const BmiChartRecordDocumentEquality();

  @override
  bool equals(BmiChartRecord? e1, BmiChartRecord? e2) {
    return e1?.bmiLevel == e2?.bmiLevel && e1?.bmiValue == e2?.bmiValue;
  }

  @override
  int hash(BmiChartRecord? e) =>
      const ListEquality().hash([e?.bmiLevel, e?.bmiValue]);

  @override
  bool isValidKey(Object? o) => o is BmiChartRecord;
}
