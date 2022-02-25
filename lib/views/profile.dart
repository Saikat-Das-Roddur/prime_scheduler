import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_scheduler/models/user_response.dart';

import 'custom_end_drawer.dart';

class Profile extends StatefulWidget {
  User? user;

  Profile({Key? key, this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xffF06767),
        endDrawer: CustomEndDrawer(user: widget.user),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
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
                              "Profile",
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
                Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .7,
                    margin: EdgeInsets.only(top: 180),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36),
                            topRight: Radius.circular(36))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .35,
                          margin: EdgeInsets.only(top: 48),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(36),
                                  bottomLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36),
                                  topRight: Radius.circular(36))),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 12,
                                  shadowColor: Colors.black26,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24))),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .25,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Card(
                                        color: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24))),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .35,
                                            child: SvgPicture.asset(
                                              "assets/images/Group 193.svg",
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height,
                                            ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            RichText(
                                                text: TextSpan(
                                              text: "${widget.user?.name}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 27,
                                                  color: Colors.black),
                                            )),
                                            Text(
                                              widget.user?.isAdmin=="1"?"Manager":"Employee",
                                              style: TextStyle(
                                                  color: Color(0xff9E9E9E),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                WidgetSpan(
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration: const BoxDecoration(
                                                            color: Color(
                                                                0xffF0F0F0),
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8))),
                                                        child: RichText(
                                                          text: TextSpan(
                                                              text: "300",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xffF06767),
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                    text: "h",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w300))
                                                              ]),
                                                        ))),
                                                WidgetSpan(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 4,
                                                      left: 2,
                                                      right: 2),
                                                  child: Text(":",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffF06767),
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w800)),
                                                )),
                                                WidgetSpan(
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration: const BoxDecoration(
                                                            color: Color(
                                                                0xffF0F0F0),
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8))),
                                                        child: RichText(
                                                          text: TextSpan(
                                                              text: "35",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xffF06767),
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                    text: "m",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w300))
                                                              ]),
                                                        ))),
                                                WidgetSpan(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 4,
                                                      left: 2,
                                                      right: 2),
                                                  child: Text(":",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffF06767),
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w800)),
                                                )),
                                                WidgetSpan(
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration: const BoxDecoration(
                                                            color: Color(
                                                                0xffF0F0F0),
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8))),
                                                        child: RichText(
                                                          text: TextSpan(
                                                              text: "10",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xffF06767),
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                    text: "s",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w300))
                                                              ]),
                                                        ))),
                                              ])),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                WidgetSpan(
                                                    child: SvgPicture.asset(
                                                  "assets/images/timer.svg",
                                                  height: 14,
                                                  width: 8,
                                                )),
                                                WidgetSpan(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text(
                                                    "Total Hour",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                )),
                                              ])),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: SvgPicture.asset(
                                  "assets/images/location.svg",
                                ),
                              ),
                              Flexible(
                                  flex: 4,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Location",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                          Text("${widget.user?.location}"),
                                        ],
                                      ),
                                    ),
                                  )

                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: Text(
                                  //     "Profile",
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.w500,
                                  //         fontSize: 19),
                                  //   ),
                                  // )
                                  ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: SvgPicture.asset(
                                  "assets/images/edit.svg",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: SvgPicture.asset(
                                  "assets/images/email.svg",
                                ),
                              ),
                              Flexible(
                                  child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      Text("${widget.user?.email}"),
                                    ],
                                  ),
                                ),
                              )

                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: Text(
                                  //     "Profile",
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.w500,
                                  //         fontSize: 19),
                                  //   ),
                                  // )
                                  ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: SvgPicture.asset(
                                  "assets/images/gender.svg",
                                ),
                              ),
                              Flexible(
                                  child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      Text("Male"),
                                    ],
                                  ),
                                ),
                              )

                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: Text(
                                  //     "Profile",
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.w500,
                                  //         fontSize: 19),
                                  //   ),
                                  // )
                                  ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: SvgPicture.asset(
                                  "assets/images/edit.svg",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: SvgPicture.asset(
                                  "assets/images/total_hours.svg",
                                ),
                              ),
                              Flexible(
                                  child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Last 2 weeks",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      Text("total hours"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          WidgetSpan(
                                              child: RichText(
                                            text: TextSpan(
                                                text: "300",
                                                style: TextStyle(
                                                  color: Color(0xffF06767),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: "h",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300))
                                                ]),
                                          )),
                                          WidgetSpan(
                                              child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(":",
                                                style: TextStyle(
                                                    color: Color(0xffF06767),
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w800)),
                                          )),
                                          WidgetSpan(
                                              child: RichText(
                                            text: TextSpan(
                                                text: "35",
                                                style: TextStyle(
                                                  color: Color(0xffF06767),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: "m",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300))
                                                ]),
                                          )),
                                          WidgetSpan(
                                              child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(":",
                                                style: TextStyle(
                                                    color: Color(0xffF06767),
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w800)),
                                          )),
                                          WidgetSpan(
                                              child: RichText(
                                            text: TextSpan(
                                                text: "10",
                                                style: TextStyle(
                                                  color: Color(0xffF06767),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: "s",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300))
                                                ]),
                                          )),
                                        ])),
                                      ),
                                    ],
                                  ),
                                ),
                              )

                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: Text(
                                  //     "Profile",
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.w500,
                                  //         fontSize: 19),
                                  //   ),
                                  // )
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
              ]),
        ));
  }
}
