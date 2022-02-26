

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/active_details.dart';
import 'package:prime_scheduler/views/active_details_employee.dart';
import 'package:prime_scheduler/views/add_schedule.dart';
import 'package:prime_scheduler/views/employee_history.dart';
import 'package:prime_scheduler/views/schedule_list.dart';
import 'package:prime_scheduler/views/view_schedule.dart';

import 'add_single_employee.dart';
import 'custom_end_drawer.dart';

class ScheduleWelcomeScreen extends StatefulWidget {
  User? user;
  ScheduleWelcomeScreen({Key? key,this.user}) : super(key: key);


  @override
  _ScheduleWelcomeScreenState createState() => _ScheduleWelcomeScreenState();
}

class _ScheduleWelcomeScreenState extends State<ScheduleWelcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomEndDrawer(user: widget.user, selectedIndex: 0,),
      backgroundColor: Color(0xffF06767),//Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //height: MediaQuery.of(context).size.height*.5,
                color: Color(0xffF06767),//const Color(0xffF1F1F1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 48.0, 24, 0),
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
                                        if(widget.user?.isAdmin=="1") {
                                          Navigator.pop(context);
                                        }else{
                                          if (Platform.isAndroid) {
                                            SystemNavigator.pop();
                                          } else if (Platform.isIOS) {
                                            exit(0);
                                          }
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
                                  "Team Schedule",
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
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       if(user?.isAdmin=="1") {
                    //         Navigator.pop(context);
                    //       }else{
                    //         if (Platform.isAndroid) {
                    //           SystemNavigator.pop();
                    //         } else if (Platform.isIOS) {
                    //           exit(0);
                    //         }
                    //       }
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(top: 56.0,left: 24),
                    //       child: SvgPicture.asset(
                    //         "assets/images/Vector 31.svg",
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 48),
                      child: SvgPicture.asset("assets/images/Group 216.svg", width: MediaQuery.of(context).size.width,),
                    ),
                  ],
                ),
              ),
              //const Spacer(),

              //const SizedBox(height: 24,),

              Container(
                //color: Color(0xff59C69C),
                //height: MediaQuery.of(context).size.height*.5,

                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36))
                ),
                padding: const EdgeInsets.fromLTRB(36,48,36, 36),
                //alignment: Alignment.bottomCenter,
                child: Column(

                  children: [
                    const Text(
                      "Welcome to your team schedule",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xffF06767),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                    const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.08,),
                    GestureDetector(
                      onTap: () {
                        widget.user!.isAdmin=="1"?Navigator.push(
                            context, CupertinoPageRoute(builder: (context) =>
                            AddSchedule(user: widget.user)
                        )):Navigator.push(
                            context, CupertinoPageRoute(builder: (context) =>
                            ActiveDetailsUser(user: widget.user)
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0, left: 0),
                        child: Container(
                          //color: ,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF06767),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14))),
                          child:  Align(
                            child: Text(
                              widget.user!.isAdmin=="1"?"Add Schedule":"Activity Details",
                              style: TextStyle(fontSize:18, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .03,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) =>
                            ScheduleLists(user: widget.user)
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0, left: 0),
                        child: Container(
                          //color: ,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color(0xFF59C69C),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24))),
                          child: const Align(
                            child: Text(
                              "View Schedule",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              //const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


