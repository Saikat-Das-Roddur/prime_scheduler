import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prime_scheduler/bloc/add_admin_bloc.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';
import 'package:prime_scheduler/views/custom_end_drawer.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'logged_in_home.dart';

class AddSingleAdmin extends StatefulWidget {
  User? user;

  AddSingleAdmin({Key? key, this.user}) : super(key: key);

  @override
  _AddSingleAdminState createState() => _AddSingleAdminState();
}

class _AddSingleAdminState extends State<AddSingleAdmin> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  AddAdminBloc? _addAdminBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isValidEmail = false;
  ProgressDialog? progressDialog;
  RegExp _emailExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addAdminBloc = AddAdminBloc();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      progressDialog?.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomEndDrawer(
        user: widget.user,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
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
                            "Adding 1 Admin",
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
                            textInputAction: TextInputAction.done,
                            controller: _mobileController,
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
              const SizedBox(
                height: 36,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 36.0),
                child: Text(
                  "Skip this admin",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Color(0xff59C69C)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              GestureDetector(
                onTap: () {
                  if (!isValidEmail) {
                    Fluttertoast.showToast(msg: "Enter valid email");
                    return;
                  } else if (_mobileController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Invalid contact no.");
                    return;
                  } else if (_nameController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Name can't be empty");
                    return;
                  } else {
                    Map map = Map();
                    map['email'] = _emailController.text;
                    map['name'] = _nameController.text;
                    map['phone'] = _mobileController.text;
                    map['location'] = widget.user?.location;
                    map['category'] = widget.user?.category;
                    map['company_name'] = widget.user?.companyName;
                    map['company_email'] = widget.user?.companyEmail;
                    map['company_phone'] = widget.user?.companyPhone;
                    map['line_admin_id'] = widget.user?.id;
                    map['root_admin_id'] =
                        widget.user?.rootAdminId ?? widget.user?.id;
                    //widget.map['is_admin'] = 0;
                    print(map);
                    addAdmin(map);
                    // Navigator.push(
                    //     context, CupertinoPageRoute(builder: (context) =>
                    // const LogInScreen()
                    // ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 36, left: 36),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    //color: ,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color(0xffF06767),
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
                          child:
                              SvgPicture.asset("assets/images/Vector 49.svg"),
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
      ),
    );
  }

  void addAdmin(Map map) async {
    progressDialog?.show();
    var connectivityResult = await(Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // I am connected to a mobile network.
      progressDialog?.hide();
      Fluttertoast.showToast(msg: "No Internet connection");
    } else {
      post("admin/add_admin.php", body: map);
    }
  }

  Future<dynamic> post(String url, {required Map body}) async {
    var responseJson;

    try {
      await http
          .post(Uri.parse(CustomStrings.baseUrl + url), body: body,).then((value) {
        Map map = json.decode(value.body);
        progressDialog?.hide();
        if (map['status_code'] == 200) {
          Fluttertoast.showToast(msg: "${map['message']}");
        } else {
          progressDialog?.hide();
          Fluttertoast.showToast(msg: "${map['message']}");
        }
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
                builder: (context) => LoggedInHomeScreen(
                  user: widget.user,
                )),
            ModalRoute.withName('/loggedInHome'));
      });

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
