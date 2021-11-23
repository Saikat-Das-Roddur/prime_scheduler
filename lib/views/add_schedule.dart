import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  int _toHour = DateTime.now().hour;
  int _toMinute = DateTime.now().minute;
   int _toAmPm = 0;
   int _fromAmPm = 0;
  int _fromHour = DateTime.now().hour;
  int _fromMinute = DateTime.now().minute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
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
                  Align(
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
                  const Flexible(
                      //flex: 3,
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Add Schedule",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                  )),
                  // Flexible(
                  //     flex: 1,
                  //     child: Align(
                  //       alignment: Alignment.centerRight,
                  //       child: SvgPicture.asset(
                  //         "assets/images/Group 176.svg",
                  //         color: Colors.black,
                  //       ),
                  //     )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                top: 36,
              ),
              child: Text("Add Date"),
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
              color: const Color(0xffF0EFFF),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                top: 12,
              ),
              child: Text("Add Location"),
            ),
            Container(
              //height: 150,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
              color: const Color(0xffF0EFFF),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, right: 36, bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/Group 218.svg"),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: const TextField(
                          cursorHeight: 24,
                          cursorColor: Color(0xffC8C8C8),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            constraints: BoxConstraints(maxHeight: 32),
                            contentPadding:
                                EdgeInsets.only(bottom: 20, left: 8),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                top: 12,
              ),
              child: Text("Add Name"),
            ),
            Container(
              //height: 150,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
              color: const Color(0xffF0EFFF),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, right: 36, bottom: 12),
                child: Container(
                  color: const Color(0xffF0EFFF),
                  margin: EdgeInsets.only(left: 36),
                  child: const TextField(
                    cursorHeight: 28,
                    cursorColor: Color(0xffC8C8C8),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      constraints: BoxConstraints(maxHeight: 32),
                      contentPadding: EdgeInsets.only(bottom: 20, left: 0),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                top: 12,
              ),
              child: Text("Terms"),
            ),
            Container(
              color: const Color(0xffF0EFFF),
              margin: const EdgeInsets.only(left: 16, top: 12, right: 16),
              // width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.only(top: 8, left: 12, right: 36, bottom: 8),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/Vector 32.svg",
                    color: const Color(0xffA8A8A8),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      hint: Text("Wow"),
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      icon: Container(),
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
                        print(v);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 12,
              ),
              child: Row(
                children: const [
                  Text("Terms"),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.only(right: 36.0),
                    child: Align(
                        alignment: Alignment.center, child: Text("To - From", style: TextStyle(
                      color: Color(0xffA4A4A4),
                      fontWeight: FontWeight.w300,
                      fontSize: 14
                    ),)),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36,16.0,36,16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(36)
                      ),
                      child: NumberPicker(
                        value: _toHour,
                        itemHeight: 36,
                        minValue: 0,
                        maxValue: 12,
                        zeroPad: true,
                        //step: 10,
                        haptics: true,
                        infiniteLoop: true,
                        selectedTextStyle: const TextStyle(
                          color: Color(0xff59C69C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) => setState(() => _toHour = value),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: NumberPicker(
                        value: _toMinute,
                        itemHeight: 36,
                        minValue: 0,
                        maxValue: 59,
                        zeroPad: true,
                        //step: 10,
                        haptics: true,
                        infiniteLoop: true,
                        selectedTextStyle: const TextStyle(
                            color: Color(0xff59C69C),
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) => setState(() => _toMinute = value),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: NumberPicker(
                        value: _toAmPm,
                        minValue: 0,
                        maxValue: 1,
                        itemHeight: 36,
                        //step: 10,
                        haptics: true,
                        //infiniteLoop: true,
                        selectedTextStyle: const TextStyle(
                            color: Color(0xff59C69C),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                        ),
                        textMapper: (text)=> double.parse(text)==0?"AM":"PM",
                        onChanged: (value) => setState(() => _toAmPm = value),
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  SizedBox(height: 4, width: 24, child: Container( decoration: BoxDecoration(
                      color: Color(0xffC8C8C8),
                      borderRadius: BorderRadius.circular(36)
                  ),),),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: NumberPicker(
                        value: _fromHour,
                        minValue: 0,
                        maxValue: 12,
                        itemHeight: 36,
                        zeroPad: true,
                        //step: 10,
                        haptics: true,
                        infiniteLoop: true,
                        selectedTextStyle: const TextStyle(
                            color: Color(0xff59C69C),
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) => setState(() => _fromHour = value),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: NumberPicker(
                        value: _fromMinute,
                        minValue: 0,
                        maxValue: 59,
                        itemHeight: 36,
                        //step: 10,
                        haptics: true,
                        infiniteLoop: true,
                        selectedTextStyle: const TextStyle(
                            color: Color(0xff59C69C),
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                        zeroPad: true,
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) => setState(() => _fromMinute = value),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: NumberPicker(
                        value: _fromAmPm,
                        minValue: 0,
                        maxValue: 1,
                        itemHeight: 36,
                        //step: 10,
                        haptics: true,
                       // infiniteLoop: true,
                        selectedTextStyle: const TextStyle(
                            color: Color(0xff59C69C),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                        ),
                        textMapper: (text)=> double.parse(text)==0?"AM":"PM",
                        onChanged: (value) => setState(() => _fromAmPm = value),
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
