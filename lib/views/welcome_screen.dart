import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_scheduler/bloc/welcome_screen_bloc.dart';
import 'package:prime_scheduler/views/home.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'clock_in.dart';
import 'logged_in_home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late ProgressDialog progressDialog;
  late SharedPreferences preferences;
  late WelcomeBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = WelcomeBloc();
    initSharedPref();
  }

  initSharedPref() async {
    preferences = await SharedPreferences.getInstance();
    checkLogIn();
  }

  checkLogIn() async {
    if (preferences.getBool("logged_in") == true) {
      progressDialog.show();
      if (preferences.getString("is_admin") == "1") {
        String? id = preferences.getString("admin_id");
        progressDialog.hide();
        _bloc.signInAdmin(id!).then((value) => {
              if (value?.user?.statusCode == 200)
                {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (c) => LoggedInHomeScreen(
                                user: value?.user,
                              )),
                      ModalRoute.withName('/loggedInHome'))
                }
            });
      } else {
        progressDialog.hide();
        String? id = preferences.getString("employee_id");
        _bloc.signInEmployee(id!).then((value) => {
              if (value?.user?.statusCode == 200)
                {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (c) => ClockIn(user: value?.user)),
                      ModalRoute.withName('/clockIn'))
                }
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, isDismissible: false);
    //checkLogIn();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              }, //exit(0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 56.0, right: 24),
                  child: SvgPicture.asset("assets/images/Group 165.svg"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, left: 100, right: 100),
              child: Text(
                "Welcome to Prime Scheduler!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF06767)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 72, right: 72),
              child: Text(
                "How can we help you?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Prime Scheduler is built to simplify your life with perfect scheduler, an engaged workforce, and complete labor compliance.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            SvgPicture.asset("assets/images/Group 160.svg"),
            SvgPicture.asset("assets/images/Vector 28.svg"),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (c) => Home()),
                    ModalRoute.withName('/home'));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Container(
                  //color: ,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF06767),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14))),
                  child: const Align(
                    child: Text(
                      "Create new scheduler",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
