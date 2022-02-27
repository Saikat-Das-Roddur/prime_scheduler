import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:prime_scheduler/bloc/active_details_bloc.dart';
import 'package:prime_scheduler/models/attendences.dart';
import 'package:prime_scheduler/models/employee_response.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ActiveDetailsUser extends StatefulWidget {
  User? user;

  ActiveDetailsUser({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  _ActiveDetailsState createState() => _ActiveDetailsState();
}

class _ActiveDetailsState extends State<ActiveDetailsUser> {
  late ActiveDetailsBloc _bloc;
  late ProgressDialog dialog;
  ConnectivityResult? connectivityResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnection();
    _bloc = ActiveDetailsBloc();

    //_bloc.getAttendance(widget.user?.employeeId);
  }

  initConnection() async{
    var connectivityResult = await(Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // I am connected to a mobile network.
      dialog.hide().whenComplete(() => Fluttertoast.showToast(msg: "No Internet connection"));
    }else{
      _bloc.getAttendance(widget.user?.employeeId).then((value) => dialog.hide().whenComplete(() => null));
    }
  }

  @override
  Widget build(BuildContext context) {
    dialog = ProgressDialog(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // const Color(0xffE5E5E5),
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
                      "Active Details",
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
                    children: [
                      Text(
                        DateFormat("EEEE, dd MMM").format(DateTime.now()),
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${DateTime.now().year}",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 17),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Eployee",
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
                  Expanded(
                    flex: 2,
                    child: Text(
                      "${widget.user?.name}",
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
              padding: EdgeInsets.only(left: 36.0, top: 24),
              child: Text(
                "Previous shifts",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff676767)),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            StreamBuilder<Response<Attendances>>(
                stream: _bloc.getAttendanceStream,
                builder: (c, s) {
                  if (s.hasData) {
                    switch (s.data?.status) {
                      case Status.LOADING:
                        return Center(child: CircularProgressIndicator());
                      case Status.COMPLETED:
                        return s.data?.data?.statusCode == 400
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Text("No schedule assigned",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 18.0)),
                              ))
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: s.data?.data?.attendances?.length,
                                itemBuilder: (context, index) => Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          24, 16, 24, 16),
                                      margin: const EdgeInsets.only(top: 8),
                                      decoration: const BoxDecoration(
                                          color: Color(0xffFFF8E4),
                                          border: Border(
                                              left: BorderSide(
                                                  width: 5,
                                                  color: Color(0xffFFB966)))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                DateFormat("EEE, dd MMM").format(
                                                    DateFormat("yyyy-MM-dd").parse(
                                                        "${s.data?.data?.attendances?.elementAt(index).assignedDate}")),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20),
                                              ),
                                              RichText(
                                                  text: TextSpan(
                                                      text: "Total",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 20),
                                                      children: [
                                                    TextSpan(
                                                        text: s.data?.data
                                                                        ?.attendances
                                                                        ?.elementAt(
                                                                            index)
                                                                        .completedHours !=
                                                                    null &&
                                                                s.data?.data
                                                                        ?.attendances
                                                                        ?.elementAt(
                                                                            index)
                                                                        .completedHours !=
                                                                    ""
                                                            ? " ${s.data?.data?.attendances?.elementAt(index).completedHours} "
                                                            : " 0 ",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20)),
                                                    TextSpan(
                                                      text: "HOURS",
                                                    )
                                                  ])),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            "${widget.user?.location}",
                                            style: TextStyle(
                                                color: Color(0xff717171),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  // height: 48,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 6, 8, 6),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xff59C69C),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          16))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "Check in",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                      Text(
                                                          "${s.data?.data?.attendances?.elementAt(index).inTime} "
                                                              //"${s.data?.data?.attendances?.elementAt(index).outTime?.substring(s.data?.data?.attendances?.elementAt(index).outTime!.length ?? -3, s.data?.data?.attendances?.elementAt(index).outTime!.length)}",
                                                          "${s.data?.data?.attendances?.elementAt(index).inTime?.substring(s.data?.data?.attendances?.elementAt(index).inTime!.length ?? -3, s.data?.data?.attendances?.elementAt(index).inTime!.length)}",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 48),
                                              Flexible(
                                                child: Container(
                                                  // height: 48,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 6, 8, 6),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xffF06767),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          16))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text("Check out",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                      RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  "${s.data?.data?.attendances?.elementAt(index).outTime}",
                                                                  //"${s.data?.data?.attendances?.elementAt(index).outTime?.substring(s.data?.data?.attendances?.elementAt(index).outTime!.length ?? -3, s.data?.data?.attendances?.elementAt(index).outTime!.length)}",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300)))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ));
                      case Status.ERROR:
                        return Center(child: CircularProgressIndicator());
                      default:
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            const Padding(
              padding: EdgeInsets.only(right: 24.0, bottom: 24),
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
