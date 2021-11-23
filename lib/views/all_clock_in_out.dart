import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AllClockInOut extends StatefulWidget {
  const AllClockInOut({Key? key}) : super(key: key);

  @override
  _AllClockInOutState createState() => _AllClockInOutState();
}

class _AllClockInOutState extends State<AllClockInOut> {
  int _toHour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
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
                        bottomLeft: Radius.circular(48.0)),
                  )),
              //Container(height: 48,width:72, padding: EdgeInsets.all(24),decoration: const BoxDecoration(color: Color(0xffF06767),shape: BoxShape.circle),child: SvgPicture.asset("assets/images/Vector 49.svg"),),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: SvgPicture.asset(
                  "assets/images/Group 186.svg",
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                          "Clock In & Out",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "assets/images/Group 176.svg",
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24,36,24.0,36),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                       final newValue = _toHour-1;
                        // if(_toHour<0){
                        //   _toHour = 1;
                        // }
                        _toHour = newValue.clamp(1, 12);
                      });

                    },
                    child: SvgPicture.asset(
                      "assets/images/Group 201.svg",
                      color: Colors.black,
                    ),
                  ),
                  //SizedBox(width: 4,),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NumberPicker(
                          value: _toHour,
                          itemHeight: 32,
                          itemWidth: 110,
                          minValue: 1,
                          maxValue: 12,
                          //zeroPad: true,
                          axis: Axis.horizontal,
                          // decoration: BoxDecoration(
                          //   border: Border(
                          //     bottom: BorderSide(
                          //       color: Colors.black,
                          //       width: 4,
                          //     )
                          //   )
                          // ),
                          //step: 10,
                          haptics: true,
                          infiniteLoop: true,
                          selectedTextStyle: const TextStyle(
                              color: Color(0xff59C69C),
                              fontSize: 22,
                              // decoration: TextDecoration.underline,
                              // decorationThickness: 4,
                              // decorationColor: Color(0xffC8C8C8),
                              fontWeight: FontWeight.w400
                          ),
                          textStyle: const TextStyle(
                              color: Color(0xffB4B4B4),
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                          textMapper: (text) =>  DateFormat.MMMM().format(DateTime(DateTime.now().year,int.parse(text))),
                          onChanged: (value) => setState(() => _toHour = value),
                        ),
                        SizedBox(height: 4, width: 36, child: Container( decoration: BoxDecoration(
                            color: Color(0xffF06767),
                            borderRadius: BorderRadius.circular(36)
                        ),),),
                      ],
                    ),
                  ),
                  SizedBox(width: 8,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        final newValue = _toHour +1;
                        _toHour = newValue.clamp(1, 12);
                      });

                    },
                    child: SvgPicture.asset(
                      "assets/images/Group 202.svg",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 7,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16, bottom: 16),
                  child: Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(24))),
                    color: index==0?const Color(0xffFFCC00):const Color(0xffEFEEFF),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,8,12,8),
                          child: Card(
                            color: Colors.white,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12, 16, 12, 16),
                              child: Column(
                                children: const [
                                  Text("Today", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),),
                                  SizedBox(height: 16,),
                                  Text(
                                    "MON",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,8,24,8),
                          child: Column(
                            children: [
                              const Text("Clock in", style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                              const SizedBox(height: 16,),
                              Text(
                                "MON",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: index==0?Colors.white:const Color(0xff9F9F9F),
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,8.0,24,8),
                          child: Column(
                            children: const [
                              Text("Clock out", style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: 16,),
                              Text(
                                "",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
