import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/components/custom_appbar_widget.dart';
import '/components/meal_bottom_sheet/meal_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dinnerreci_model.dart';
export 'dinnerreci_model.dart';

class DinnerreciWidget extends StatefulWidget {
  const DinnerreciWidget({
    super.key,
    this.mealRef,
  });

  final MealsRecord? mealRef;

  @override
  State<DinnerreciWidget> createState() => _DinnerreciWidgetState();
}

class _DinnerreciWidgetState extends State<DinnerreciWidget> {
  late DinnerreciModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DinnerreciModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dinnerreci'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DINNERRECI_PAGE_Dinnerreci_ON_INIT_STATE');
      logFirebaseEvent('Dinnerreci_gemini');
      await geminiGenerateText(
        context,
        'Give ingredients in a list for ${FFAppState().Dinner}with ${FFAppState().dincalo}Calories . ',
      ).then((generatedText) {
        safeSetState(() => _model.ingre3 = generatedText);
      });

      logFirebaseEvent('Dinnerreci_gemini');
      await geminiGenerateText(
        context,
        'Give reciepe for ${FFAppState().Dinner}based on the ingredients${_model.ingre3}. give only in 80 words .',
      ).then((generatedText) {
        safeSetState(() => _model.reciepe = generatedText);
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 54.0, 24.0, 0.0),
                    child: wrapWithModel(
                      model: _model.customAppbarModel,
                      updateCallback: () => setState(() {}),
                      child: CustomAppbarWidget(
                        backButton: true,
                        actionButton: false,
                        optionsButton: true,
                        actionButtonAction: () async {},
                        optionsButtonAction: () async {
                          logFirebaseEvent(
                              'DINNERRECI_Container_p5kmpbps_CALLBACK');
                          logFirebaseEvent('customAppbar_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Color(0x00FFFFFF),
                            barrierColor: Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: MealBottomSheetWidget(
                                    mealRef: widget.mealRef,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF23872C),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: MarkdownBody(
                                data: '# ${FFAppState().Dinner}',
                                selectable: false,
                                onTapLink: (_, url, __) => launchURL(url!),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  '${FFAppState().dincalo} Calories',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 349.0,
              height: 260.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MarkdownBody(
                      data: _model.ingre3!,
                      selectable: true,
                      onTapLink: (_, url, __) => launchURL(url!),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 5.0,
              color: Color(0x650DDD5B),
            ),
            Container(
              width: 349.0,
              height: 276.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MarkdownBody(
                      data: _model.reciepe!,
                      selectable: true,
                      onTapLink: (_, url, __) => launchURL(url!),
                    ),
                  ],
                ),
              ),
            ),
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('DINNERRECI_PAGE_ShareMealTile_ON_TAP');
                  logFirebaseEvent('ShareMealTile_share');
                  await Share.share(
                    'Check out this amazing recipe for ${FFAppState().Dinner}! Here are the ingredients: ${_model.ingre3}! Here is  the Reciepe:${_model.reciepe}',
                    sharePositionOrigin: getWidgetBoundingBox(context),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'Share meal details',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DINNERRECI_Container_oufd31oy_ON_TAP');
                                    logFirebaseEvent('Container_share');
                                    await Share.share(
                                      'Check out this amazing recipe for ${FFAppState().Dinner}! Here are the ingredients: ${_model.ingre3}! Here is  the Reciepe:${_model.reciepe}',
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(context),
                                    );
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.share_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
