import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'recfoods_all_widget.dart' show RecfoodsAllWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecfoodsAllModel extends FlutterFlowModel<RecfoodsAllWidget> {
  ///  Local state fields for this page.

  String responsebreakfast = 'null';

  String responseLunch = 'null';

  String responsedinner = 'null';

  String bfcal = '0';

  String luncal = '0';

  String dincal = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? breakfastResult;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? lunchResult;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? dinnerResult;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? breakfastCal;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? lunchCal;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? dinnerCal;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? totalcalo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
