import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prime_scheduler/views/all_clock_in_out.dart';
import 'package:prime_scheduler/views/clock_out.dart';
import 'package:prime_scheduler/views/custom_end_drawer.dart';

class ClockInAndOut extends StatefulWidget {
  const ClockInAndOut({Key? key}) : super(key: key);

  @override
  _ClockInAndOutState createState() => _ClockInAndOutState();
}

class _ClockInAndOutState extends State<ClockInAndOut> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomEndDrawer(),
      backgroundColor: Colors.white, //const Color(0xffE5E5E5),
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
                              onTap: () {
                                Navigator.pop(context);
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
                                onTap: (){
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
                          borderRadius: BorderRadius.all(Radius.circular(24))),
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
                            const Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(36))),
                              color: Color(0xffE4DFDF),
                              child: SizedBox(
                                  height: 20,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0, top: 4,bottom: 4, right: 28),
                                    child: Text(
                                      "Your Remaining hours 6.00 HRS",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CircularPercentIndicator(
                              radius: 160.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.1,
                              center: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context, CupertinoPageRoute(builder: (c) => const ClockOut()));
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
                children: const [
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
                      "14 HRS (2h 30m OT)",
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
              padding: EdgeInsets.only(left: 24.0,bottom: 8),
              child: Text(
                "Total Month",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 2,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16, bottom: 4),
                  child: Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(24))),
                    color: index==0?const Color(0xffFFCC00):const Color(0xffEFEEFF),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,8,12,8),
                          child: Card(
                            color: Colors.white,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12, 16, 12, 16),
                              child: Column(
                                children: const [
                                  Text("Today", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),),
                                  SizedBox(height: 16,),
                                  Text(
                                    "MON",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,8,24,8),
                          child: Column(
                            children: [
                              const Text("Clock in", style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                              const SizedBox(height: 16,),
                              Text(
                                "MON",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: index==0?Colors.white:const Color(0xff9F9F9F),
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,8.0,24,8),
                          child: Column(
                            children: const [
                              Text("Clock out", style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: 16,),
                              Text(
                                "hhh",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, CupertinoPageRoute(builder: (c) => const AllClockInOut()));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0, top: 8, bottom: 16),
                child: Text("See all",textAlign: TextAlign.end, style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff59C59B)
                ),),
              ),
            ),
            Padding(
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

          ],
        ),
      ),
    );
  }
}
