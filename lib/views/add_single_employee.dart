import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:prime_scheduler/bloc/add_employee_bloc.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';
import 'package:prime_scheduler/views/custom_end_drawer.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSingleEmployee extends StatefulWidget {
  User? user;

  AddSingleEmployee({Key? key, this.user}) : super(key: key);

  @override
  _AddSingleEmployeeState createState() => _AddSingleEmployeeState();
}

class _AddSingleEmployeeState extends State<AddSingleEmployee> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _socialInsuranceNoController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime dateTime = DateTime.now();
  String dob = "";
  bool isValidEmail = false, isValidSin = false;
  RegExp _regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
      _emailExp = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'),
      _sinExp = RegExp(r'^(\d{3}-\d{3}-\d{3})|(\d{9})$'),
      _phoneExp = RegExp(
          r'^(\+?1 ?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$');
  late ProgressDialog progressDialog;
  late AddEmployeeBloc _addEmployeeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addEmployeeBloc = AddEmployeeBloc();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      progressDialog.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, isDismissible: false);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomEndDrawer(
        user: widget.user,
      ),
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
                          "Adding 1 Employee",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 19),
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
                            color: const Color(0xff050505),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 8, 36, 24),
                        child: TextField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(
                        height: 20,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16.0, top: 2, right: 28),
                          child: Text(
                            "Name",
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 8, 36, 24),
                        child: TextField(
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          onChanged: (v) =>
                              isValidEmail = _emailExp.hasMatch(v),
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(
                        height: 20,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16.0, top: 2, right: 28),
                          child: Text(
                            "Email",
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 8, 36, 24),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.grey,
                          maxLength: 11,
                          textInputAction: TextInputAction.next,
                          controller: _mobileController,
                          //onChanged: (v) => isValidSin = _sinExp.hasMatch(v),
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(
                        height: 20,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16.0, top: 2, right: 28),
                          child: Text(
                            "Mobile",
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 8, 36, 24),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.grey,
                          //maxLength: 11,
                          textInputAction: TextInputAction.done,
                          controller: _socialInsuranceNoController,
                          onChanged: (v) => isValidSin = _sinExp.hasMatch(v),
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(
                        height: 20,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16.0, right: 28, top: 2),
                          child: Text(
                            "Social insurance number",
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 8, 36, 24),
                        child: TextField(
                          controller: _dobController,
                          autofocus: false,
                          focusNode: AlwaysDisabledFocusNode(),
                          onTap: () async {
                            await showDate(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(
                        height: 20,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16.0, top: 2, right: 28),
                          child: Text(
                            "Date of birth",
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            GestureDetector(
              onTap: () {
                if (_nameController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Name can't be empty");
                  return;
                } else if (!isValidEmail) {
                  Fluttertoast.showToast(msg: "Enter valid email");
                  return;
                } else if (_mobileController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Invalid contact no.");
                  return;
                } else if (!isValidSin) {
                  Fluttertoast.showToast(
                      msg: "Social Insurance number not valid");
                  return;
                } else if (_dobController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please select a date");
                  return;
                } else {
                  Map map = Map();
                  map['email'] = _emailController.text;
                  map['name'] = _nameController.text;
                  map['phone'] = _mobileController.text;
                  map['social_insurance_number'] =
                      _socialInsuranceNoController.text;
                  map['birthday'] = _dobController.text;
                  map['line_admin_id'] = widget.user?.id;
                  map['root_admin_id'] =
                      widget.user?.rootAdminId ?? widget.user?.id;
                  //widget.map['is_admin'] = 0;
                  print(map);
                  addEmployee(map);
                }
                // Navigator.push(
                //     context, CupertinoPageRoute(builder: (context) =>
                // const LogInScreen()
                // ));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 36, left: 36),
                child: Container(
                  //color: ,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color(0xFF59C69C),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14))),
                  child: const Align(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 36.0),
              child: Text(
                "Skip this employee",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: Color(0xffF06767)),
              ),
            ),
            const SizedBox(
              height: 24,
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

  Future showDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
      // builder: (context, child) {
      //   return Theme(
      //     data: Theme.of(context).copyWith(
      //       colorScheme: const ColorScheme.light(
      //         //primary: MyColors.accent, // header background color
      //         onPrimary: Colors.white, // header text color
      //         onSurface: Colors.black, // body text color
      //       ),
      //       textButtonTheme: TextButtonThemeData(
      //         style: TextButton.styleFrom(
      //           //primary: MyColors.accent, // button text color
      //         ),
      //       ),
      //     ),
      //     child: child,
      //   );
      // },
    );
    if (selected != null && selected != dateTime) {
      _dobController
        ..text = DateFormat('yyyy-MM-dd').format(selected)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dobController.text.length,
            affinity: TextAffinity.upstream));
      print(_dobController.text.toString());
    }
  }

  void addEmployee(Map map) async {
    //ProgressDialog progressDialog = ProgressDialog(context, isDismissible: false);

    progressDialog.show();

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // I am connected to a mobile network.
      progressDialog.hide();
      Fluttertoast.showToast(msg: "No Internet connection");
    } else {
      post("employee/add_employee.php", map);
      // _addEmployeeBloc.addEmployee(map).then((value) {
      //   print(value);
      //   //Fluttertoast.showToast(msg: value);
      //   progressDialog.hide();
      //
      //   if(value!=null){
      //     if (value['status_code'] == 200) {
      //       Fluttertoast.showToast(msg: "${value['message']}");
      //       Navigator.pushAndRemoveUntil(
      //           context,
      //           CupertinoPageRoute(
      //               builder: (context) => LoggedInHomeScreen(
      //                 user: widget.user,
      //               )),
      //           ModalRoute.withName('/loggedInHome'));
      //     } else {
      //       progressDialog.hide();
      //       Fluttertoast.showToast(msg: "${value['message']}");
      //     }
      //   }
      //
      //
      // });
    }
  }

  Future<dynamic> post(String url, Map body) async {
    var responseJson;

    try {
      await http
          .post(
        Uri.parse(CustomStrings.baseUrl + url),
        body: body,
      )
          .then((value) {
        if (value != null) {
          Map map = json.decode(value.body);
          print(map);
          //print(value.statusCode);
          if (map['status_code'] == 200) {

            Fluttertoast.showToast(msg: map['message']);
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                    builder: (context) => LoggedInHomeScreen(
                          user: widget.user,
                        )),
                ModalRoute.withName('/loggedInHome'));
          } else {
            progressDialog.hide();
            Fluttertoast.showToast(msg: map['message']);
          }
        }
      });
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
