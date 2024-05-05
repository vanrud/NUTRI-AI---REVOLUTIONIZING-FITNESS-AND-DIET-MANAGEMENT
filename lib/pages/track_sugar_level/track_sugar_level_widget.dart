import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'track_sugar_level_model.dart';
export 'track_sugar_level_model.dart';

class TrackSugarLevelWidget extends StatefulWidget {
  const TrackSugarLevelWidget({super.key});

  @override
  State<TrackSugarLevelWidget> createState() => _TrackSugarLevelWidgetState();
}

class _TrackSugarLevelWidgetState extends State<TrackSugarLevelWidget> {
  late TrackSugarLevelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackSugarLevelModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TrackSugarLevel'});
    _model.sugarLevelTextController ??= TextEditingController();
    _model.sugarLevelFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Text(
                      'Enter Your Current Sugar Level',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 18.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  'Sugar Level',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.sugarLevelTextController,
                                  focusNode: _model.sugarLevelFocusNode,
                                  autofocus: false,
                                  autofillHints: [AutofillHints.name],
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Enter sugar level',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.0,
                                      ),
                                  minLines: 1,
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  validator: _model
                                      .sugarLevelTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: StreamBuilder<List<UserHistoryRecord>>(
                            stream: queryUserHistoryRecord(
                              queryBuilder: (userHistoryRecord) =>
                                  userHistoryRecord.orderBy('CreatedAt',
                                      descending: true),
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
                              List<UserHistoryRecord>
                                  buttonUserHistoryRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonUserHistoryRecord =
                                  buttonUserHistoryRecordList.isNotEmpty
                                      ? buttonUserHistoryRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'TRACK_SUGAR_LEVEL_GET_HISTORY_BTN_ON_TAP');
                                  logFirebaseEvent('Button_backend_call');

                                  await SugarHistRecord.collection.doc().set({
                                    ...createSugarHistRecordData(
                                      sugarlvlhistory: int.tryParse(
                                          _model.sugarLevelTextController.text),
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'createdAt':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Button_update_page_state');
                                  setState(() {
                                    _model.addToSugarlvlhistory(int.parse(
                                        _model.sugarLevelTextController.text));
                                  });
                                },
                                text: 'Get history',
                                options: FFButtonOptions(
                                  height: 40.0,
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
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  StreamBuilder<List<SugarHistRecord>>(
                    stream: querySugarHistRecord(
                      queryBuilder: (sugarHistRecord) => sugarHistRecord
                          .orderBy('createdAt', descending: true),
                      limit: 5,
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
                      List<SugarHistRecord> listViewSugarHistRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewSugarHistRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewSugarHistRecord =
                              listViewSugarHistRecordList[listViewIndex];
                          return Text(
                            listViewSugarHistRecord.sugarlvlhistory.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          );
                        },
                      );
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  StreamBuilder<List<SugarHistRecord>>(
                    stream: querySugarHistRecord(
                      queryBuilder: (sugarHistRecord) => sugarHistRecord
                          .orderBy('createdAt', descending: true),
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
                      List<SugarHistRecord> chartSugarHistRecordList =
                          snapshot.data!;
                      return Container(
                        height: 230.0,
                        child: Stack(
                          children: [
                            FlutterFlowLineChart(
                              data: [
                                FFLineChartData(
                                  xData: chartSugarHistRecordList
                                      .map((d) => d.createdAt)
                                      .toList(),
                                  yData: chartSugarHistRecordList
                                      .map((d) => d.sugarlvlhistory)
                                      .toList(),
                                  settings: LineChartBarData(
                                    color: FlutterFlowTheme.of(context).primary,
                                    barWidth: 2.0,
                                    isCurved: true,
                                    dotData: FlDotData(show: false),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                    ),
                                  ),
                                )
                              ],
                              chartStylingInfo: ChartStylingInfo(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderWidth: 1.0,
                              ),
                              axisBounds: AxisBounds(),
                              xAxisLabelInfo: AxisLabelInfo(
                                title: 'Time ',
                                titleTextStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              yAxisLabelInfo: AxisLabelInfo(
                                title: 'Sugar Level',
                                titleTextStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: FlutterFlowChartLegendWidget(
                                entries: [
                                  LegendEntry(
                                      FlutterFlowTheme.of(context).primary,
                                      'Legend 1'),
                                ],
                                width: 100.0,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                textPadding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                borderWidth: 1.0,
                                borderColor: Colors.black,
                                indicatorSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
