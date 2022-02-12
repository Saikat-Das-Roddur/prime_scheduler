import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:prime_scheduler/bloc/clock_in_out_bloc.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/schedules.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/custom_end_drawer.dart';

class AllClockInOut extends StatefulWidget {
  User? user;

  AllClockInOut({Key? key, this.user}) : super(key: key);

  @override
  _AllClockInOutState createState() => _AllClockInOutState();
}

class _AllClockInOutState extends State<AllClockInOut> {
  int _month = DateTime.now().month;
  bool isArrowClicked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ClockInOutBloc? _clockInOutBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _clockInOutBloc = ClockInOutBloc();
    _clockInOutBloc?.getMonthlySchedules(
        widget.user?.isAdmin == "1" ? widget.user?.id : widget.user?.employeeId,
        widget.user?.isAdmin == "1" ? "admin_id" : "employee_id",
        DateFormat("yyyy-MM-dd")
            .format(DateTime(DateTime.now().year, DateTime.now().month, 1)),
        DateFormat("yyyy-MM-dd").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateUtils.getDaysInMonth(
                DateTime.now().year, DateTime.now().month))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomEndDrawer(),
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
      body: SingleChildScrollView(
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/images/Vector 31.svg",
                          color: Colors.black,
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
                              color: Colors.black,
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
                            color: Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 24.0, 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {

                      setState(() {
                       final newValue = _month - 1;
                       _month = newValue.clamp(1, 12);
                      });
                    },
                    child: SvgPicture.asset(
                      "assets/images/Group 201.svg",
                      color: Colors.black,
                    ),
                  ),
                  //SizedBox(width: 4,),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NumberPicker(
                          value: _month,
                          itemHeight: 32,
                          itemWidth: 110,
                          minValue: 1,
                          maxValue: 12,
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
                          //haptics: true,
                          infiniteLoop: true,
                          selectedTextStyle: const TextStyle(
                              color: Color(0xff59C69C),
                              fontSize: 22,
                              // decoration: TextDecoration.underline,
                              // decorationThickness: 4,
                              // decorationColor: Color(0xffC8C8C8),
                              fontWeight: FontWeight.w400),
                          textStyle: const TextStyle(
                              color: Color(0xffB4B4B4),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          textMapper: (text) => DateFormat.MMMM().format(
                              DateTime(DateTime.now().year, int.parse(text))),
                          onChanged: (value) {
                            setState(() {
                              _month = value;
                              print(_month);
                              print(value);
                            });
                            _clockInOutBloc?.getMonthlySchedules(
                                widget.user?.isAdmin == "1" ? widget.user?.id : widget.user?.employeeId,
                                widget.user?.isAdmin == "1" ? "admin_id" : "employee_id",
                                DateFormat("yyyy-MM-dd").format(
                                    DateTime(DateTime.now().year, _month, 1)),
                                DateFormat("yyyy-MM-dd").format(DateTime(
                                    DateTime.now().year,
                                    _month,
                                    DateUtils.getDaysInMonth(
                                        DateTime.now().year, _month))));
                          },
                        ),
                        SizedBox(
                          height: 4,
                          width: 36,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF06767),
                                borderRadius: BorderRadius.circular(36)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 8,),
                  InkWell(
                    onTap: () {

                      setState(() {
                        final newValue = _month + 1;
                        _month = newValue.clamp(1, 12);
                        // print(_month);
                        // _clockInOutBloc?.getMonthlySchedules(
                        //     widget.user?.id,
                        //     DateFormat("yyyy-MM-dd").format(
                        //         DateTime(DateTime.now().year, _month, 1)),
                        //     DateFormat("yyyy-MM-dd").format(DateTime(
                        //         DateTime.now().year,
                        //         _month,
                        //         DateUtils.getDaysInMonth(
                        //             DateTime.now().year, _month))));
                      });
                    },
                    child: SvgPicture.asset(
                      "assets/images/Group 202.svg",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<Response<Schedules>>(
                stream: _clockInOutBloc?.monthlySchedulesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    isArrowClicked = true;
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
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount:
                                    snapshot.data?.data?.schedule?.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16, bottom: 16),
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
                                                                Radius.circular(
                                                                    16))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
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
                                                                    ?.schedule
                                                                    ?.elementAt(
                                                                        index)
                                                                    .assignedDate
                                                            ? "Today"
                                                            : DateFormat("yyyy-MM-dd").format(DateTime.now().add(Duration(days: 1))) ==
                                                                    snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.schedule
                                                                        ?.elementAt(
                                                                            index)
                                                                        .assignedDate
                                                                ? "Tomorrow"
                                                                : DateFormat(
                                                                        "dd MMM")
                                                                    .format(DateTime.parse(
                                                                        "${snapshot.data?.data?.schedule?.elementAt(index).assignedDate}")),
                                                        style: TextStyle(
                                                            fontSize: DateFormat(
                                                                            "yyyy-MM-dd")
                                                                        .format(DateTime.now().add(Duration(
                                                                            days:
                                                                                1))) ==
                                                                    snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.schedule
                                                                        ?.elementAt(
                                                                            index)
                                                                        .assignedDate
                                                                ? 9
                                                                : 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      Text(
                                                        DateFormat("EEE").format(
                                                            DateTime.parse(
                                                                "${snapshot.data?.data?.schedule?.elementAt(index).assignedDate}")),
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
                                                    "${snapshot.data?.data?.schedule?.elementAt(index).startTime}",
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
                                                  Text(
                                                    index == 0
                                                        ? ""
                                                        : "${snapshot.data?.data?.schedule?.elementAt(index).endTime}",
                                                    style: TextStyle(
                                                        color: index == 0
                                                            ? Colors.white
                                                            : const Color(
                                                                0xff9F9F9F),
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
          ],
        ),
      ),
    );
  }
}
