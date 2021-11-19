import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_scheduler/views/add_single_employee.dart';

class AddEmployees extends StatelessWidget {
  const AddEmployees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,//const Color(0xffF1F1F1),
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
                    child: SvgPicture.asset("assets/images/Group 253.svg", width: MediaQuery.of(context).size.width,),
                  ),
                ],
              ),
            ),


             const SizedBox(height: 24,),

            Container(
              //color: Color(0xff59C69C),
              //height: MediaQuery.of(context).size.height*.5,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  color: Color(0xff59C69C),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36))
              ),
              padding: const EdgeInsets.fromLTRB(36.0,48,36, 36),
              //alignment: Alignment.bottomCenter,
              child: Column(
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
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.black),
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
}
