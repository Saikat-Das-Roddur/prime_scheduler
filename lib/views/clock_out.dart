import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'clock_in_and_out.dart';

class ClockOut extends StatefulWidget {
  const ClockOut({Key? key}) : super(key: key);

  @override
  _ClockOutState createState() => _ClockOutState();
}

class _ClockOutState extends State<ClockOut> {
  late int _currentDigit;
  var _firstDigit;
  var _secondDigit;
  var _thirdDigit;
  var _fourthDigit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: SvgPicture.asset(
                          "assets/images/Group 176.svg",
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xffC4C4C4),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Robin Alex",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 19),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Saturday, 17 sep, 2021",
                            style: TextStyle(
                                color: Color(0xffABABAB),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 36),
                decoration: const BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Activity in progress",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        SvgPicture.asset(
                          "assets/images/Group 203.svg",
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Total active hours",
                              style: TextStyle(
                                  color: Color(0xff979797),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "02:40:10 s",
                              style: TextStyle(
                                  color: Color(0xffF23232),
                                  fontSize: 33,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .03,
                    // ),
                    RichText(
                        text: const TextSpan(
                            text: "Please enter your ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                            children: [
                          TextSpan(
                              text: "PIN",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18))
                        ])),

                    //_otpTextField(0),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                    ),
                    _getInputField,

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                    ),
                    GestureDetector(
                      onTap: () {
                        showClockOutDialog();
                        // Navigator.push(
                        //     context,
                        //     CupertinoPageRoute(
                        //         builder: (c) => const ClockInAndOut(
                        //
                        //         )));
                      },
                      child: Container(
                        //color: ,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xff59C69C),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14))),
                        child: const Align(
                          child: Text(
                            "Clock Out",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
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
    );
  }

  get _getInputField {
    //print(widget.otp);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_firstDigit)),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_secondDigit)),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_thirdDigit)),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_fourthDigit)),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_fourthDigit)),
      ],
    );
  }

  Widget _otpTextField(var digit) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Text(
        digit != null ? digit.toString() : "*",
        style: digit != null
            ? const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300)
            : const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
      ),
      decoration: const BoxDecoration(
//            color: Colors.grey.withOpacity(0.4),
          border: Border(
              bottom: BorderSide(
        width: 1.5,
        color: Colors.black,
      ))),
    );
  }

  showClockOutDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(36))),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            const Flexible(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Clock Out",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffF06767),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        RichText(
                            text: const TextSpan(
                                text: "Time: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    color: Color(0xffC4C4C4)),
                                children: [
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Text(
                                    "02 hours 40 min 10 sec",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ))
                            ])),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        RichText(
                            text: const TextSpan(
                                text: "Location: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    color: Color(0xffC4C4C4)),
                                children: [
                              WidgetSpan(
                                  child: Text(
                                "Sarinda Club",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ))
                            ])),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        SvgPicture.asset(
                          "assets/images/Group 205.svg",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            //showClockOutDialog();
                            // Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //         builder: (c) => const ClockInAndOut(
                            //
                            //         )));
                          },
                          child: Container(
                            //color: ,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color(0xff59C69C),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                    bottomLeft: Radius.circular(14),
                                    bottomRight: Radius.circular(14))),
                            child: const Align(
                              child: Text(
                                "OK!",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
