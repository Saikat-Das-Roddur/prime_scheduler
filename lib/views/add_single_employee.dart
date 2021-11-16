import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class AddSingleEmployee extends StatefulWidget {
  const AddSingleEmployee({Key? key}) : super(key: key);

  @override
  _AddSingleEmployeeState createState() => _AddSingleEmployeeState();
}

class _AddSingleEmployeeState extends State<AddSingleEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            fontSize: 19
                          ),
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "assets/images/Group 176.svg",
                          color: const Color(0xff050505),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24,8,36,24),
                        child: const TextField(

                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(height: 20,child: Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 2, right: 28),
                      child: Text("Name",),
                    )),
                  ),


                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24,8,36,24),
                        child: TextField(

                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(height: 20,child: Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 2, right: 28),
                      child: Text("Email",),
                    )),
                  ),


                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24,8,36,24),
                        child: TextField(

                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(height: 20,child: Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 2, right: 28),
                      child: Text("Mobile",),
                    )),
                  ),


                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24,8,36,24),
                        child: TextField(

                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(height: 20,child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 28,top: 2),
                      child: Text("Social insurance number",),
                    )),
                  ),


                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      color: const Color(0xffF3F3F3),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24,8,36,24),
                        child: TextField(

                        ),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    color: Color(0xffE4DFDF),
                    child: SizedBox(height: 20,child: Padding(
                      padding: EdgeInsets.only(left: 16.0,top: 2, right: 28),
                      child: Text("Date of birth",),
                    )),
                  ),


                ],
              ),
            ),
            const SizedBox(height: 36,),
            GestureDetector(
              onTap: () {
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36,),
            const Padding(
              padding: EdgeInsets.only(right: 36.0),
              child: Text("Skip this employee",textAlign: TextAlign.end, style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                decorationColor: Color(0xffF06767)
              ),),
            ),
            const SizedBox(height: 24,),
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
                              bottomLeft: Radius.circular(48.0)),)),
                    //Container(height: 48,width:72, padding: EdgeInsets.all(24),decoration: const BoxDecoration(color: Color(0xffF06767),shape: BoxShape.circle),child: SvgPicture.asset("assets/images/Vector 49.svg"),),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: SvgPicture.asset("assets/images/Group 186.svg",),
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
}
