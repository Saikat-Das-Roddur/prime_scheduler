import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:prime_scheduler/bloc/schedules_bloc.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/schedules.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/view_schedule.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'active_details.dart';

class ScheduleLists extends StatefulWidget {
  User? user;

  ScheduleLists({Key? key, this.user}) : super(key: key);

  @override
  _ScheduleListsState createState() => _ScheduleListsState();
}

class _ScheduleListsState extends State<ScheduleLists> {
  int _day = DateTime.now().day;
  int _month = DateTime.now().month;
  String? employee = "0";
  Schedules? _schedules;

  SchedulesBloc? _schedulesBloc;
  ProgressDialog? _progressDialog;

  @override
  void initState() {
    super.initState();
    _schedulesBloc = SchedulesBloc();
    _progressDialog = ProgressDialog(context, isDismissible: false);

    _schedulesBloc
        ?.getSchedules(widget.user?.id, "${DateTime.now().year}-$_month-$_day")
        .then((value) {
      setState(() {
        employee = value?.totalEmployee.toString();
      });
    });
    if (DateTime.now().month == _month && DateTime.now().day == _day) {
      _schedulesBloc?.getNextSchedules(
          widget.user?.id, "${DateTime.now().year}-$_month-${_day + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    _progressDialog = ProgressDialog(context, isDismissible: false);
    //_progressDialog?.show();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 56, left: 12, right: 12),
              padding: EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xffF0EFFF),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(36),
                    topLeft: Radius.circular(36)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final newValue = _month - 1;
                            // if(_toHour<0){
                            //   _toHour = 1;
                            // }
                            // DateUtils.getDaysInMonth(
                            //     DateTime.now().year, newValue);
                            _month = newValue.clamp(1, 12);
                            _day = 1;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/images/Group 247.svg",
                          // color: Colors.black,
                        ),
                      ),
                      //SizedBox(width: 4,),
                      Flexible(
                        child: Column(
                          children: [
                            NumberPicker(
                              value: _month,
                              itemHeight: 32,
                              itemWidth: 110,
                              minValue: 1,
                              maxValue: 12,
                              itemCount: 1,
                              //zeroPad: true,
                              axis: Axis.horizontal,
                              // decoration: BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(
                              //       color: Colors.black,
                              //       width: 4,
                              //     )
                              //   )
                              // ),
                              //step: 10,
                              haptics: true,
                              infiniteLoop: true,
                              selectedTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  // decoration: TextDecoration.underline,
                                  // decorationThickness: 4,
                                  // decorationColor: Color(0xffC8C8C8),
                                  fontWeight: FontWeight.w400),
                              // textStyle: const TextStyle(
                              //     color: Colors.transparent,
                              //     fontSize: 0,
                              // ),
                              textMapper: (text) => DateFormat.MMMM().format(
                                  DateTime(
                                      DateTime.now().year, int.parse(text))),
                              onChanged: (value) {
                                setState(() {
                                  _month = value;
                                  if (DateUtils.getDaysInMonth(
                                          DateTime.now().year, _month) <
                                      _day) {
                                    _day = 1;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              height: 2,
                              width: 24,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff59C69C),
                                    borderRadius: BorderRadius.circular(36)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final newValue = _month + 1;
                            _month = newValue.clamp(1, 12);
                            _day = 1;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/images/Group 252.svg",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 64,
                          width: 56,
                          decoration: BoxDecoration(
                              color: Color(0xff59C69C),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8),
                        child: NumberPicker(
                          value: _day,
                          itemWidth: 64,
                          minValue: 1,
                          maxValue: DateUtils.getDaysInMonth(
                              DateTime.now().year, _month),
                          //DateTime(DateTime.now().year,_month).day,
                          itemCount: 5,
                          // step: 10,
                          zeroPad: true,
                          axis: Axis.horizontal,
                          //step: 10,
                          haptics: true,
                          infiniteLoop: true,
                          selectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              // decoration: TextDecoration.underline,
                              // decorationThickness: 4,
                              // decorationColor: Color(0xffC8C8C8),
                              fontWeight: FontWeight.w500),
                          textStyle: const TextStyle(
                            color: Color(0xff7B7B7B),
                            fontSize: 14,
                          ),
                          textMapper: (text) {
                            return DateFormat("EEE").format(DateTime(
                                    DateTime.now().year,
                                    _month,
                                    int.parse(text))) +
                                "\n\n" +
                                text;
                          },
                          onChanged: (value) => setState(() {
                            _day = value;
                            if (DateUtils.getDaysInMonth(
                                    DateTime.now().year, _month) <
                                _day) {
                              _day = DateUtils.getDaysInMonth(
                                  DateTime.now().year, _month);
                            }
                            _schedulesBloc?.getSchedules(widget.user?.id,
                                "${DateTime.now().year}-$_month-$_day");
                            if (DateTime.now().month == _month &&
                                DateTime.now().day == _day) {
                              _schedulesBloc?.getNextSchedules(widget.user?.id,
                                  "${DateTime.now().year}-$_month-${_day + 1}");
                            }
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffF0EFFF),
              margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: SvgPicture.asset("assets/images/Group 218.svg"),
                        alignment: PlaceholderAlignment.middle),
                    TextSpan(
                        text: "  ${widget.user?.companyName}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: SvgPicture.asset("assets/images/Group 217.svg"),
                        alignment: PlaceholderAlignment.middle),
                    TextSpan(
                        text: "  $employee",
                        style: const TextStyle(
                            color: Color(0xffC2C2C2),
                            fontWeight: FontWeight.w300,
                            fontSize: 14))
                  ]))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                  "${DateTime.now().month == _month && DateTime.now().day == _day ? "Today, " : ""}${DateFormat("E, dd MMM, yyyy").format(DateTime(DateTime.now().year, _month, _day))}"),
            ),
            StreamBuilder<Response<Schedules>>(
                stream: _schedulesBloc?.schedulesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data?.status) {
                      case Status.LOADING:
                        return Center(child: const CircularProgressIndicator());
                      case Status.COMPLETED:
                        print(snapshot.data?.data?.statusCode);
                        employee =
                            snapshot.data?.data?.totalEmployee.toString();

                        return snapshot.data?.data?.statusCode == 400
                            ? Center(
                                child: Text("No schedule assigned",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 18.0)))
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount:
                                    snapshot.data?.data?.schedule?.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const ViewSchedule()));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 28, 24, 28),
                                        margin: const EdgeInsets.fromLTRB(
                                            12, 0, 0, 4),
                                        decoration: const BoxDecoration(
                                            color: Color(0xffFFF8E4),
                                            border: Border(
                                                left: BorderSide(
                                                    width: 5,
                                                    color: Color(0xffFFB966)))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/images/Group 210.svg"),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .08,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data?.data?.schedule?.elementAt(index).employeeName}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 20),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      "${snapshot.data?.data?.schedule?.elementAt(index).startTime} - ${snapshot.data?.data?.schedule?.elementAt(index).endTime}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 17),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      const WidgetSpan(
                                                          alignment:
                                                              PlaceholderAlignment
                                                                  .middle,
                                                          child: CircleAvatar(
                                                            radius: 4,
                                                            backgroundColor:
                                                                Color(
                                                                    0xff59C69C),
                                                          )),
                                                      TextSpan(
                                                          text:
                                                              "  ${snapshot.data?.data?.schedule?.elementAt(index).terms}",
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xffB1B1B1),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300))
                                                    ])),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              "assets/images/Vector 51.svg",
                                              color: const Color(0xffADADAD),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                      case Status.ERROR:
                        return CircularProgressIndicator();
                      default:
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            Visibility(
              visible:
                  DateTime.now().month == _month && DateTime.now().day == _day,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                    "Tomorrow,  ${DateFormat("E, dd MMM, yyyy").format(DateTime.now().add(const Duration(days: 1)))}"),
              ),
            ),
            Visibility(
              visible:
                  DateTime.now().month == _month && DateTime.now().day == _day,
              child: StreamBuilder<Response<Schedules>>(
                  stream: _schedulesBloc?.nextSchedulesStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data?.status) {
                        case Status.LOADING:
                          return Center(child: CircularProgressIndicator());
                        case Status.COMPLETED:
                          return snapshot.data?.data?.statusCode == 400
                              ? Center(
                              child: Text("No schedule assigned",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context).disabledColor,
                                      fontSize: 18.0)))
                              : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount:
                              snapshot.data?.data?.schedule?.length,
                              itemBuilder: (context, index) =>
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                              const ViewSchedule()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          24, 28, 24, 28),
                                      margin: const EdgeInsets.fromLTRB(
                                          12, 0, 0, 4),
                                      decoration: const BoxDecoration(
                                          color: Color(0xffFFF8E4),
                                          border: Border(
                                              left: BorderSide(
                                                  width: 5,
                                                  color: Color(0xffFFB966)))),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/Group 210.svg"),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .08,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${snapshot.data?.data?.schedule?.elementAt(index).employeeName}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                        FontWeight.w300,
                                                        fontSize: 20),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    "${snapshot.data?.data?.schedule?.elementAt(index).startTime} - ${snapshot.data?.data?.schedule?.elementAt(index).endTime}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                        FontWeight.w300,
                                                        fontSize: 17),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  RichText(
                                                      text:
                                                      TextSpan(children: [
                                                        const WidgetSpan(
                                                            alignment:
                                                            PlaceholderAlignment
                                                                .middle,
                                                            child: CircleAvatar(
                                                              radius: 4,
                                                              backgroundColor:
                                                              Color(
                                                                  0xff59C69C),
                                                            )),
                                                        TextSpan(
                                                            text:
                                                            "  ${snapshot.data?.data?.schedule?.elementAt(index).terms}",
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xffB1B1B1),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w300))
                                                      ])),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/Vector 51.svg",
                                            color: const Color(0xffADADAD),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                        case Status.ERROR:
                          return Center(child: CircularProgressIndicator());
                        default:
                      }
                    }

                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(36))),
          color: const Color(0xffF5F5F5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 56,
                  width: 84,
                  child: SvgPicture.asset("assets/images/Vector 49.svg"),
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    color: Color(0xffF06767),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(48.0),
                        bottomRight: Radius.circular(48.0),
                        topLeft: Radius.circular(48.0),
                        bottomLeft: Radius.circular(48.0)),
                  )),
              //Container(height: 48,width:72, padding: EdgeInsets.all(24),decoration: const BoxDecoration(color: Color(0xffF06767),shape: BoxShape.circle),child: SvgPicture.asset("assets/images/Vector 49.svg"),),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: SvgPicture.asset(
                  "assets/images/Group 186.svg",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
