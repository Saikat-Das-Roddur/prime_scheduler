import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/login_screen.dart';
import 'package:prime_scheduler/views/registration_step_2.dart';

class Step1 extends StatefulWidget {
  String? provider;
  User? user;

  Step1({Key? key, this.provider, this.user}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  var _selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.user!=null){
      _nameController.text="${widget.user?.name}";
    }
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.user!=null){
    // _nameController.text="${widget.user?.name}";
    // }

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
                "Admin name",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: TextField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                // onSubmitted: (v) {
                //   FocusScope.of(context).nextFocus();
                // },
                cursorColor: Colors.grey,
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
                "Phone",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                maxLength: 11,
                // onSubmitted: (v) {
                //   FocusScope.of(context).nextFocus();
                // },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                  focusColor: Colors.grey,
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.redAccent)),
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
                "Location",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: TextField(
                controller: _locationController,
                cursorColor: Colors.grey,
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
                "Category",
                style: TextStyle(
                  color: Color(0xff59C69C),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              padding: EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffE0E0E0))),
              child: DropdownButton<String>(
                //hint: Text("Wow"),
                underline: const SizedBox.shrink(),
                isExpanded: true,
                value: _selectedValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    _selectedValue = v!;
                  });
                  print(v);
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
            //   child: TextField(
            //     cursorColor: Colors.grey,
            //     decoration: InputDecoration(
            //       suffixIcon: const Icon(
            //         Icons.keyboard_arrow_down,
            //         color: Colors.grey,
            //       ),
            //       contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide: const BorderSide(color: Color(0xffE0E0E0))),
            //       focusColor: Colors.grey,
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide: const BorderSide(color: Color(0xffE0E0E0))),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide: const BorderSide(color: Color(0xffE0E0E0))),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .15,
            ),
            const Text(
              "Step 1 of 3",
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
                if (_nameController.text.trim().length < 3) {
                  Fluttertoast.showToast(
                      msg: "Name must be more than 3 letters");
                  return;
                } else if (_phoneController.text.trim().length != 11) {
                  Fluttertoast.showToast(msg: "Contact no must be 11 letters");
                  return;
                } else if (_locationController.text.trim().isEmpty) {
                  Fluttertoast.showToast(msg: "Location can't be empty");
                  return;
                } else if (_selectedValue == null) {
                  Fluttertoast.showToast(msg: "Category can't be empty");
                  return;
                } else {
                  Map map = Map();
                  map['name'] = _nameController.text;
                  map['phone'] = _phoneController.text;
                  map['location'] = _locationController.text;
                  map['category'] = _selectedValue;
                  print(map);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (c) => Step2(
                                map: map,
                                provider: widget.provider,
                                user: widget.user,
                              )));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Container(
                  //color: ,
                  height: 50,
                  decoration: BoxDecoration(
                      color: _nameController.text.isEmpty ||
                              _phoneController.text.isEmpty ||
                              _locationController.text.isEmpty ||
                              _selectedValue == null
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
              height: MediaQuery.of(context).size.width * .08,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (c) => const LogInScreen()));
                },
                child: RichText(
                  text: const TextSpan(
                      text: "Have account ?",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            text: "Signin",
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
          ],
        ),
      ),
    );
  }
}
