import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SugarHistRecord extends FirestoreRecord {
  SugarHistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Sugarlvlhistory" field.
  int? _sugarlvlhistory;
  int get sugarlvlhistory => _sugarlvlhistory ?? 0;
  bool hasSugarlvlhistory() => _sugarlvlhistory != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _sugarlvlhistory = castToType<int>(snapshotData['Sugarlvlhistory']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SugarHist');

  static Stream<SugarHistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SugarHistRecord.fromSnapshot(s));

  static Future<SugarHistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SugarHistRecord.fromSnapshot(s));

  static SugarHistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SugarHistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SugarHistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SugarHistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SugarHistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SugarHistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSugarHistRecordData({
  int? sugarlvlhistory,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Sugarlvlhistory': sugarlvlhistory,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SugarHistRecordDocumentEquality implements Equality<SugarHistRecord> {
  const SugarHistRecordDocumentEquality();

  @override
  bool equals(SugarHistRecord? e1, SugarHistRecord? e2) {
    return e1?.sugarlvlhistory == e2?.sugarlvlhistory &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(SugarHistRecord? e) =>
      const ListEquality().hash([e?.sugarlvlhistory, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is SugarHistRecord;
}
