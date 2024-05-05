import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'basic_details_widget.dart' show BasicDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasicDetailsModel extends FlutterFlowModel<BasicDetailsWidget> {
  ///  Local state fields for this page.

  List<String> allergenSelection = [];
  void addToAllergenSelection(String item) => allergenSelection.add(item);
  void removeFromAllergenSelection(String item) =>
      allergenSelection.remove(item);
  void removeAtIndexFromAllergenSelection(int index) =>
      allergenSelection.removeAt(index);
  void insertAtIndexInAllergenSelection(int index, String item) =>
      allergenSelection.insert(index, item);
  void updateAllergenSelectionAtIndex(int index, Function(String) updateFn) =>
      allergenSelection[index] = updateFn(allergenSelection[index]);

  String? dietSelection;

  List<String> ingredientSelection = [];
  void addToIngredientSelection(String item) => ingredientSelection.add(item);
  void removeFromIngredientSelection(String item) =>
      ingredientSelection.remove(item);
  void removeAtIndexFromIngredientSelection(int index) =>
      ingredientSelection.removeAt(index);
  void insertAtIndexInIngredientSelection(int index, String item) =>
      ingredientSelection.insert(index, item);
  void updateIngredientSelectionAtIndex(int index, Function(String) updateFn) =>
      ingredientSelection[index] = updateFn(ingredientSelection[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // State field(s) for sugarLevel widget.
  FocusNode? sugarLevelFocusNode;
  TextEditingController? sugarLevelTextController;
  String? Function(BuildContext, String?)? sugarLevelTextControllerValidator;
  String? _sugarLevelTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  String? _heightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  String? _ageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for activityLevel widget.
  String? activityLevelValue;
  FormFieldController<String>? activityLevelValueController;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    sugarLevelTextControllerValidator = _sugarLevelTextControllerValidator;
    weightTextControllerValidator = _weightTextControllerValidator;
    heightTextControllerValidator = _heightTextControllerValidator;
    ageTextControllerValidator = _ageTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
    sugarLevelFocusNode?.dispose();
    sugarLevelTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();
  }
}
