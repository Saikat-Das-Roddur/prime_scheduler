import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
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
                      SizedBox(width: 16,),
                      Expanded(
                      child: Container(
                        color: Colors.white,
                        child: const TextField(cursorHeight: 24,
                          cursorColor:  Color(0xffC8C8C8),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              constraints: BoxConstraints(maxHeight: 32),
                              contentPadding: EdgeInsets.only(bottom: 20,left: 8),),
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
                  child: const TextField(cursorHeight: 28,
                    cursorColor:  Color(0xffC8C8C8),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      constraints: BoxConstraints(maxHeight: 32),
                      contentPadding: EdgeInsets.only(bottom: 20,left: 0),),
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
              margin: const EdgeInsets.only(left: 16,top: 12,right: 16),
             // width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 8, left: 12, right: 36, bottom: 8),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/Vector 32.svg",color: const Color(0xffA8A8A8),),
                  SizedBox(width: 24,),
                  Expanded(
                    child: DropdownButton<String>(
                      hint: Text("Wow"),
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      icon: Container(),
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                          ),),
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
                  Flexible(child: Align(alignment: Alignment.center,child: Text("To - From"))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
