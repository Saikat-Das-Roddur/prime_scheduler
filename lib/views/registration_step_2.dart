import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prime_scheduler/views/registration_step_3.dart';

class Step2 extends StatefulWidget {
  Map map;

  Step2({Key? key, required this.map}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyEmailController = TextEditingController();
  TextEditingController _companyPhoneController = TextEditingController();

  Pattern p =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  @override
  Widget build(BuildContext context) {
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
                "Company name",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: TextField(
                cursorColor: Colors.grey,
                controller: _companyNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
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
                "Company email",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: TextField(
                cursorColor: Colors.grey,
                controller: _companyEmailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
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
                "Company Phone",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
              child: TextField(
                keyboardType: TextInputType.phone,
                cursorColor: Colors.grey,
                maxLength: 11,
                textInputAction: TextInputAction.done,
                controller: _companyPhoneController,
                decoration: InputDecoration(
                  counterText: "",
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
            SizedBox(
              height: MediaQuery.of(context).size.width * .36,
            ),
            const Text(
              "Step 2 of 3",
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
                SizedBox(
                  width: 20,
                  height: 3,
                  child: Container(
                    color: const Color(0xff59C69C),
                  ),
                ),
                const SizedBox(width: 12),
                const CircleAvatar(
                  radius: 2,
                  backgroundColor: Colors.grey,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .08,
            ),
            GestureDetector(
              onTap: () {
                if (_companyNameController.text.trim().length < 3) {
                  Fluttertoast.showToast(
                      msg: "Name must be more than 3 letters");
                  return;
                } else if (_companyPhoneController.text.trim().length != 11) {
                  Fluttertoast.showToast(msg: "Contact no must be 11 letters");
                  return;
                } else if (!_companyEmailController.text.contains("@") ||
                    !_companyEmailController.text.contains(".")) {
                  Fluttertoast.showToast(msg: "Invalid email");
                  return;
                } else {
                  Map map = widget.map;
                  map['company_name'] = _companyNameController.text;
                  map['company_email'] = _companyEmailController.text;
                  map['company_phone'] = _companyPhoneController.text;
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (c) => Step3(map: map)));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Container(
                  //color: ,
                  height: 50,
                  decoration: BoxDecoration(
                      color: _companyEmailController.text.isEmpty ||
                              _companyPhoneController.text.isEmpty ||
                              _companyNameController.text.isEmpty
                          ? const Color(0xFFFBBFBF)
                          : const Color(0xFFF06767),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14))),
                  child: const Align(
                    child: Text(
                      "Next",
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
}
