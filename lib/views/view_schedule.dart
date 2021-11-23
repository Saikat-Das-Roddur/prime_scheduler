import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

class ViewSchedule extends StatefulWidget {
  const ViewSchedule({Key? key}) : super(key: key);

  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // const Color(0xffE5E5E5),
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
                          "View Schedule",
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
            Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              margin: const EdgeInsets.only(
                top: 16,
              ),
              decoration: const BoxDecoration(
                  color: Color(0xffFFFfff),
                  border: Border(
                      left: BorderSide(width: 5, color: Color(0xff54BFAC)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Monday, 13 Sep",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "8:00 am - 4:00 pm",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 17),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Manager",
                        style: TextStyle(
                            color: Color(0xff9C9C9C),
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36.0, right: 36),
              child: SizedBox(
                width: double.infinity,
                height: 1.2,
                child: Container(
                  color: const Color(0xffE4E4E4),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(36.0, 24, 36, 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: SvgPicture.asset(
                        "assets/images/Group 210.svg",
                        height: 60,
                        width: 60,
                      )),
                  const Expanded(
                    flex: 2,
                    child: Text(
                      "Robin alex",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 8,
              child: Container(
                color: const Color(0xffE4E4E4),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(36, 16, 0, 0),
              child: Text(
                "Upcoming shifts",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff676767)),
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.fromLTRB(28, 24, 24, 24),
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                      color: Color(0xffFFF8E4),
                      border: Border(
                          left: BorderSide(
                              width: 5, color: Color(0xffFFB966)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        "Tue, 14 Sep, 9:00 am - 4:00 pm",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        "Cook .  Sarinda Club",
                        style: TextStyle(
                            color: Color(0xff717171),
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(right: 24.0,bottom: 24),
              child: Text(
                "Show more",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
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
              borderRadius: BorderRadius.all(Radius.circular(36))),
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
}
