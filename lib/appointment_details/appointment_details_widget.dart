import '../backend/backend.dart';
import '../components/edit_booking_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentDetailsWidget extends StatefulWidget {
  AppointmentDetailsWidget({
    Key key,
    this.appointmentDetails,
  }) : super(key: key);

  final DocumentReference appointmentDetails;

  @override
  _AppointmentDetailsWidgetState createState() =>
      _AppointmentDetailsWidgetState();
}

class _AppointmentDetailsWidgetState extends State<AppointmentDetailsWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppointmentsRecord>(
      stream: AppointmentsRecord.getDocument(widget.appointmentDetails),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitPumpingHeart(
                color: FlutterFlowTheme.primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final appointmentDetailsAppointmentsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.background,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.grayLight,
                size: 32,
              ),
            ),
            title: Text(
              'Details',
              style: FlutterFlowTheme.title3.override(
                fontFamily: 'Lexend Deca',
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.background,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Type of Appointment',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          appointmentDetailsAppointmentsRecord.appointmentType,
                          style: FlutterFlowTheme.title3.override(
                            fontFamily: 'Lexend Deca',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'What’s the problem?',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          appointmentDetailsAppointmentsRecord
                              .appointmentDescription,
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'For',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<AppointmentsRecord>(
                        stream: AppointmentsRecord.getDocument(
                            appointmentDetailsAppointmentsRecord.reference),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: SpinKitPumpingHeart(
                                  color: FlutterFlowTheme.primaryColor,
                                  size: 40,
                                ),
                              ),
                            );
                          }
                          final containerAppointmentsRecord = snapshot.data;
                          return Material(
                            color: Colors.transparent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.darkBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.primaryColor,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/UI_avatar_2@3x.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                appointmentDetailsAppointmentsRecord
                                                    .appointmentName,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .textColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            appointmentDetailsAppointmentsRecord
                                                .appointmentEmail,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Text(
                            'When',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          dateTimeFormat(
                              'MMMMEEEEd',
                              appointmentDetailsAppointmentsRecord
                                  .appointmentTime),
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 28, 0, 36),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => _loadingButton1 = true);
                      try {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 720,
                              child: EditBookingWidget(
                                userAppointment:
                                    appointmentDetailsAppointmentsRecord,
                              ),
                            );
                          },
                        );
                      } finally {
                        setState(() => _loadingButton1 = false);
                      }
                    },
                    text: 'Reschedule',
                    options: FFButtonOptions(
                      width: 300,
                      height: 60,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                    loading: _loadingButton1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => _loadingButton2 = true);
                      try {
                        await appointmentDetailsAppointmentsRecord.reference
                            .delete();
                        Navigator.pop(context);
                      } finally {
                        setState(() => _loadingButton2 = false);
                      }
                    },
                    text: 'Cancel Appointment',
                    options: FFButtonOptions(
                      width: 230,
                      height: 50,
                      color: FlutterFlowTheme.darkBackground,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                    loading: _loadingButton2,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
