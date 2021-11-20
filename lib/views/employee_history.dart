import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_scheduler/views/active_details.dart';

class EmployeeHistory extends StatefulWidget {
  const EmployeeHistory({Key? key}) : super(key: key);

  @override
  _EmployeeHistoryState createState() => _EmployeeHistoryState();
}

class _EmployeeHistoryState extends State<EmployeeHistory> {
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
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(36),
                                    topRight: Radius.circular(36))),
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding:  const EdgeInsets.fromLTRB(24.0,36,24,0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/Group 210.svg",
                                            height: 60,
                                            width: 60,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: SvgPicture.asset(
                                                "assets/images/Group 165.svg",
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    Padding(
                                      padding:  const EdgeInsets.fromLTRB(24.0,0,24,0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Chese Li alex",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "Manager",
                                            style: TextStyle(
                                                color: Color(0xffB1B1B1),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .05,
                                    ),
                                    const Padding(
                                      padding:  EdgeInsets.fromLTRB(24.0,0,24,0),
                                      child: Text(
                                        "Total active hours",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Color(0xff979797),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    Padding(
                                      padding:  const EdgeInsets.fromLTRB(24.0,0,24,0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                  const ActiveDetails(
                                                  )));
                                        },
                                        child: Container(
                                         // height: 48,
                                          padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                                          decoration: const BoxDecoration(
                                              color: Color(0xffF0EFFF),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Flexible(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "02 : 40 : 10 s",
                                                    style: TextStyle(
                                                      fontSize: 29,
                                                      fontWeight: FontWeight.w700,
                                                      color: Color(0xffF23232)
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                  "assets/images/Vector 51.svg"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        elevation: 8,
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
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
                        margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                        decoration: const BoxDecoration(
                            color: Color(0xffFFF8E4),
                            border: Border(
                                left: BorderSide(
                                    width: 5, color: Color(0xffFFB966)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset("assets/images/Group 210.svg"),
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
                                RichText(
                                    text: const TextSpan(children: [
                                  WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                            ),
                            SvgPicture.asset(
                              "assets/images/Vector 32.svg",
                              color: const Color(0xffADADAD),
                            ),
                          ],
                        ),
                      ),
                    )),
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
