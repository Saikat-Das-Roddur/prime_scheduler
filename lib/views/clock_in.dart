import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:prime_scheduler/bloc/clock_in_bloc.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';
import 'package:prime_scheduler/views/clock_in_and_out.dart';
import 'package:prime_scheduler/views/custom_end_drawer.dart';
import 'package:prime_scheduler/views/schedule_welcome_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'add_single_employee.dart';
import 'logged_in_home.dart';

class ClockIn extends StatefulWidget {
  User? user;

  ClockIn({Key? key, this.user}) : super(key: key);

  @override
  _ClockInState createState() => _ClockInState();
}

class _ClockInState extends State<ClockIn> {
  late int _currentDigit;
  var _firstDigit;
  var _secondDigit;
  var _thirdDigit;
  var _fourthDigit;
  var _fifthDigit;
  var pinCode;
  bool _isDigitSelected = false;
  late Size _screenSize;
  String? inTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ClockInBloc? _clockInBloc;
  ProgressDialog? progressDialog;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   // Got a new connectivity status!
    //   progressDialog?.hide();
    //
    // });

    Future.delayed(Duration.zero, () {
      _clockInBloc = ClockInBloc();
      checkUserIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomEndDrawer(
        user: widget.user,
      ),
      backgroundColor: Color(0xffF06767),
      //bottomNavigationBar: _isDigitSelected ? _getOtpKeyboard :null,
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
                                onTap: () {
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

                  _isDigitSelected
                      ? _getOtpKeyboard
                      : GestureDetector(
                          onTap: () {
                            print(widget.user);
                            print(pinCode);
                            if (widget.user?.pinCode.toString() == pinCode) {
                              clockIn();
                              print(
                                  "${((DateTime.now().hour + 11) % 12) + 1} : ${DateTime.now().minute} :${DateTime.now().second} ${DateTime.now().hour > 11 ? "pm" : "am"}");
                            } else {
                              Fluttertoast.showToast(msg: "Pin mismatched");
                            }
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
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(40.0),
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkUserIn() async {
    progressDialog = ProgressDialog(context, isDismissible: false);
    await progressDialog?.show();
    await _clockInBloc
        ?.checkUserIn(
            widget.user?.isAdmin == "1"
                ? widget.user?.id
                : widget.user?.employeeId,
            DateFormat("yyyy-MM-dd").format(DateTime.now()))
        .then((value) {
      progressDialog?.hide();
      if (value['status_code'] == 403) {
      } else if (value['status_code'] == 200) {
        if (widget.user?.isAdmin == "1") {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (c) => ClockInAndOut(
                  user: widget.user,
                  inTime: DateFormat("yyyy-MM-dd").format(DateTime.now()) +
                      " " +
                      value['attendance']['in_time'],
                  assignedHours: value['attendance']['assigned_hours'],
                  endTime: value['schedule']['end_time'],
                ),
              ));
        } else {
          print(value);
          print("hare");
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                  builder: (c) => ClockInAndOut(
                        user: widget.user,
                        inTime:
                            DateFormat("yyyy-MM-dd").format(DateTime.now()) +
                                " " +
                                value['attendance']['in_time'],
                        assignedHours: value['attendance']['assigned_hours'],
                        endTime: value['schedule']['end_time'],
                        location: value['schedule']['location'],
                      )),
              ModalRoute.withName('/clockInAndOut'));
        }
      } else if (value['status_code'] == 201) {
        //showClockOutDialog();
      }
    });
  }

  showClockOutDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
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
                            children: const [
                              Flexible(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Clocked Out",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xffF06767),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.pop(context);
                              //   },
                              //   child: Align(
                              //     alignment: Alignment.centerRight,
                              //     child: SvgPicture.asset(
                              //       "assets/images/Group 165.svg",
                              //       color: Colors.black,
                              //     ),
                              //   ),
                              // ),
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
                              } else {}
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
            ),
          );
        });
  }

  void clockIn() async {
    progressDialog = ProgressDialog(context, isDismissible: true);
    progressDialog?.show();
    //((DateTime.now().hour + 11) % 12) + 1
    Map map = Map();
    map['employee_id'] =
        widget.user?.isAdmin == "1" ? widget.user?.id : widget.user?.employeeId;
    map['admin_id'] = widget.user?.lineAdminId;
    map['assigned_date'] = DateFormat("yyyy-MM-dd").format(DateTime.now());
    map['in_time'] =
        "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')} ${DateTime.now().hour > 11 ? "pm" : "am"}";
    print(map);
    //await _clockInBloc?.clockIn(map);
    post("attendance/check_in.php", body: map);
  }

  Future<dynamic> post(String url, {required Map body}) async {
    var responseJson;

    try {
      await http
          .post(
        Uri.parse(CustomStrings.baseUrl + url),
        body: body,
      )
          .then((value) {
        progressDialog?.hide();
        Map map = json.decode(value.body);
        if (map['status_code'] == 200) {
          if (widget.user?.isAdmin == "1") {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (c) => ClockInAndOut(
                          user: widget.user,
                          inTime: body['assigned_date'] + " " + body['in_time'],
                          assignedHours: map['assigned_hours'],
                          endTime: map['schedule']['end_time'],
                        )));
          } else {
            print(map['schedule']['location']);
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                    builder: (c) => ClockInAndOut(
                          user: widget.user,
                          inTime: body['assigned_date'] + " " + body['in_time'],
                          assignedHours: map['assigned_hours'],
                          endTime: map['schedule']['end_time'],
                          location: map['schedule']['location'],
                        )),
                ModalRoute.withName('/clockInAndOut'));
          }
        } else if (map['status_code'] == 403) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('You have no schedule for today. View schedules?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (c) => ScheduleWelcomeScreen(
                              user: widget.user,
                            )),
                        ModalRoute.withName('/scheduleWelcomeScreen'));
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
          //Fluttertoast.showToast(msg: "You have no schedule for today");
        } else if (map['status_code'] == 400) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('You checked out already. View schedules?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (c) => ScheduleWelcomeScreen(
                              user: widget.user,
                            )),
                        ModalRoute.withName('/scheduleWelcomeScreen'));
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );

          print(map);
          //Fluttertoast.showToast(msg: "You checked out already");
        }
      });
      print(CustomStrings.baseUrl + url);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
