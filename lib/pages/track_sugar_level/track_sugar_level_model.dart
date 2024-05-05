import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'track_sugar_level_widget.dart' show TrackSugarLevelWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackSugarLevelModel extends FlutterFlowModel<TrackSugarLevelWidget> {
  ///  Local state fields for this page.

  List<int> sugarlvlhistory = [];
  void addToSugarlvlhistory(int item) => sugarlvlhistory.add(item);
  void removeFromSugarlvlhistory(int item) => sugarlvlhistory.remove(item);
  void removeAtIndexFromSugarlvlhistory(int index) =>
      sugarlvlhistory.removeAt(index);
  void insertAtIndexInSugarlvlhistory(int index, int item) =>
      sugarlvlhistory.insert(index, item);
  void updateSugarlvlhistoryAtIndex(int index, Function(int) updateFn) =>
      sugarlvlhistory[index] = updateFn(sugarlvlhistory[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for sugarLevel widget.
  FocusNode? sugarLevelFocusNode;
  TextEditingController? sugarLevelTextController;
  String? Function(BuildContext, String?)? sugarLevelTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sugarLevelFocusNode?.dispose();
    sugarLevelTextController?.dispose();
  }
}
