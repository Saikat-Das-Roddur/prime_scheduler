import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prime_scheduler/bloc/step_3_bloc.dart';
import 'package:prime_scheduler/models/registration_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';
import 'package:prime_scheduler/views/login_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Step3 extends StatefulWidget {
  Map map;

  Step3({Key? key, required this.map}) : super(key: key);

  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  late Step3Bloc _step3bloc;
  bool passwordVisible = false, value = false, isValidEmail = false, isValidPassword = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RegExp _regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
      _emailExp = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  ProgressDialog? progressDialog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _step3bloc = Step3Bloc();

  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, isDismissible: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
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
                obscureText: !passwordVisible,
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
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
              child: Text(
                "Password must be 8 characters, 1uppercase letter,1 lowercase letter, minimum 1 number",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .15,
            ),
            CheckboxListTile(
                activeColor: const Color(0xFFF06767),
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                  text: const TextSpan(
                      text: "I have read and agree to the ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text:
                                "Terms of Use,Terms of service, Privacy Policy,",
                            style: TextStyle(
                                color: Color(0xFFF06767),
                                decoration: TextDecoration.underline)),
                        TextSpan(text: " and "),
                        TextSpan(
                            text: "Privacy Notice for California Residents.",
                            style: TextStyle(
                                color: Color(0xFFF06767),
                                decoration: TextDecoration.underline))
                      ]),
                ),
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = !value;
                  });
                }),
            SizedBox(
              height: MediaQuery.of(context).size.width * .18,
            ),
            const Text(
              "Step 3 of 3",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xff585858)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(96, 2, 96, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                height: 1,
                child: Container(
                  color: const Color(0xffC5C5C5),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 2,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 12),
                const CircleAvatar(
                  radius: 2,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 20,
                  height: 3,
                  child: Container(
                    color: const Color(0xff59C69C),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .08,
            ),
            GestureDetector(
              onTap: () {
                if (!isValidEmail) {
                  Fluttertoast.showToast(msg: "Enter valid email");
                  return;
                } else if (!isValidPassword&&_passwordController.text.length<8) {
                  Fluttertoast.showToast(
                      msg: "Password not valid");
                  return;
                } else if (value == false) {
                  Fluttertoast.showToast(
                      msg: "Terms and conditions not accepted");
                  return;
                } else {
                  widget.map['email'] = _emailController.text;
                  widget.map['password'] = _passwordController.text;
                  //widget.map['is_admin'] = 0;
                  print(widget.map);
                  signUp();

                }
                // Navigator.push(
                //     context, CupertinoPageRoute(builder: (c) => const Step3()));
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
                      "Create Account",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .02,
            ),
          ],
        ),
      ),
    );
  }

  void signUp() {
    progressDialog?.show();
    post("user/sign_up.php", body: widget.map);
  }

  Future<dynamic> post(String url, {required Map body}) async {
    var responseJson;

    try {
      await http
          .post(Uri.parse(CustomStrings.baseUrl + url), body: body,).then((value){
            RegistrationResponse response = RegistrationResponse.fromJson(json.decode(value.body));
        if(response.status==200){
          progressDialog?.hide();
          Fluttertoast.showToast(msg: "${response.message}");
          Navigator.pushAndRemoveUntil(
              context, CupertinoPageRoute(
              builder: (context) =>
                  LogInScreen()), ModalRoute.withName('/logIn'));
        }else{
          progressDialog?.hide();
          Fluttertoast.showToast(msg: "${response.message}");
        }
      });
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
