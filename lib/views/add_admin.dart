import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'add_single_employee.dart';

class AddAdmin extends StatelessWidget {
  const AddAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffF1F1F1),//Color(0xffF06767),

      body: SingleChildScrollView(
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color(0xffF06767),
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(36.0,48,36, 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Add employees", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25
                    ),),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                    const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.12,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (c) => const AddSingleEmployee()));
                      },
                      child: Container(
                        //color: ,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14))),
                        child: const Align(
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //color: const Color(0xffF1F1F1),
              height: MediaQuery.of(context).size.height * .6,
              decoration: const BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36), bottomRight: Radius.circular(36))
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: SvgPicture.asset(
                      "assets/images/Group 242.svg",
                      width: MediaQuery.of(context).size.width,
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
}
