import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:prime_scheduler/bloc/employee_history_bloc.dart';
import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/active_details.dart';

class EmployeeHistory extends StatefulWidget {
  User? user;

  EmployeeHistory({Key? key, this.user}) : super(key: key);

  @override
  _EmployeeHistoryState createState() => _EmployeeHistoryState();
}

class _EmployeeHistoryState extends State<EmployeeHistory> {
  EmployeeHistoryBloc? _employeeHistoryBloc;
  int _day = DateTime.now().day;
  int _month = DateTime.now().month;
  int _year = DateTime.now().year;
  String startDate = DateFormat("yyyy-MM-dd").format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day));
      //"${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";

  int _endDay = DateTime.now().day;
  int _endMonth = DateTime.now().month;
  String endDate = DateFormat("yyyy-MM-dd").format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day));
      //"${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";

  Map<String,dynamic> map = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _employeeHistoryBloc = EmployeeHistoryBloc();
    map['admin_id'] = widget.user?.id;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    _employeeHistoryBloc?.getEmployeeHistory(map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff59C69C),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 56.0, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
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
                  const Flexible(
                      //flex: 3,
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Employee history",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                  )),
                  // Flexible(
                  //     flex: 1,
                  //     child: Align(
                  //       alignment: Alignment.centerRight,
                  //       child: SvgPicture.asset(
                  //         "assets/images/Group 176.svg",
                  //         color: Colors.black,
                  //       ),
                  //     )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 24, bottom: 16),
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello ! Employee",
                          style: TextStyle(
                              color: Color(0xffF06767),
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 11),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "t is a long established fact that a reader will be distracted.",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/Group 243.svg",
                  )
                ],
              ),
            ),
            Text(
              "Start Date",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 16, left: 12, right: 12, bottom: 16),
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xffF0EFFF),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
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
                            startDate =
                                "$_year-${_month.toString().padLeft(2, '0')}-${_day.toString().padLeft(2, '0')}";
                            //map['start_date'] = startDate;
                            //map['end_date'] = endDate;
                            //_employeeHistoryBloc?.getEmployeeHistory(map);
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
                                  startDate =
                                      "$_year-${_month.toString().padLeft(2, '0')}-${_day.toString().padLeft(2, '0')}";
                                  map['start_date'] = startDate;
                                  //map['end_date'] = endDate;
                                  _employeeHistoryBloc?.getEmployeeHistory(map);
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
                            startDate =
                                "$_year-${_month.toString().padLeft(2, '0')}-${_day.toString().padLeft(2, '0')}";
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

                            startDate =
                                "$_year-${_month.toString().padLeft(2, '0')}-${_day.toString().padLeft(2, '0')}";
                            map['start_date'] = startDate;
                            //map['end_date'] = endDate;
                            _employeeHistoryBloc?.getEmployeeHistory(map);
                            // _schedulesBloc?.getSchedules(widget.user?.id,
                            //     "$_year-$_month-$_day");
                            // if (DateTime.now().month == _month &&
                            //     DateTime.now().day == _day) {
                            //   _schedulesBloc?.getNextSchedules(widget.user?.id,
                            //       "$_year-$_month-${_day + 1}");
                            // }
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "End Date",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 12, right: 12),
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xffF0EFFF),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24)),
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
                            final newValue = _endMonth - 1;
                            // if(_toHour<0){
                            //   _toHour = 1;
                            // }
                            // DateUtils.getDaysInMonth(
                            //     DateTime.now().year, newValue);
                            _endMonth = newValue.clamp(1, 12);
                            _endDay = 1;
                            endDate =
                                "$_year-${_endMonth.toString().padLeft(2, '0')}-${_endDay.toString().padLeft(2, '0')}";
                            //map['start_date'] = startDate;
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
                              value: _endMonth,
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
                                  _endMonth = value;
                                  if (DateUtils.getDaysInMonth(
                                          DateTime.now().year, _endMonth) <
                                      _endDay) {
                                    _endDay = 1;
                                  }
                                  endDate =
                                      "$_year-${_endMonth.toString().padLeft(2, '0')}-${_endDay.toString().padLeft(2, '0')}";
                                });
                                if (endDate.compareTo(startDate) == 1) {
                                  print(endDate);
                                  print(startDate);

                                  //map['admin_id'] = widget.user?.id;
                                  //map['start_date'] = startDate;
                                  map['end_date'] = endDate;

                                  _employeeHistoryBloc
                                      ?.getEmployeeHistory(map);
                                } else {
                                  print(endDate.compareTo(startDate));
                                }
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
                            final newValue = _endMonth + 1;
                            _endMonth = newValue.clamp(1, 12);
                            _endDay = 1;
                            endDate =
                                "$_year-${_endMonth.toString().padLeft(2, '0')}-${_endDay.toString().padLeft(2, '0')}";
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
                          value: _endDay,
                          itemWidth: 64,
                          minValue: 1,
                          maxValue: DateUtils.getDaysInMonth(
                              DateTime.now().year, _endMonth),
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
                                    _endMonth,
                                    int.parse(text))) +
                                "\n\n" +
                                text;
                          },
                          onChanged: (value) => setState(() {
                            _endDay = value;
                            if (DateUtils.getDaysInMonth(
                                    DateTime.now().year, _endMonth) <
                                _endDay) {
                              _endDay = DateUtils.getDaysInMonth(
                                  DateTime.now().year, _endMonth);
                            }
                            endDate =
                                "$_year-${_endMonth.toString().padLeft(2, '0')}-${_endDay.toString().padLeft(2, '0')}";
                            print("changing");
                            map['start_date'] = startDate;
                            map['end_date'] = endDate;
                            _employeeHistoryBloc?.getEmployeeHistory(map);
                            // _schedulesBloc?.getSchedules(widget.user?.id,
                            //     "$_year-$_month-$_day");
                            // if (DateTime.now().month == _month &&
                            //     DateTime.now().day == _day) {
                            //   _schedulesBloc?.getNextSchedules(widget.user?.id,
                            //       "$_year-$_month-${_day + 1}");
                            // }
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            StreamBuilder<Response<History>>(
                stream: _employeeHistoryBloc?.getEmployeeHistoryStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data?.status) {
                      case Status.LOADING:
                        return Center(child: CircularProgressIndicator());
                      case Status.COMPLETED:
                        return snapshot.data?.data?.statusCode == 400
                            ? Center(
                                child: Text("No history found",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 18.0)))
                            : endDate.compareTo(startDate) == -1
                                ? Center(
                                    child: Text("End date can't be smaller",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  )
                                : ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount:
                                        snapshot.data?.data?.employeeHistory?.length,
                                    itemBuilder:
                                        (context, index) => GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet<void>(
                                                    context: context,
                                                    backgroundColor: Colors
                                                        .white,
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        36),
                                                                topRight: Radius
                                                                    .circular(
                                                                        36))),
                                                    builder:
                                                        (BuildContext context) {
                                                      return SingleChildScrollView(
                                                        physics:
                                                            const ScrollPhysics(),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      24.0,
                                                                      36,
                                                                      24,
                                                                      0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    "assets/images/Group 210.svg",
                                                                    height: 60,
                                                                    width: 60,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        "assets/images/Group 165.svg",
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .02,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      24.0,
                                                                      0,
                                                                      24,
                                                                      0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "${snapshot.data?.data?.employeeHistory?.elementAt(index).employee?.name}",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w300,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                  Text(
                                                                    "Manager",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffB1B1B1),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w300,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .05,
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          24.0,
                                                                          0,
                                                                          24,
                                                                          0),
                                                              child: Text(
                                                                "Total active hours",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff979797),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .01,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      24.0,
                                                                      0,
                                                                      24,
                                                                      0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  Navigator.push(
                                                                      context,
                                                                      CupertinoPageRoute(
                                                                          builder: (context) =>
                                                                               ActiveDetails(
                                                                                employee: snapshot.data?.data?.employeeHistory?.elementAt(index).employee,
                                                                                attendanceList: snapshot.data?.data?.employeeHistory?.elementAt(index).attendance
                                                                              )));
                                                                },
                                                                child:
                                                                    Container(
                                                                  // height: 48,
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          16,
                                                                          4,
                                                                          16,
                                                                          4),
                                                                  decoration: const BoxDecoration(
                                                                      color: Color(
                                                                          0xffF0EFFF),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(8))),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                       Flexible(
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Text(
                                                                            "${snapshot.data?.data?.employeeHistory?.elementAt(index).totalHours}",
                                                                            style: const TextStyle(
                                                                                fontSize: 29,
                                                                                fontWeight: FontWeight.w700,
                                                                                color: Color(0xffF23232)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SvgPicture
                                                                          .asset(
                                                                              "assets/images/Vector 51.svg"),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .03,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Card(
                                                                elevation: 8,
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(36))),
                                                                color: const Color(
                                                                    0xffF5F5F5),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                        height:
                                                                            56,
                                                                        width:
                                                                            84,
                                                                        child: SvgPicture.asset(
                                                                            "assets/images/Vector 49.svg"),
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                14),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Color(0xffF06767),
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(48.0),
                                                                              bottomRight: Radius.circular(48.0),
                                                                              topLeft: Radius.circular(48.0),
                                                                              bottomLeft: Radius.circular(48.0)),
                                                                        )),
                                                                    //Container(height: 48,width:72, padding: EdgeInsets.all(24),decoration: const BoxDecoration(color: Color(0xffF06767),shape: BoxShape.circle),child: SvgPicture.asset("assets/images/Vector 49.svg"),),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              24.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        "assets/images/Group 186.svg",
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        24, 28, 24, 28),
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 0, 0, 16),
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffFFF8E4),
                                                    border: Border(
                                                        left: BorderSide(
                                                            width: 5,
                                                            color: Color(
                                                                0xffFFB966)))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/images/Group 210.svg"),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${snapshot.data?.data?.employeeHistory?.elementAt(index).employee?.name}",
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize: 20),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                                    children: [
                                                              WidgetSpan(
                                                                  alignment:
                                                                      PlaceholderAlignment
                                                                          .middle,
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xff59C69C),
                                                                  )),
                                                              TextSpan(
                                                                  text:
                                                                      "  Manager",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffB1B1B1),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300))
                                                            ])),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .2,
                                                    ),
                                                    SvgPicture.asset(
                                                      "assets/images/Vector 32.svg",
                                                      color: const Color(
                                                          0xffADADAD),
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
            const Padding(
              padding: EdgeInsets.only(right: 24.0, bottom: 16),
              child: Text(
                "Show more",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
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
