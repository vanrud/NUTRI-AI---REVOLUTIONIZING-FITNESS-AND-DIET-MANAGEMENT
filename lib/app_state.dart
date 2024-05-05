import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userDiet = '';
  String get userDiet => _userDiet;
  set userDiet(String _value) {
    _userDiet = _value;
  }

  List<String> _userAllergens = [];
  List<String> get userAllergens => _userAllergens;
  set userAllergens(List<String> _value) {
    _userAllergens = _value;
  }

  void addToUserAllergens(String _value) {
    _userAllergens.add(_value);
  }

  void removeFromUserAllergens(String _value) {
    _userAllergens.remove(_value);
  }

  void removeAtIndexFromUserAllergens(int _index) {
    _userAllergens.removeAt(_index);
  }

  void updateUserAllergensAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _userAllergens[_index] = updateFn(_userAllergens[_index]);
  }

  void insertAtIndexInUserAllergens(int _index, String _value) {
    _userAllergens.insert(_index, _value);
  }

  List<String> _userIngredientDislikes = [];
  List<String> get userIngredientDislikes => _userIngredientDislikes;
  set userIngredientDislikes(List<String> _value) {
    _userIngredientDislikes = _value;
  }

  void addToUserIngredientDislikes(String _value) {
    _userIngredientDislikes.add(_value);
  }

  void removeFromUserIngredientDislikes(String _value) {
    _userIngredientDislikes.remove(_value);
  }

  void removeAtIndexFromUserIngredientDislikes(int _index) {
    _userIngredientDislikes.removeAt(_index);
  }

  void updateUserIngredientDislikesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _userIngredientDislikes[_index] = updateFn(_userIngredientDislikes[_index]);
  }

  void insertAtIndexInUserIngredientDislikes(int _index, String _value) {
    _userIngredientDislikes.insert(_index, _value);
  }

  int _sugarLevelHistory = 0;
  int get sugarLevelHistory => _sugarLevelHistory;
  set sugarLevelHistory(int _value) {
    _sugarLevelHistory = _value;
  }

  List<DocumentReference> _sugarLst = [];
  List<DocumentReference> get sugarLst => _sugarLst;
  set sugarLst(List<DocumentReference> _value) {
    _sugarLst = _value;
  }

  void addToSugarLst(DocumentReference _value) {
    _sugarLst.add(_value);
  }

  void removeFromSugarLst(DocumentReference _value) {
    _sugarLst.remove(_value);
  }

  void removeAtIndexFromSugarLst(int _index) {
    _sugarLst.removeAt(_index);
  }

  void updateSugarLstAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _sugarLst[_index] = updateFn(_sugarLst[_index]);
  }

  void insertAtIndexInSugarLst(int _index, DocumentReference _value) {
    _sugarLst.insert(_index, _value);
  }

  int _SugarHistList = 0;
  int get SugarHistList => _SugarHistList;
  set SugarHistList(int _value) {
    _SugarHistList = _value;
  }

  String _Breakfast = '';
  String get Breakfast => _Breakfast;
  set Breakfast(String _value) {
    _Breakfast = _value;
  }

  String _Lunch = '';
  String get Lunch => _Lunch;
  set Lunch(String _value) {
    _Lunch = _value;
  }

  String _Dinner = '';
  String get Dinner => _Dinner;
  set Dinner(String _value) {
    _Dinner = _value;
  }

  String _bfcalo = '';
  String get bfcalo => _bfcalo;
  set bfcalo(String _value) {
    _bfcalo = _value;
  }

  String _luncalo = '';
  String get luncalo => _luncalo;
  set luncalo(String _value) {
    _luncalo = _value;
  }

  String _dincalo = '';
  String get dincalo => _dincalo;
  set dincalo(String _value) {
    _dincalo = _value;
  }

  String _totalcalo = '';
  String get totalcalo => _totalcalo;
  set totalcalo(String _value) {
    _totalcalo = _value;
  }
}
