import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:prime_scheduler/bloc/clock_out_bloc.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/custom_end_drawer.dart';

import 'clock_in_and_out.dart';
import 'logged_in_home.dart';

class ClockOut extends StatefulWidget {
  User? user;
  String? inTime;
  String? outTime;

  ClockOut({Key? key, this.user, this.inTime, this.outTime}) : super(key: key);

  @override
  _ClockOutState createState() => _ClockOutState();
}

class _ClockOutState extends State<ClockOut> {
  late int _currentDigit;
  var _firstDigit;
  var _secondDigit;
  var _thirdDigit;
  var _fourthDigit;
  var _fifthDigit;
  var pinCode;
  String? completedHours;
  bool _isDigitSelected = false;
  late Size _screenSize;
  ClockOutBloc? _clockOutBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _clockOutBloc = ClockOutBloc();
    DateTime d1 = DateFormat("yyyy-MM-dd hh:mm:ss").parse("${widget.inTime}");
    DateTime d2 = DateFormat("yyyy-MM-dd hh:mm:ss").parse("${widget.outTime}");

    // widget.outTime = DateFormat(
    //     "yyyy-MM-dd")
    //     .format(DateTime
    //     .now()) +
    //     " " +
    //     "${((d2.hour + 11) % 12) + 1}:${d2.minute}:${d2.second} ${d2.hour > 11 ? "pm" : "am"}";
    print(d1);
    print(d2);
    print( widget.outTime );

    Duration dif = d2.difference(d1);

    completedHours = formatHHMMSS(dif.inSeconds);
    print(formatHHMMSS(dif.inSeconds));

  }

  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    // if (hours == 0) {
    //   return '$hoursStr:$minutesStr:$secondsStr';
    // }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomEndDrawer(),
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
                        children: [
                          Text(
                            "${widget.user?.name}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 19),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            DateFormat("EEEE, dd MMM, yyyy")
                                .format(DateTime.now()),
                            style: const TextStyle(
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
                          children:  [
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
                              "$completedHours s",
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
                    _isDigitSelected
                        ? _getOtpKeyboard
                        : GestureDetector(
                            onTap: () {
                              clockOut();
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
                _isDigitSelected = true;
              });
            },
            child: _otpTextField(_firstDigit)),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                _isDigitSelected = true;
              });
            },
            child: _otpTextField(_secondDigit)),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                _isDigitSelected = true;
              });
            },
            child: _otpTextField(_thirdDigit)),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                _isDigitSelected = true;
              });
            },
            child: _otpTextField(_fourthDigit)),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                _isDigitSelected = true;
              });
            },
            child: _otpTextField(_fifthDigit)),
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

  get _getOtpKeyboard {
    return Container(
        //color: Colors.white,
        height: _screenSize.width - 80,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _otpKeyboardInputButton(
                      label: "1",
                      onPressed: () {
                        _setCurrentDigit(1);
                      }),
                  _otpKeyboardInputButton(
                      label: "2",
                      onPressed: () {
                        _setCurrentDigit(2);
                      }),
                  _otpKeyboardInputButton(
                      label: "3",
                      onPressed: () {
                        _setCurrentDigit(3);
                      }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _otpKeyboardInputButton(
                      label: "4",
                      onPressed: () {
                        _setCurrentDigit(4);
                      }),
                  _otpKeyboardInputButton(
                      label: "5",
                      onPressed: () {
                        _setCurrentDigit(5);
                      }),
                  _otpKeyboardInputButton(
                      label: "6",
                      onPressed: () {
                        _setCurrentDigit(6);
                      }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _otpKeyboardInputButton(
                      label: "7",
                      onPressed: () {
                        _setCurrentDigit(7);
                      }),
                  _otpKeyboardInputButton(
                      label: "8",
                      onPressed: () {
                        _setCurrentDigit(8);
                      }),
                  _otpKeyboardInputButton(
                      label: "9",
                      onPressed: () {
                        _setCurrentDigit(9);
                      }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                  ),
                  _otpKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  _otpKeyboardActionButton(
                      label: Icon(
                        Icons.backspace,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_fifthDigit != null) {
                            _fifthDigit = null;
                          } else if (_fourthDigit != null) {
                            _fourthDigit = null;
                          } else if (_thirdDigit != null) {
                            _thirdDigit = null;
                          } else if (_secondDigit != null) {
                            _secondDigit = null;
                          } else if (_firstDigit != null) {
                            _firstDigit = null;
                          }
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  // Returns "Otp keyboard action Button"
  _otpKeyboardActionButton(
      {required Widget label, required VoidCallback onPressed}) {
    return new InkWell(
      onTap: onPressed,
      borderRadius: new BorderRadius.circular(40.0),
      child: new Container(
        height: 80.0,
        width: 80.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Center(
          child: label,
        ),
      ),
    );
  }

  // Current digit
  void _setCurrentDigit(int i) {
    setState(() {
      _currentDigit = i;
      if (_firstDigit == null) {
        _firstDigit = _currentDigit;
      } else if (_secondDigit == null) {
        _secondDigit = _currentDigit;
      } else if (_thirdDigit == null) {
        _thirdDigit = _currentDigit;
      } else if (_fourthDigit == null) {
        _fourthDigit = _currentDigit;
      } else if (_fifthDigit == null) {
        _fifthDigit = _currentDigit;

        pinCode = _firstDigit.toString() +
            _secondDigit.toString() +
            _thirdDigit.toString() +
            _fourthDigit.toString() +
            _fifthDigit.toString();

        _isDigitSelected = false;
        // widget.otp = otp;

        // Verify your otp by here. API call
      }
    });
  }

  Widget _otpKeyboardInputButton(
      {required String label, required VoidCallback onPressed}) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: onPressed,
        borderRadius: new BorderRadius.circular(40.0),
        child: new Container(
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: new Center(
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
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
                            if (widget.user?.isAdmin == "1") {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (c) => LoggedInHomeScreen(
                                        user: widget.user,
                                      )),
                                  ModalRoute.withName('/loggedInHome'));
                            }else{

                            }
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

  void clockOut() {
    Map map = Map();
    map['employee_id'] = widget.user?.id;
    map['assigned_date'] = DateFormat("yyyy-MM-dd").format(DateTime.now());
    map['completed_hours'] = completedHours;
    map['out_time'] = //widget.outTime;
        "${((DateTime.now().hour + 11) % 12) + 1}:${DateTime.now().minute}:${DateTime.now().second} ${DateTime.now().hour > 11 ? "pm" : "am"}";

    _clockOutBloc?.clockOut(map).then((value) {
      if (value['status_code'] == 200) {
        showClockOutDialog();
      }
    });
  }
}
