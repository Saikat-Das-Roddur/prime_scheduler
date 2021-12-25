import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prime_scheduler/bloc/log_in_bloc.dart';
import 'package:prime_scheduler/views/clock_in.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'registration_step_1.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool passwordVisible = false,
      value = false,
      isValidEmail = false,
      isValidPassword = false;

  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RegExp _regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
      _emailExp = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  ProgressDialog? progressDialog;
  late LogInBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = LogInBloc();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      progressDialog?.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 56.0, left: 24),
                  child: SvgPicture.asset(
                    "assets/images/Vector 31.svg",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 24),
                child: SvgPicture.asset("assets/images/Group.svg"),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, top: 48),
              child: Text(
                "Email",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: TextField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.grey,
                onChanged: (v) => isValidEmail = _emailExp.hasMatch(v),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, top: 0),
              child: Text(
                "Password",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: passwordVisible,
                //maxLength: 8,
                controller: _passwordController,
                cursorColor: Colors.grey,
                onChanged: (v) => isValidPassword = _regExp.hasMatch(v),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 0),
              child: GestureDetector(
                onTap: () {
                  if (_emailController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please enter your email");
                  } else if (!isValidEmail) {
                    Fluttertoast.showToast(msg: "Please enter valid email");
                  } else {
                    progressDialog =
                        ProgressDialog(context, isDismissible: false);
                    progressDialog?.show();
                    Map map = Map();
                    map['email'] = _emailController.text;
                    _bloc.forgetPassword(body: map).then((value) {
                      progressDialog?.hide();
                      if (value['status_code'] == 200) {
                        Fluttertoast.showToast(msg: value['message']);
                      } else if (value['status_code'] == 400) {
                        Fluttertoast.showToast(msg: value['message']);
                      } else if (value['status_code'] == 403) {
                        Fluttertoast.showToast(msg: value['message']);
                      }
                    });
                  }
                },
                child: const Text(
                  "Forget Password ?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),

            GestureDetector(
              onTap: () {
                if (!isValidEmail) {
                  Fluttertoast.showToast(msg: "Enter valid email");
                  return;
                } else if (!isValidPassword &&
                    _passwordController.text.length < 8) {
                  Fluttertoast.showToast(msg: "Password not valid");
                  return;
                } else {
                  Map map = Map();
                  map['email'] = _emailController.text;
                  map['password'] = _passwordController.text;
                  //widget.map['is_admin'] = 0;
                  print(map);
                  signIn(map);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
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
                      "LogIn",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            GestureDetector(
              onTap: () {
                signInWithGoogle();
                // Navigator.push(context,
                //     CupertinoPageRoute(builder: (context) => const Step1()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Container(
                  //color: ,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFF06767)),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24))),

                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 4, 24, 4),
                            child:
                                SvgPicture.asset("assets/images/Group 166.svg"),
                          )),
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text(
                            "LogIn with google",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFF06767)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * .08,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (c) => const Step1()));
                },
                child: RichText(
                  text: const TextSpan(
                      text: "Don’t have an account ? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            text: "Signup",
                            style: TextStyle(
                                color: Color(0xFFF06767),
                                decoration: TextDecoration.underline)),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .08,
            ),
            // SizedBox(
            //   height: MediaQuery
            //       .of(context)
            //       .size
            //       .height * .1,
            // ),
          ],
        ),
      ),
    );
  }

  void signIn(Map map) async {
    progressDialog = ProgressDialog(context, isDismissible: true);
    progressDialog?.show();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // I am connected to a mobile network.
      progressDialog?.hide();
      Fluttertoast.showToast(msg: "No Internet connection");
    } else {
      _bloc.signIn(body: map).then((value) {
        progressDialog?.hide();
        if (value != null) {
          if (value.user?.statusCode == 200) {
            Fluttertoast.showToast(msg: "${value.user?.message}");
            if (value.user?.isAdmin == "1") {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (c) => LoggedInHomeScreen(user: value.user)));
            } else {
              progressDialog?.hide();
              Navigator.push(
                  context, CupertinoPageRoute(builder: (c) => ClockIn()));
            }
          } else {
            progressDialog?.hide();
            Fluttertoast.showToast(msg: "${value.user?.message}");
          }
        }
      });
    }
  }

  Future<String> signInWithGoogle() async {
    progressDialog?.hide();
    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      Map map = new Map();

      //TEST USER
      /*map['uid'] = "5616186165181616";
      map['provider'] = "google";
      map['email'] = "test50@gmail.com";
      map['name'] = "test50";*/

      map['uid'] = googleSignInAccount.id;
      map['provider'] = "google";
      if (googleSignInAccount.email != null) {
        map['email'] = googleSignInAccount.email ?? "";
        //BaseFunctions().setEmail(googleSignInAccount.email);
      }
      if (googleSignInAccount.displayName != null) {
        map['name'] = googleSignInAccount.displayName ?? "";
        //BaseFunctions().setEmail(googleSignInAccount.displayName);
      }

      map['image'] = googleSignInAccount.photoUrl ?? "";

      print("GoogleUser::" + map.toString());

      // _logInBloc.socialLogIn(body: map).then((value){
      //   progressDialog.hide();
      //   this.logInResponse = value;
      //   if (logInResponse.status == 200) {
      //     print("Token :" + logInResponse.status.toString());
      //     BaseFunctions().setToken(logInResponse.token);
      //     gotoHomePage(context);
      //   }
      // }, onError: (v){
      //   print("Token : here");
      // }).noSuchMethod(throw UnauthorisedException());

      // this.logInResponse = await socialLogIn(
      //     progressDialog, "api/v1/users/social_login",
      //     body: map);
      //
      // if (logInResponse.status == 200) {
      //   //print("Token :" + logInResponse.token);
      //   BaseFunctions().setToken(logInResponse.token);
      //   gotoHomePage(context);
      // } else {
      //   //print("ResponseCode::" + logInResponse.status.toString());
      // }
    } on Exception catch (e) {
      print(e.toString());
      if (progressDialog!.isShowing()) {
        progressDialog?.hide();
      }
      //print('login failed :' + e.toString());
      // Fluttertoast.showToast(msg: e.toString());
    }
    return 'signInWithGoogle succeeded:';
  }
}
