import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recfoods_all_model.dart';
export 'recfoods_all_model.dart';

class RecfoodsAllWidget extends StatefulWidget {
  const RecfoodsAllWidget({super.key});

  @override
  State<RecfoodsAllWidget> createState() => _RecfoodsAllWidgetState();
}

class _RecfoodsAllWidgetState extends State<RecfoodsAllWidget>
    with TickerProviderStateMixin {
  late RecfoodsAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecfoodsAllModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'RecfoodsAll'});
    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1600.0.ms,
            begin: Offset(-350.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'markdownOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: Offset(-350.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'markdownOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 220.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-350.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'markdownOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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

    return FutureBuilder<List<BasicDetailsRecord>>(
      future: queryBasicDetailsRecordOnce(
        queryBuilder: (basicDetailsRecord) =>
            basicDetailsRecord.orderBy('CreatedAt', descending: true),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<BasicDetailsRecord> recfoodsAllBasicDetailsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final recfoodsAllBasicDetailsRecord =
            recfoodsAllBasicDetailsRecordList.isNotEmpty
                ? recfoodsAllBasicDetailsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('RECFOODS_ALL_arrow_back_rounded_ICN_ON_T');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    'Summary',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 220),
                      ),
                    },
                  );
                },
              ),
              title: Text(
                'Recommended Food',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 24.0, 24.0, 24.0),
                                  child: MarkdownBody(
                                    data: _model.responsebreakfast,
                                    selectable: true,
                                    onTapLink: (_, url, __) => launchURL(url!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'RECFOODS_ALL_PAGE_BREAKFAST_BTN_ON_TAP');
                            logFirebaseEvent('Button_gemini');
                            await geminiGenerateText(
                              context,
                              'Give/recommend one Indian Food   for breakfast with only their name  based on Sugar Level${recfoodsAllBasicDetailsRecord?.sugarLevel?.toString()}and BMI${valueOrDefault<String>(
                                functions
                                    .calculateBMI(
                                        recfoodsAllBasicDetailsRecord?.weight,
                                        recfoodsAllBasicDetailsRecord?.height,
                                        recfoodsAllBasicDetailsRecord?.age,
                                        recfoodsAllBasicDetailsRecord
                                            ?.sugarLevel)
                                    .toString(),
                                '0',
                              )}and Total Daily energy expenditure ${functions.calculateTotalEnergyExpenditure(recfoodsAllBasicDetailsRecord?.age, recfoodsAllBasicDetailsRecord?.height, recfoodsAllBasicDetailsRecord?.weight, recfoodsAllBasicDetailsRecord?.gender, recfoodsAllBasicDetailsRecord?.activityLevel).toString()}. Also Display the food in bold . The Food name should be given and nothing else.',
                            ).then((generatedText) {
                              safeSetState(
                                  () => _model.breakfastResult = generatedText);
                            });

                            logFirebaseEvent('Button_update_page_state');
                            setState(() {
                              _model.responsebreakfast =
                                  _model.breakfastResult!;
                            });
                            logFirebaseEvent('Button_update_app_state');
                            setState(() {
                              FFAppState().Breakfast = _model.responsebreakfast;
                            });

                            setState(() {});
                          },
                          text: 'Breakfast',
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 55.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation1']!),
                  ),
                  Expanded(
                    child: MarkdownBody(
                      data: _model.bfcal,
                      selectable: true,
                      onTapLink: (_, url, __) => launchURL(url!),
                    ).animateOnPageLoad(
                        animationsMap['markdownOnPageLoadAnimation1']!),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 24.0, 24.0, 24.0),
                                  child: MarkdownBody(
                                    data: _model.responseLunch,
                                    selectable: true,
                                    onTapLink: (_, url, __) => launchURL(url!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'RECFOODS_ALL_PAGE_LUNCH_BTN_ON_TAP');
                            logFirebaseEvent('Button_gemini');
                            await geminiGenerateText(
                              context,
                              'Give one Indian Food    for Lunch  with only their name  based on Sugar Level${recfoodsAllBasicDetailsRecord?.sugarLevel?.toString()}and BMI${valueOrDefault<String>(
                                functions
                                    .calculateBMI(
                                        recfoodsAllBasicDetailsRecord?.weight,
                                        recfoodsAllBasicDetailsRecord?.height,
                                        recfoodsAllBasicDetailsRecord?.age,
                                        recfoodsAllBasicDetailsRecord
                                            ?.sugarLevel)
                                    .toString(),
                                '0',
                              )}and Total Daily energy expenditure ${functions.calculateTotalEnergyExpenditure(recfoodsAllBasicDetailsRecord?.age, recfoodsAllBasicDetailsRecord?.height, recfoodsAllBasicDetailsRecord?.weight, recfoodsAllBasicDetailsRecord?.gender, recfoodsAllBasicDetailsRecord?.activityLevel).toString()}. Also Display the food in bold . The Food name should be given and nothing else.',
                            ).then((generatedText) {
                              safeSetState(
                                  () => _model.lunchResult = generatedText);
                            });

                            logFirebaseEvent('Button_update_page_state');
                            setState(() {
                              _model.responseLunch = _model.lunchResult!;
                            });
                            logFirebaseEvent('Button_update_app_state');
                            setState(() {
                              FFAppState().Lunch = _model.responseLunch;
                            });

                            setState(() {});
                          },
                          text: '   Lunch   ',
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 55.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation2']!),
                  ),
                  Expanded(
                    child: MarkdownBody(
                      data: _model.luncal,
                      selectable: true,
                      onTapLink: (_, url, __) => launchURL(url!),
                    ).animateOnPageLoad(
                        animationsMap['markdownOnPageLoadAnimation2']!),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 24.0, 24.0, 24.0),
                                  child: MarkdownBody(
                                    data: _model.responsedinner,
                                    selectable: true,
                                    onTapLink: (_, url, __) => launchURL(url!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'RECFOODS_ALL_PAGE_DINNER_BTN_ON_TAP');
                            logFirebaseEvent('Button_gemini');
                            await geminiGenerateText(
                              context,
                              'Give one Indian Food    for Dinner  with only their name  based on Sugar Level${recfoodsAllBasicDetailsRecord?.sugarLevel?.toString()}and BMI${valueOrDefault<String>(
                                functions
                                    .calculateBMI(
                                        recfoodsAllBasicDetailsRecord?.weight,
                                        recfoodsAllBasicDetailsRecord?.height,
                                        recfoodsAllBasicDetailsRecord?.age,
                                        recfoodsAllBasicDetailsRecord
                                            ?.sugarLevel)
                                    .toString(),
                                '0',
                              )}and Total Daily energy expenditure ${functions.calculateTotalEnergyExpenditure(recfoodsAllBasicDetailsRecord?.age, recfoodsAllBasicDetailsRecord?.height, recfoodsAllBasicDetailsRecord?.weight, recfoodsAllBasicDetailsRecord?.gender, recfoodsAllBasicDetailsRecord?.activityLevel).toString()}. Also Display the food in bold . The Food name should be given and nothing else.',
                            ).then((generatedText) {
                              safeSetState(
                                  () => _model.dinnerResult = generatedText);
                            });

                            logFirebaseEvent('Button_update_page_state');
                            setState(() {
                              _model.responsedinner = _model.dinnerResult!;
                            });
                            logFirebaseEvent('Button_update_app_state');
                            setState(() {
                              FFAppState().Dinner = _model.responsedinner;
                            });

                            setState(() {});
                          },
                          text: 'Dinner',
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 55.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation3']!),
                  ),
                  Expanded(
                    child: MarkdownBody(
                      data: _model.dincal,
                      selectable: true,
                      onTapLink: (_, url, __) => launchURL(url!),
                    ).animateOnPageLoad(
                        animationsMap['markdownOnPageLoadAnimation3']!),
                  ),
                  if (_model.responsebreakfast != 'null')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'RECFOODS_ALL_CALCULATE_TOTAL_CALORIES_BT');
                          logFirebaseEvent('Button_gemini');
                          await geminiGenerateText(
                            context,
                            'Give the Calories in integer For ${_model.responsebreakfast}. Dont give any units, just the number.Dont give range.it should have corrent calorie count .where it should be close or in range of 300-500 calories.Give the exact calorie .',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.breakfastCal = generatedText);
                          });

                          logFirebaseEvent('Button_gemini');
                          await geminiGenerateText(
                            context,
                            'Give the Calories  in integer  For ${_model.responseLunch}. Dont give any units, just the number.Dont give range.it should have corrent calorie count .where it should be close or in range of 300-500 calories.Give the exact calorie .',
                          ).then((generatedText) {
                            safeSetState(() => _model.lunchCal = generatedText);
                          });

                          logFirebaseEvent('Button_gemini');
                          await geminiGenerateText(
                            context,
                            'Give the Calories  in integer  For ${_model.responsedinner}. Dont give any units, just the number.Dont give range.it should have corrent calorie count .where it should be close or in range of 300-500 calories.Give the exact calorie .',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.dinnerCal = generatedText);
                          });

                          logFirebaseEvent('Button_update_page_state');
                          setState(() {
                            _model.bfcal = _model.breakfastCal!;
                            _model.luncal = _model.lunchCal!;
                            _model.dincal = _model.dinnerCal!;
                          });
                          logFirebaseEvent('Button_update_app_state');
                          setState(() {
                            FFAppState().bfcalo = _model.breakfastCal!;
                            FFAppState().luncalo = _model.lunchCal!;
                            FFAppState().dincalo = _model.dinnerCal!;
                          });
                          logFirebaseEvent('Button_gemini');
                          await geminiGenerateText(
                            context,
                            'Give only th total of these. add these number.:  ${FFAppState().bfcalo}+${FFAppState().luncalo}  +  ${FFAppState().dincalo}. Give only the integer number . dont give any units or anything else',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.totalcalo = generatedText);
                          });

                          logFirebaseEvent('Button_update_app_state');
                          setState(() {
                            FFAppState().totalcalo = _model.totalcalo!;
                          });

                          setState(() {});
                        },
                        text: 'Calculate Total Calories',
                        options: FFButtonOptions(
                          height: 61.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          160.0, 100.0, 0.0, 110.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'RECFOODS_ALL_GO_TO_DASHBOARD_>_BTN_ON_TA');
                          logFirebaseEvent('Button_navigate_to');

                          context.goNamed(
                            'Dashboard',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: 'Go To Dashboard ->',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
