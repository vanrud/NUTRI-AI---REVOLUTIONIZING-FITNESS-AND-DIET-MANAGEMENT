import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PredFoodRecord extends FirestoreRecord {
  PredFoodRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Food_Name" field.
  String? _foodName;
  String get foodName => _foodName ?? '';
  bool hasFoodName() => _foodName != null;

  // "Glycemic_Index" field.
  int? _glycemicIndex;
  int get glycemicIndex => _glycemicIndex ?? 0;
  bool hasGlycemicIndex() => _glycemicIndex != null;

  // "Calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "Carbohydrates" field.
  double? _carbohydrates;
  double get carbohydrates => _carbohydrates ?? 0.0;
  bool hasCarbohydrates() => _carbohydrates != null;

  // "Protein" field.
  double? _protein;
  double get protein => _protein ?? 0.0;
  bool hasProtein() => _protein != null;

  // "Fat" field.
  double? _fat;
  double get fat => _fat ?? 0.0;
  bool hasFat() => _fat != null;

  // "Suitable_for_Diabetes" field.
  int? _suitableForDiabetes;
  int get suitableForDiabetes => _suitableForDiabetes ?? 0;
  bool hasSuitableForDiabetes() => _suitableForDiabetes != null;

  // "Suitable_for_Blood_Pressure" field.
  int? _suitableForBloodPressure;
  int get suitableForBloodPressure => _suitableForBloodPressure ?? 0;
  bool hasSuitableForBloodPressure() => _suitableForBloodPressure != null;

  // "Sodium_Content" field.
  int? _sodiumContent;
  int get sodiumContent => _sodiumContent ?? 0;
  bool hasSodiumContent() => _sodiumContent != null;

  // "Potassium_Content" field.
  int? _potassiumContent;
  int get potassiumContent => _potassiumContent ?? 0;
  bool hasPotassiumContent() => _potassiumContent != null;

  // "Magnesium_Content" field.
  int? _magnesiumContent;
  int get magnesiumContent => _magnesiumContent ?? 0;
  bool hasMagnesiumContent() => _magnesiumContent != null;

  // "Calcium_Content" field.
  int? _calciumContent;
  int get calciumContent => _calciumContent ?? 0;
  bool hasCalciumContent() => _calciumContent != null;

  // "Fiber_Content" field.
  double? _fiberContent;
  double get fiberContent => _fiberContent ?? 0.0;
  bool hasFiberContent() => _fiberContent != null;

  void _initializeFields() {
    _foodName = snapshotData['Food_Name'] as String?;
    _glycemicIndex = castToType<int>(snapshotData['Glycemic_Index']);
    _calories = castToType<int>(snapshotData['Calories']);
    _carbohydrates = castToType<double>(snapshotData['Carbohydrates']);
    _protein = castToType<double>(snapshotData['Protein']);
    _fat = castToType<double>(snapshotData['Fat']);
    _suitableForDiabetes =
        castToType<int>(snapshotData['Suitable_for_Diabetes']);
    _suitableForBloodPressure =
        castToType<int>(snapshotData['Suitable_for_Blood_Pressure']);
    _sodiumContent = castToType<int>(snapshotData['Sodium_Content']);
    _potassiumContent = castToType<int>(snapshotData['Potassium_Content']);
    _magnesiumContent = castToType<int>(snapshotData['Magnesium_Content']);
    _calciumContent = castToType<int>(snapshotData['Calcium_Content']);
    _fiberContent = castToType<double>(snapshotData['Fiber_Content']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pred_food');

  static Stream<PredFoodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PredFoodRecord.fromSnapshot(s));

  static Future<PredFoodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PredFoodRecord.fromSnapshot(s));

  static PredFoodRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PredFoodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PredFoodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PredFoodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PredFoodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PredFoodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPredFoodRecordData({
  String? foodName,
  int? glycemicIndex,
  int? calories,
  double? carbohydrates,
  double? protein,
  double? fat,
  int? suitableForDiabetes,
  int? suitableForBloodPressure,
  int? sodiumContent,
  int? potassiumContent,
  int? magnesiumContent,
  int? calciumContent,
  double? fiberContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Food_Name': foodName,
      'Glycemic_Index': glycemicIndex,
      'Calories': calories,
      'Carbohydrates': carbohydrates,
      'Protein': protein,
      'Fat': fat,
      'Suitable_for_Diabetes': suitableForDiabetes,
      'Suitable_for_Blood_Pressure': suitableForBloodPressure,
      'Sodium_Content': sodiumContent,
      'Potassium_Content': potassiumContent,
      'Magnesium_Content': magnesiumContent,
      'Calcium_Content': calciumContent,
      'Fiber_Content': fiberContent,
    }.withoutNulls,
  );

  return firestoreData;
}

class PredFoodRecordDocumentEquality implements Equality<PredFoodRecord> {
  const PredFoodRecordDocumentEquality();

  @override
  bool equals(PredFoodRecord? e1, PredFoodRecord? e2) {
    return e1?.foodName == e2?.foodName &&
        e1?.glycemicIndex == e2?.glycemicIndex &&
        e1?.calories == e2?.calories &&
        e1?.carbohydrates == e2?.carbohydrates &&
        e1?.protein == e2?.protein &&
        e1?.fat == e2?.fat &&
        e1?.suitableForDiabetes == e2?.suitableForDiabetes &&
        e1?.suitableForBloodPressure == e2?.suitableForBloodPressure &&
        e1?.sodiumContent == e2?.sodiumContent &&
        e1?.potassiumContent == e2?.potassiumContent &&
        e1?.magnesiumContent == e2?.magnesiumContent &&
        e1?.calciumContent == e2?.calciumContent &&
        e1?.fiberContent == e2?.fiberContent;
  }

  @override
  int hash(PredFoodRecord? e) => const ListEquality().hash([
        e?.foodName,
        e?.glycemicIndex,
        e?.calories,
        e?.carbohydrates,
        e?.protein,
        e?.fat,
        e?.suitableForDiabetes,
        e?.suitableForBloodPressure,
        e?.sodiumContent,
        e?.potassiumContent,
        e?.magnesiumContent,
        e?.calciumContent,
        e?.fiberContent
      ]);

  @override
  bool isValidKey(Object? o) => o is PredFoodRecord;
}
