import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClockInAndOut extends StatefulWidget {
  const ClockInAndOut({Key? key}) : super(key: key);

  @override
  _ClockInAndOutState createState() => _ClockInAndOutState();
}

class _ClockInAndOutState extends State<ClockInAndOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              //color: const Color(0xffF1F1F1),
              //height: MediaQuery.of(context).size.height * .6,
              decoration: const BoxDecoration(
                  color: Color(0xff59C69C),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36))),
              child: Column(
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
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Clock In & Out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                "assets/images/Group 176.svg",
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(

                      ),
                      child: Container(
                        height: 370,

                          decoration: const BoxDecoration(
                              color: Color(0xffE5E5E5),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(36),
                                  topRight: Radius.circular(36),
                                  topLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36)))),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffE5E5E5),
              //height: MediaQuery.of(context).size.height*.5,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(36.0, 48, 36, 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Add admin",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .12,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context, CupertinoPageRoute(builder: (c) => const AddSingleAdmin()));
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
          ],
        ),
      ),
    );
  }
}
