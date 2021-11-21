import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_scheduler/views/view_schedule.dart';

import 'active_details.dart';

class ScheduleLists extends StatefulWidget {
  const ScheduleLists({Key? key}) : super(key: key);

  @override
  _ScheduleListsState createState() => _ScheduleListsState();
}

class _ScheduleListsState extends State<ScheduleLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.only(top: 56, left: 12, right: 12),
              decoration: const BoxDecoration(
                color: Color(0xffF0EFFF),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(36),
                    topLeft: Radius.circular(36)),
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
                    const TextSpan(
                        text: "  Sarinda club",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: SvgPicture.asset("assets/images/Group 217.svg"),
                        alignment: PlaceholderAlignment.middle),
                    const TextSpan(
                        text: "  05",
                        style: TextStyle(
                            color: Color(0xffC2C2C2),
                            fontWeight: FontWeight.w300,
                            fontSize: 14))
                  ]))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text("Today, Mon, 03 sep, 2021"),
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const ViewSchedule()));
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
                        margin: const EdgeInsets.fromLTRB(12, 0, 0, 4),
                        decoration: const BoxDecoration(
                            color: Color(0xffFFF8E4),
                            border: Border(
                                left: BorderSide(
                                    width: 5, color: Color(0xffFFB966)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/Group 210.svg"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .08,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Chese Li",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "8:00 am - 4:00 pm",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    RichText(
                                        text: const TextSpan(children: [
                                      WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: CircleAvatar(
                                            radius: 4,
                                            backgroundColor: Color(0xff59C69C),
                                          )),
                                      TextSpan(
                                          text: "  Manager",
                                          style: TextStyle(
                                              color: Color(0xffB1B1B1),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300))
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
                    )),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text("Tomorrow, Tue, 04 sep, 2021"),
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const ViewSchedule()));
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
                        margin: const EdgeInsets.fromLTRB(12, 0, 0, 4),
                        decoration: const BoxDecoration(
                            color: Color(0xffFFF8E4),
                            border: Border(
                                left: BorderSide(
                                    width: 5, color: Color(0xffFFB966)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/Group 210.svg"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .08,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Chese Li",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "8:00 am - 4:00 pm",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    RichText(
                                        text: const TextSpan(children: [
                                      WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: CircleAvatar(
                                            radius: 4,
                                            backgroundColor: Color(0xff59C69C),
                                          )),
                                      TextSpan(
                                          text: "  Manager",
                                          style: TextStyle(
                                              color: Color(0xffB1B1B1),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300))
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
                    )),
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
