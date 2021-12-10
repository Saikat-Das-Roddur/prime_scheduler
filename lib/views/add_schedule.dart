import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:prime_scheduler/bloc/add_schedule_bloc.dart';
import 'package:prime_scheduler/models/employee_response.dart';
import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/user_response.dart';

class AddSchedule extends StatefulWidget {
  User? user;

  AddSchedule({Key? key, this.user}) : super(key: key);

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  int _toHour = ((DateTime.now().hour + 11) % 12) + 1;
  int _month = DateTime.now().month;
  int _toMinute = DateTime.now().minute;
  int _toAmPm = 0;
  int _fromAmPm = 0;
  int _fromHour = ((DateTime.now().hour + 11) % 12) + 1;
  int _fromMinute = DateTime.now().minute;
  int _day = DateTime.now().day;
  Map map = {};
  List<Employee> employees = <Employee>[];
  var _selectedValue;

  AddScheduleBloc? _addScheduleBloc;
  final TextEditingController _typeAheadController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addScheduleBloc = AddScheduleBloc();
    map['assigned_date'] =
    "${DateTime.now().year}-$_month-$_day";
  }

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
              //height: 150,
              margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
              padding: EdgeInsets.all(24),
              color: const Color(0xffF0EFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final newValue = _month - 1;
                            // if(_toHour<0){
                            //   _toHour = 1;
                            // }
                            // DateUtils.getDaysInMonth(
                            //     DateTime.now().year, newValue);
                            _month = newValue.clamp(1, 12);
                            _day = 1;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/images/Group 247.svg",
                          // color: Colors.black,
                        ),
                      ),
                      //SizedBox(width: 4,),
                      Flexible(
                        child: Column(
                          children: [
                            NumberPicker(
                              value: _month,
                              itemHeight: 32,
                              itemWidth: 110,
                              minValue: 1,
                              maxValue: 12,
                              itemCount: 1,
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
                                  color: Colors.black,
                                  fontSize: 22,
                                  // decoration: TextDecoration.underline,
                                  // decorationThickness: 4,
                                  // decorationColor: Color(0xffC8C8C8),
                                  fontWeight: FontWeight.w400),
                              // textStyle: const TextStyle(
                              //     color: Colors.transparent,
                              //     fontSize: 0,
                              // ),
                              textMapper: (text) => DateFormat.MMMM().format(
                                  DateTime(
                                      DateTime.now().year, int.parse(text))),
                              onChanged: (value) {
                                setState(() {
                                  _month = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 2,
                              width: 24,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff59C69C),
                                    borderRadius: BorderRadius.circular(36)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final newValue = _month + 1;
                            _month = newValue.clamp(1, 12);
                            _day = 1;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/images/Group 252.svg",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 64,
                          width: 56,
                          decoration: BoxDecoration(
                              color: Color(0xff59C69C),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 8),
                          child: NumberPicker(
                            value: _day,
                            itemWidth: 64,
                            minValue: 1,
                            maxValue: DateUtils.getDaysInMonth(
                                DateTime.now().year, _month),
                            //DateTime(DateTime.now().year,_month).day,
                            itemCount: 5,
                            // step: 10,
                            zeroPad: true,
                            axis: Axis.horizontal,

                            //step: 10,
                            haptics: false,
                            infiniteLoop: true,
                            selectedTextStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                // decoration: TextDecoration.underline,
                                // decorationThickness: 4,
                                // decorationColor: Color(0xffC8C8C8),
                                fontWeight: FontWeight.w500),
                            textStyle: const TextStyle(
                              color: Color(0xff7B7B7B),
                              fontSize: 14,
                            ),
                            textMapper: (text) {
                              return DateFormat("EEE").format(DateTime(
                                      DateTime.now().year,
                                      _month,
                                      int.parse(text))) +
                                  "\n\n" +
                                  text;
                            },
                            onChanged: (value) => setState(() {
                              _day = value;
                              map['assigned_date'] =
                                  "${DateTime.now().year}-$_month-$_day";
                              print("${DateTime.now().year}-$_month-$_day");
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                        child: TextField(
                          controller: _locationController,
                          cursorHeight: 24,
                          cursorColor: const Color(0xffC8C8C8),
                          decoration: const InputDecoration(
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
                    child: TypeAheadField(
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        //autofocus: true,
                        // cursorHeight: 28,
                        controller: _typeAheadController,
                        cursorColor: const Color(0xffC8C8C8),
                        // style: DefaultTextStyle.of(context).style.copyWith(
                        //     fontStyle: FontStyle.italic
                        // ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          constraints: BoxConstraints(maxHeight: 32),
                          contentPadding: EdgeInsets.only(bottom: 20, left: 0),
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        Map map = Map();
                        map['admin_id'] = widget.user?.id;
                        map['term'] = pattern;

                        print(map);
                        await _addScheduleBloc
                            ?.searchEmployees(map)
                            .then((value) {
                          setState(() {
                            print("ggg");
                            employees = value!.employee!;
                          });
                        });

                        return employees;
                      },
                      itemBuilder: (context, suggestion) {
                        List list = [suggestion];
                        Employee e = list.elementAt(0);

                        return ListTile(
                          title: Text("${e.name}"),
                        );
                      },
                      errorBuilder: (_, __) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'No Employee Found!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 18.0),
                          ),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        List list = [suggestion];
                        Employee e = list.elementAt(0);
                        print(e.name);
                        map['employee_id'] = e.id;
                        map['employee_name'] = e.name;
                        this._typeAheadController.text = e.name!;
                      },
                    )

                    //   const TextField(
                    //   cursorHeight: 28,
                    //   cursorColor: Color(0xffC8C8C8),
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     focusedBorder: InputBorder.none,
                    //     enabledBorder: InputBorder.none,
                    //     errorBorder: InputBorder.none,
                    //     disabledBorder: InputBorder.none,
                    //     constraints: BoxConstraints(maxHeight: 32),
                    //     contentPadding: EdgeInsets.only(bottom: 20, left: 0),
                    //   ),
                    // ),
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
                      //hint: Text("Wow"),
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      value: _selectedValue,
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
                        setState(() {
                          _selectedValue = v!;
                        });
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
                  Text("Times"),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.only(right: 36.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "To - From",
                          style: TextStyle(
                              color: Color(0xffA4A4A4),
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        )),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 16.0, 36, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)),
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
                            fontWeight: FontWeight.w500),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) => setState(() => _toHour = value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)),
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
                            fontWeight: FontWeight.w500),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) => setState(() => _toMinute = value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)),
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
                            fontWeight: FontWeight.w500),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                        textMapper: (text) =>
                            double.parse(text) == 0 ? "AM" : "PM",
                        onChanged: (value) => setState(() => _toAmPm = value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    height: 4,
                    width: 24,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffC8C8C8),
                          borderRadius: BorderRadius.circular(36)),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)),
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
                            fontWeight: FontWeight.w500),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) => setState(() => _fromHour = value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)),
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
                            fontWeight: FontWeight.w500),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        zeroPad: true,
                        //textMapper: (text)=> double.parse(text)>9?text:"0$text",
                        onChanged: (value) =>
                            setState(() => _fromMinute = value),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(36)),
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
                            fontWeight: FontWeight.w500),
                        textStyle: const TextStyle(
                            color: Color(0xffBEBEBE),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                        textMapper: (text) =>
                            double.parse(text) == 0 ? "AM" : "PM",
                        onChanged: (value) => setState(() => _fromAmPm = value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Add Picture"),
                  Text.rich(TextSpan(
                      text: "+",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300),
                      children: [
                        WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SvgPicture.asset(
                                "assets/images/Group 210.svg",
                                height: 80,
                                width: 80,
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle)
                      ]))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_locationController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Location can't be empty");
                  return;
                } else if (_typeAheadController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Employee can't be empty");
                  return;
                } else if (_selectedValue == null) {
                  Fluttertoast.showToast(msg: "Select terms");
                  return;
                } else {
                  //   admin_id:1
                  //   assigned_date:22/12/2021
                  //   location:jkjkj
                  //   employee_id:5
                  //   terms:jj
                  //   start_time:11:56:AM
                  // end_time:11:50:PM
                  map['admin_id'] = widget.user?.id;
                  map['location'] = _locationController.text;
                  map['terms'] = _selectedValue;
                  map['start_time'] = "$_toHour:$_toMinute:${_toAmPm==0?"AM":"PM"}";
                  map['end_time'] = "$_fromHour:$_fromMinute:${_fromAmPm==0?"AM":"PM"}";

                  print(map);

                  addSchedule();
                }
                // Navigator.push(
                //     context, CupertinoPageRoute(builder: (context) =>
                // const AddSchedule()
                // ));
              },
              child: Padding(
                padding: const EdgeInsets.all(24),
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
                      "Add Schedule",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
    );
  }

  void addSchedule() async {
    await _addScheduleBloc?.addSchedule(map).then((value) {
      if(value['status_code'] == 200){
        Fluttertoast.showToast(msg: value['message']);
      }else{
        Fluttertoast.showToast(msg: value['message']);
      }
    });
  }
}
