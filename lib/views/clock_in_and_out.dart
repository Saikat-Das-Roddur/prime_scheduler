import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prime_scheduler/bloc/clock_in_out_bloc.dart';
import 'package:prime_scheduler/models/attendences.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/schedules.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/all_clock_in_out.dart';
import 'package:prime_scheduler/views/clock_out.dart';
import 'package:prime_scheduler/views/custom_end_drawer.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';

class ClockInAndOut extends StatefulWidget {
  User? user;
  String? inTime;
  String? assignedHours;
  String? endTime;
  String? location;
  int? secondsRemaining;
  Function? whenTimeExpires;
  Function? countDownFormatter;
  TextStyle? countDownTimerStyle;

  ClockInAndOut(
      {Key? key, this.user, this.inTime, this.endTime, this.location, this.assignedHours})
      : super(key: key);

  @override
  _ClockInAndOutState createState() => _ClockInAndOutState();
}

class _ClockInAndOutState extends State<ClockInAndOut>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ClockInOutBloc? _clockInOutBloc;
  late final AnimationController _controller;
  late final Duration duration;
  int hrs=0;
  String? endT;
  double? assignedHrs, remainingHrs, percent = 0;

  String get timerDisplayString {
    final duration = _controller.duration! * _controller.value;
    if (widget.countDownFormatter != null) {
      return widget.countDownFormatter!(duration.inSeconds) as String;
    } else {
      String endTime = DateFormat("yyyy-MM-dd").format(DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)) +
          " ${widget.endTime}";
      //"${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${widget.endTime}";
      //widget.inTime = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

      //DateTime today = DateFormat("yyyy-MM-dd hh:mm:ss").parse("$endTime}");
      //DateTime todayIn = DateFormat("yyyy-MM-dd hh:mm:ss").parse("$inTime}");
      DateTime todayEnd = DateFormat("yyyy-MM-dd HH:mm:ss").parse("$endTime");
      DateTime currentTime =
          DateFormat("yyyy-MM-dd HH:mm:ss").parse("${DateTime.now()}");
      print(endTime);

      return (todayEnd.toString().compareTo(currentTime.toString()) != -1)
          ? formatHHMMSS(duration.inSeconds)
          : formatHHMMSS(0);
    }
  }

  double get percentData {
    final duration = _controller.duration! * _controller.value;
    if (widget.countDownFormatter != null) {
      //print("Done");
      return widget.countDownFormatter!(duration.inSeconds) as double;
    } else {
      String endTime = DateFormat("yyyy-MM-dd").format(DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)) +
          " ${widget.endTime}";
      //"${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${widget.endTime}";
      //widget.inTime = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

      //DateTime today = DateFormat("yyyy-MM-dd hh:mm:ss").parse("$endTime}");
      //DateTime todayIn = DateFormat("yyyy-MM-dd hh:mm:ss").parse("$inTime}");
      DateTime todayEnd = DateFormat("yyyy-MM-dd HH:mm:ss").parse(endTime);
      DateTime currentTime =
          DateFormat("yyyy-MM-dd HH:mm:ss").parse("${DateTime.now()}");

      Duration dif = currentTime.difference(todayEnd);

      //print("Compare ${todayEnd.toString().compareTo(currentTime.toString())}");
      //print(todayEnd);
      //print(currentTime);

      if (todayEnd.toString().compareTo(currentTime.toString()) != -1) {
        DateTime d1 = DateFormat("HH:mm:ss").parse("${widget.assignedHours}");
        assignedHrs = (d1.hour * 3600 + d1.minute * 60 + d1.second).toDouble();

        remainingHrs = duration.inSeconds.toDouble();

        percent = 1 - (remainingHrs!.abs() / (assignedHrs!));

        ////print("object ${todayEnd.microsecond}");

        // //print(d1.toString());
      } else {
        percent = 1;
      }

      ////print(remainingHrs);

      //return 1;
      return percent! > 1
          ? 0
          : percent!; //(remainingHrs! - assignedHrs!).abs() / (assignedHrs!);//(remainingHrs! - assignedHrs!).abs() / assignedHrs!;
    }
  }

  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = ((hours).abs()).toString().padLeft(2, '0');
    final minutesStr = ((minutes).abs()).toString().padLeft(2, '0');
    final secondsStr = ((seconds).abs() % 60).toString().padLeft(2, '0');

    // if (hours == 0) {
    //   return '$hoursStr:$minutesStr:$secondsStr';
    // }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _clockInOutBloc = ClockInOutBloc();
    ////print(widget.inTime);

    String inTime = "${widget.inTime}";
    //print(widget.endTime);
    String endTime = DateFormat("yyyy-MM-dd").format(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)) +
        " ${widget.endTime}";
    print("endTime");
    endT = endTime;
    print(endT);
    print("inTime");
    print(widget.inTime);
    DateTime todayEnd = DateFormat("yyyy-MM-dd HH:mm:ss").parse("$endTime");
    DateTime currentTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse("${DateTime.now()}");

    if (todayEnd.toString().compareTo(currentTime.toString()) == -1) {
      percent = 1;
      // //print("object ${todayEnd.microsecond}");
    }

    Duration dif = todayEnd.difference(currentTime);

    //DateTime d1 = DateFormat("HH:mm:ss").parse(formatHHMMSS(dif.inSeconds));

    //print(widget.assignedHours);
    DateTime assigned =
        DateFormat("HH:mm:ss").parse(formatHHMMSS(dif.inSeconds));

    //print(assigned.toString());

    assignedHrs =
        (assigned.hour * 3600 + assigned.minute * 60 + assigned.second)
            .toDouble();

    hrs = assigned.hour;
    //print(d1.hour * 3600 + d1.minute * 60 + d1.second);
    duration = Duration(
        seconds: assigned.hour * 3600 + assigned.minute * 60 + assigned.second);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller
      ..reverse(from: assignedHrs)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          //widget.whenTimeExpires();
          percent = 1;
          //print("Done");

        }
      });

    _clockInOutBloc?.getAttendances(
        widget.user?.isAdmin == "1" ? widget.user?.id : widget.user?.employeeId,
        DateFormat("yyyy-MM-dd").format(DateTime.now()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ClockInAndOut oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.secondsRemaining != oldWidget.secondsRemaining) {
    //   setState(() {
    //     duration = Duration(seconds: (d1.hour * 3600 + d1.minute * 60 + d1.second));
    //     _controller.dispose();
    //     _controller = AnimationController(
    //       vsync: this,
    //       duration: duration,
    //     );
    //     _controller
    //       ..reverse(from: (d1.hour * 3600 + d1.minute * 60 + d1.second).toDouble())
    //       ..addStatusListener((status) {
    //         if (status == AnimationStatus.completed) {
    //           //widget.whenTimeExpires();
    //         }
    //       });
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.user?.isAdmin == "1"
          ? await Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                  builder: (c) => LoggedInHomeScreen(
                        user: widget.user,
                      )),
              ModalRoute.withName('/loggedInHome'))
          : await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Do you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Yes'),
                  ),
                ],
              ),
            ),
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: CustomEndDrawer(user: widget.user,),
        backgroundColor: Colors.white,
        //const Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //color: const Color(0xffF1F1F1),
                //height: MediaQuery.of(context).size.height * .6,
                decoration: const BoxDecoration(
                    color: Color(0xff59C69C),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 56.0, 24, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () async{
                                  if (widget.user?.isAdmin == "1") {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (c) => LoggedInHomeScreen(
                                                  user: widget.user,
                                                )),
                                        ModalRoute.withName('/loggedInHome'));
                                  }else{
                                    await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                      title: const Text('Do you want to exit?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: const Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(true),
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    ),
                                  );
                                  }
                                },
                                child: SvgPicture.asset(
                                  "assets/images/Vector 31.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Flexible(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Clock In & Out",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    _scaffoldKey.currentState?.openEndDrawer();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/images/Group 176.svg",
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Card(
                        elevation: 8,
                        color: const Color(0xffE5E5E5),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffE5E5E5),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(36))),
                                color: const Color(0xffE4DFDF),
                                child: SizedBox(
                                    height: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0,
                                          top: 4,
                                          bottom: 4,
                                          right: 28),
                                      child: AnimatedBuilder(
                                        animation: _controller,
                                        builder: (_, Widget? child) {
                                          return Text(
                                            "Your Remaining hours $timerDisplayString HRS",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          );
                                        },
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              AnimatedBuilder(
                                animation: _controller,
                                builder: (_, Widget? child) {
                                  return CircularPercentIndicator(
                                    radius: 160.0,
                                    animation: true,
                                    animationDuration: 1200,
                                    animateFromLastPercent: true,
                                    addAutomaticKeepAlive: true,
                                    lineWidth: 15.0,
                                    percent: percentData,
                                    center: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (c) => ClockOut(
                                                    user: widget.user,
                                                    location: widget.location,
                                                    inTime: widget.inTime,
                                                    endTime: endT,
                                                    outTime: DateFormat(
                                                            "yyyy-MM-dd HH:mm:ss")
                                                        .format(
                                                            DateTime.now()))));
                                      },
                                      child: const CircleAvatar(
                                        radius: 65,
                                        backgroundColor: Color(0xff59C69C),
                                        child: Text(
                                          "Clock out",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.butt,
                                    backgroundColor: const Color(0xffE4DFDF),
                                    progressColor: const Color(0xffF06767),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      "Total Hours:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "$hrs HRS (2h 30m OT)",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xffF06767),
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .01,
              // ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0, bottom: 8),
                child: Text(
                  "Total Month",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              StreamBuilder<Response<Attendances>>(
                  stream: _clockInOutBloc?.attendancesStream,
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
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontSize: 18.0)))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount:
                                      snapshot.data!.data!.attendances!.length > 2
                                          ? 2
                                          : snapshot
                                              .data?.data?.attendances?.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 16, bottom: 4),
                                        child: Card(
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(24))),
                                          color: index == 0
                                              ? const Color(0xffFFCC00)
                                              : const Color(0xffEFEEFF),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8, 12, 8),
                                                child: Card(
                                                  color: Colors.white,
                                                  elevation: 0,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          16))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        12, 16, 12, 16),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          DateFormat("yyyy-MM-dd")
                                                                      .format(DateTime
                                                                          .now()) ==
                                                                  snapshot
                                                                      .data
                                                                      ?.data
                                                                      ?.attendances
                                                                      ?.elementAt(
                                                                          index)
                                                                      .assignedDate
                                                              ? "Today"
                                                              : DateFormat("yyyy-MM-dd").format(DateTime.now().add(Duration(days: 1))) ==
                                                                      snapshot
                                                                          .data
                                                                          ?.data
                                                                          ?.attendances
                                                                          ?.elementAt(
                                                                              index)
                                                                          .assignedDate
                                                                  ? "Tomorrow"
                                                                  : DateFormat(
                                                                          "dd MMM")
                                                                      .format(DateTime.parse(
                                                                          "${snapshot.data?.data?.attendances?.elementAt(index).assignedDate}")),
                                                          style: TextStyle(
                                                              fontSize: DateFormat(
                                                                              "yyyy-MM-dd")
                                                                          .format(DateTime.now().add(Duration(
                                                                              days:
                                                                                  1))) ==
                                                                      snapshot
                                                                          .data
                                                                          ?.data
                                                                          ?.attendances
                                                                          ?.elementAt(
                                                                              index)
                                                                          .assignedDate
                                                                  ? 9
                                                                  : 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        Text(
                                                          DateFormat("EEE").format(
                                                              DateTime.parse(
                                                                  "${snapshot.data?.data?.attendances?.elementAt(index).assignedDate}")),
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8, 24, 8),
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      "Clock in",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text(
                                                      "${snapshot.data?.data?.attendances?.elementAt(index).inTime}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: index == 0
                                                              ? Colors.white
                                                              : const Color(
                                                                  0xff9F9F9F),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8.0, 24, 8),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Clock out",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text( "${snapshot.data?.data?.attendances?.elementAt(index).outTime}",
                                                      // index == 0
                                                      //     ? "${snapshot.data?.data?.attendances?.elementAt(index).outTime}"
                                                      //     : "${snapshot.data?.data?.attendances?.elementAt(index).outTime}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (c) => AllClockInOut(user: widget.user)));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 24.0, top: 8, bottom: 16),
                  child: Text(
                    "See all",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 14, color: Color(0xff59C59B)),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
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
      ),
    );
  }

  void clockOut() {
    Map map = Map();
    map['employee_id'] = widget.user?.id;
    map['assigned_date'] = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // map['completed_hours'] = completedHours;
    // map['out_time'] = widget.outTime;
    //"${((DateTime.now().hour + 11) % 12) + 1}:${DateTime.now().minute}:${DateTime.now().second} ${DateTime.now().hour > 11 ? "pm" : "am"}";

    // _clockOutBloc?.clockOut(map).then((value) {
    //   if (value['status_code'] == 200) {
    //     showClockOutDialog();
    //   }
    // });
  }
}
