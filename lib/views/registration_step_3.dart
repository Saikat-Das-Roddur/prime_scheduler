import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Step3 extends StatefulWidget {
  Map map;
  Step3({Key? key, required this.map}) : super(key: key);

  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  bool passwordVisible = false, value = false;

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
                obscureText: passwordVisible,
                cursorColor: Colors.grey,
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
              height: MediaQuery.of(context).size.width*.02,
            ),
          ],
        ),
      ),
    );
  }
}
