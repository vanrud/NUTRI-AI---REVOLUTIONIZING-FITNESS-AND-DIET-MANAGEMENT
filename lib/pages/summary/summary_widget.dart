import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'summary_model.dart';
export 'summary_model.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({super.key});

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  late SummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummaryModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Summary'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUMMARY_PAGE_Summary_ON_INIT_STATE');
      logFirebaseEvent('Summary_update_page_state');
      setState(() {
        _model.allergenSelection =
            (currentUserDocument?.allergens?.toList() ?? [])
                .toList()
                .cast<String>();
        _model.dietSelection = valueOrDefault(currentUserDocument?.diet, '');
        _model.ingredientSelection =
            (currentUserDocument?.ingredientDislikes?.toList() ?? [])
                .toList()
                .cast<String>();
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
    final chartPieChartColorsList = [
      Color(0xFF46E99C),
      Color(0xFF28BACB),
      Color(0xFF2536A4),
      Color(0xFFC14A67),
      Color(0xFFBA3335)
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: FutureBuilder<List<BasicDetailsRecord>>(
                      future: queryBasicDetailsRecordOnce(
                        queryBuilder: (basicDetailsRecord) => basicDetailsRecord
                            .orderBy('CreatedAt', descending: true),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<BasicDetailsRecord> columnBasicDetailsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final columnBasicDetailsRecord =
                            columnBasicDetailsRecordList.isNotEmpty
                                ? columnBasicDetailsRecordList.first
                                : null;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.customAppbarModel,
                              updateCallback: () => setState(() {}),
                              child: CustomAppbarWidget(
                                backButton: true,
                                actionButton: false,
                                optionsButton: false,
                                actionButtonAction: () async {},
                                optionsButtonAction: () async {},
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Text(
                                'Summary ',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Text(
                                    'YOUR BMI',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    functions
                                        .calculateBMI(
                                            columnBasicDetailsRecord?.weight,
                                            columnBasicDetailsRecord?.height,
                                            columnBasicDetailsRecord?.age,
                                            columnBasicDetailsRecord
                                                ?.sugarLevel)
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Text(
                                      'Your Total Daily Energy Expenditure',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Text(
                                  functions
                                      .calculateTotalEnergyExpenditure(
                                          columnBasicDetailsRecord?.age,
                                          columnBasicDetailsRecord?.height,
                                          columnBasicDetailsRecord?.weight,
                                          columnBasicDetailsRecord?.gender,
                                          columnBasicDetailsRecord
                                              ?.activityLevel)
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 25.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: FutureBuilder<List<BmiChartRecord>>(
                                  future: queryBmiChartRecordOnce(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 25.0,
                                          height: 25.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<BmiChartRecord>
                                        chartBmiChartRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: 173.0,
                                      height: 161.0,
                                      child: Stack(
                                        children: [
                                          FlutterFlowPieChart(
                                            data: FFPieChartData(
                                              values: chartBmiChartRecordList
                                                  .map((d) => d.bmiValue)
                                                  .toList(),
                                              colors: chartPieChartColorsList,
                                              radius: [70.0],
                                              borderColor: [Colors.white],
                                            ),
                                            donutHoleRadius: 0.0,
                                            donutHoleColor: Colors.transparent,
                                            sectionLabelType:
                                                PieChartSectionLabelType
                                                    .percent,
                                            sectionLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -25.0, -1.0),
                                            child: FlutterFlowChartLegendWidget(
                                              entries: chartBmiChartRecordList
                                                  .map((d) => d.bmiLevel)
                                                  .toList()
                                                  .asMap()
                                                  .entries
                                                  .map(
                                                    (label) => LegendEntry(
                                                      chartPieChartColorsList[label
                                                              .key %
                                                          chartPieChartColorsList
                                                              .length],
                                                      label.value,
                                                    ),
                                                  )
                                                  .toList(),
                                              width: 160.0,
                                              height: 98.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textPadding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              borderWidth: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              indicatorSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                            Text(
                              'What you should do ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                functions.displayHealthState(
                                    columnBasicDetailsRecord?.height,
                                    columnBasicDetailsRecord?.weight,
                                    columnBasicDetailsRecord?.age,
                                    columnBasicDetailsRecord?.sugarLevel),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 12.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'SUMMARY_CONTINUE_TO_SEE_YOUR_RECOMMENDED');
                    logFirebaseEvent('Button_haptic_feedback');
                    HapticFeedback.lightImpact();
                    logFirebaseEvent('Button_update_app_state');
                    setState(() {
                      FFAppState().userDiet = _model.dietSelection!;
                      FFAppState().userAllergens =
                          _model.allergenSelection.toList().cast<String>();
                      FFAppState().userIngredientDislikes =
                          _model.ingredientSelection.toList().cast<String>();
                    });
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed(
                      'RecfoodsAll',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: 'Continue to see your recommended food',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
