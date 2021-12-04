import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/add_admin.dart';
import 'package:prime_scheduler/views/add_employees.dart';
import 'package:prime_scheduler/views/clock_in.dart';
import 'package:prime_scheduler/views/employee_history.dart';
import 'package:prime_scheduler/views/schedule_welcome_screen.dart';

class LoggedInHomeScreen extends StatefulWidget {
  User? user;

  LoggedInHomeScreen({Key? key, this.user}) : super(key: key);

  @override
  _LoggedInHomeScreenState createState() => _LoggedInHomeScreenState();
}

class _LoggedInHomeScreenState extends State<LoggedInHomeScreen> {
  bool isAddEmployee = false,
      isClockIn = false,
      isSchedule = false,
      isTotalHours = false,
      isEmployeeHistory = false,
      isAddAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 48.0, 36, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        "assets/images/Group 184.svg",
                      ),
                    ),
                  ),
                  Flexible(
                      child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      "assets/images/Group.svg",
                      height: 44,
                    ),
                  )),
                  Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "assets/images/Group 176.svg",
                          color: const Color(0xff050505),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24.0, 16, 0),
              child: Card(
                elevation: 8,
                shadowColor: const Color(0xffF6F6F6),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                color: const Color(0xffF6F6F6),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: const TextSpan(
                                  text: "Announcements  ",
                                  style: TextStyle(
                                      color: Color(0xff525252),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                TextSpan(
                                    text: "2/3",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ])),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/Group 248.svg"),
                              const SizedBox(
                                width: 16,
                              ),
                              SvgPicture.asset("assets/images/Group 249.svg"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Short service for Independence Day",
                        style: TextStyle(
                            color: Color(0xffF06767),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s......",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff858585),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "1st July,2021",
                            style: TextStyle(
                                color: Color(0xff787878), fontSize: 10),
                          ),
                          ButtonTheme(
                              height: 22,
                              minWidth: 72,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              child: FlatButton(
                                  color: const Color(0xff59C69C),
                                  onPressed: () {},
                                  child: const Text(
                                    "View",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                color: const Color(0xffF6F6F6),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAddEmployee = true;
                                  isClockIn = false;
                                  isSchedule = false;
                                  isTotalHours = false;
                                  isEmployeeHistory = false;
                                  isAddAdmin = false;
                                });
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            AddEmployees(user: widget.user)));
                              },
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                color: isAddEmployee
                                    ? const Color(0xffF06767)
                                    : const Color(0xffFEEBEB),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  // height: MediaQuery.of(context).size.height*.18,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 36, 0, 24),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/Group 178.svg"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Add Employee",
                                        style: TextStyle(
                                            color: isAddEmployee
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAddEmployee = false;
                                  isClockIn = true;
                                  isSchedule = false;
                                  isTotalHours = false;
                                  isEmployeeHistory = false;
                                  isAddAdmin = false;
                                });
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            ClockIn(user: widget.user)));
                              },
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                color:
                                    Color(isClockIn ? 0xffF06767 : 0xffFEEBEB),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  // height: MediaQuery.of(context).size.height*.33,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 36, 0, 24),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/Group 179.svg"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Clock In",
                                        style: TextStyle(
                                            color: isClockIn
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAddEmployee = false;
                                  isClockIn = false;
                                  isSchedule = false;
                                  isTotalHours = false;
                                  isEmployeeHistory = false;
                                  isAddAdmin = true;
                                });
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                             AddAdmin(user: widget.user)));
                              },
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                color:
                                    Color(isAddAdmin ? 0xffF06767 : 0xffFEEBEB),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  //height: MediaQuery.of(context).size.height*.33,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 36, 0, 24),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/Group 180.svg"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Add Admin",
                                        style: TextStyle(
                                            color: isAddAdmin
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                {
                                  setState(() {
                                    isAddEmployee = false;
                                    isClockIn = false;
                                    isSchedule = false;
                                    isTotalHours = true;
                                    isEmployeeHistory = false;
                                    isAddAdmin = false;
                                  });
                                }
                              },
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                color: Color(
                                    isTotalHours ? 0xffF06767 : 0xffFEEBEB),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  //height: MediaQuery.of(context).size.height*.33,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 36, 0, 24),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/Group 181.svg"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Total hours",
                                        style: TextStyle(
                                            color: isTotalHours
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAddEmployee = false;
                                  isClockIn = false;
                                  isSchedule = true;
                                  isTotalHours = false;
                                  isEmployeeHistory = false;
                                  isAddAdmin = false;
                                });
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                             ScheduleWelcomeScreen(
                                                user: widget.user)));
                              },
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                color:
                                    Color(isSchedule ? 0xffF06767 : 0xffFEEBEB),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 36, 0, 24),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/Group 182.svg"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Schedule",
                                        style: TextStyle(
                                            color: isSchedule
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAddEmployee = false;
                                  isClockIn = false;
                                  isSchedule = false;
                                  isTotalHours = false;
                                  isEmployeeHistory = true;
                                  isAddAdmin = false;
                                });
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                             EmployeeHistory(
                                                user: widget.user)));
                              },
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                color: Color(isEmployeeHistory
                                    ? 0xffF06767
                                    : 0xffFEEBEB),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  //height: MediaQuery.of(context).size.height*.33,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 36, 0, 24),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/Group 185.svg"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Employee history",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: isEmployeeHistory
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
            )
          ],
        ),
      ),
    );
  }
}
