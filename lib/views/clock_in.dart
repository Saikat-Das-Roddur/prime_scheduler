import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_scheduler/views/clock_in_and_out.dart';

import 'add_single_employee.dart';

class ClockIn extends StatefulWidget {
  const ClockIn({Key? key}) : super(key: key);

  @override
  _ClockInState createState() => _ClockInState();
}

class _ClockInState extends State<ClockIn> {
  late int _currentDigit;
  var _firstDigit;
  var _secondDigit;
  var _thirdDigit;
  var _fourthDigit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF06767),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Color(0xffF06767), //const Color(0xffF1F1F1),
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                "assets/images/Group 176.svg",
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: SvgPicture.asset(
                      "assets/images/Group 193.svg",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              //color: Color(0xff59C69C),
              //height: MediaQuery.of(context).size.height*.7,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36))),
              padding: const EdgeInsets.fromLTRB(36.0, 48, 36, 36),
              //alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
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
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (c) => const ClockInAndOut(

                              )));
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
                          "Clock In",
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
          ],
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
        SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_secondDigit)),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_thirdDigit)),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                //_isDigitSelected = true;
              });
            },
            child: _otpTextField(_fourthDigit)),
        SizedBox(
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
}
