import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:prime_scheduler/bloc/announcement_bloc.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';
import 'package:prime_scheduler/views/login_screen.dart';
import 'package:prime_scheduler/views/profile.dart';
import 'package:prime_scheduler/views/schedule_welcome_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomEndDrawer extends StatefulWidget {
  User? user;
  int? selectedIndex;

  CustomEndDrawer({Key? key, this.user, this.selectedIndex}) : super(key: key);

  @override
  _CustomEndDrawerState createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  DateTime dateTime = DateTime.now();
  AnnouncementBloc? _bloc;
  ProgressDialog? progressDialog;
  late SharedPreferences preferences;
  //int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
    _bloc = AnnouncementBloc();
  }

  initSharedPref() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, isDismissible: false);
    // Home
    // Add announcement
    // Profile
    // Update profile
    // Change password
    // logout

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              isSelected: widget.selectedIndex == 0,
              onTap: () {
                setState(() {
                  widget.selectedIndex = 0;
                });
                Navigator.of(context).pop();
                if (widget.user?.isAdmin == "1") {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (c) => LoggedInHomeScreen(
                                user: widget.user,
                              )),
                      ModalRoute.withName('/loggedInHome'));
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (c) => ScheduleWelcomeScreen(
                                user: widget.user,
                              )),
                      ModalRoute.withName('/scheduleWelcomeScreen'));
                }
              }

              //     Navigator.push(
              //     context, CupertinoPageRoute(builder: (context) =>
              //     LoggedInHomeScreen(user: widget.user)
              // ))
              ),
          _createDrawerItem(
              icon: Icons.announcement,
              text: 'Add Announcement',
              isSelected: widget.selectedIndex == 1,
              onTap: () {
                setState(() {
                  widget.selectedIndex = 1;
                });
                Navigator.pop(context);

                if (widget.user?.isAdmin == "1") {
                  showAnnouncementDialog();
                }
              }),
          _createDrawerItem(
              icon: Icons.account_circle,
              text: 'Profile',
              isSelected: widget.selectedIndex == 2,
              onTap: () {
                setState(() {
                  widget.selectedIndex = 2;
                });
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (c) => Profile(
                              user: widget.user,
                            )),
                    ModalRoute.withName('/profile'));
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.update,
              text: 'Update Profile',
              isSelected: widget.selectedIndex == 3,
              onTap: () {
                setState(() {
                  widget.selectedIndex = 3;
                });
                Navigator.pop(context);
              }),
          _createDrawerItem(
              icon: Icons.password_rounded,
              isSelected: widget.selectedIndex == 4,
              text: 'Change Password',
              onTap: () {
                setState(() {
                  widget.selectedIndex = 4;
                });
                Navigator.of(context).pop();
              }),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Log Out',
            isSelected: widget.selectedIndex == 5,
            onTap: () {
              setState(() {
                widget.selectedIndex = 5;
              });
              preferences.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(builder: (c) => LogInScreen()),
                  ModalRoute.withName('/loggIn'));
            },
          ),
          //_createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
          Divider(),
          //_createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          // ListTile(
          //   title: Text('0.0.1'),
          //   onTap: () {},
          // ),
        ],
      ),

      // ListView(
      //   children: <Widget>[
      //     UserAccountsDrawerHeader(
      //
      //       decoration: BoxDecoration(
      //           color: Colors.transparent//Color(0xffF06767)
      //       ),
      //       accountName: const Text(
      //         '',
      //         style: TextStyle(
      //           fontSize: 1,
      //           fontWeight: FontWeight.w800,
      //           color: Colors.black,
      //         ),
      //       ),
      //       currentAccountPicture: SvgPicture.asset("assets/images/Group.svg"),
      //       currentAccountPictureSize: Size(180, 80),
      //       accountEmail:  Text(
      //         '${widget.user?.name}',
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.w800,
      //           color: Colors.black,
      //         ),
      //       ),
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Home',
      //         style: TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.black,
      //         ),
      //       ),
      //       onTap: () {
      //         // Update the state of the app
      //         // ...
      //         // Then close the drawer
      //         Navigator.pop(context);
      //       },
      //       // leading: const Icon(
      //       //   Icons.person,
      //       //   size: 26.0,
      //       //   color: Colors.black,
      //       // ),
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Add Announcement',
      //         style: TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.black,
      //         ),
      //       ),
      //       onTap: () {
      //         // Update the state of the app
      //         // ...
      //         // Then close the drawer
      //         Navigator.pop(context);
      //         showAnnouncementDialog();
      //       },
      //       // leading: const Icon(
      //       //   Icons.notifications,
      //       //   size: 26.0,
      //       //   color: Colors.black,
      //       // ),
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Profile',
      //         style: TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.black,
      //         ),
      //       ),
      //       onTap: () {
      //         // Update the state of the app
      //         // ...
      //         // Then close the drawer
      //         Navigator.pop(context);
      //         Navigator.push(
      //             context, CupertinoPageRoute(builder: (context) =>
      //             Profile(user: widget.user)
      //         ));
      //       },
      //       // leading: const Icon(
      //       //   Icons.favorite,
      //       //   size: 26.0,
      //       //   color: Colors.black,
      //       // ),
      //     ),
      //     const Divider(
      //       color: Colors.black38,
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Update Profile',
      //         style: TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.black,
      //         ),
      //       ),
      //       onTap: () {
      //         //Navigator.pushReplacementNamed(context, Routes.about);
      //         //Navigator.popAndPushNamed(context, Routes.app1);
      //       },
      //       // leading: const Icon(
      //       //   Icons.info_outline,
      //       //   size: 26.0,
      //       //   color: Colors.black,
      //       // ),
      //     ),
      //     const Divider(
      //       color: Colors.black38,
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Change Password',
      //         style: TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.black,
      //         ),
      //       ),
      //       onTap: () {
      //         // Update the state of the app
      //         // ...
      //         // Then close the drawer
      //         Navigator.pop(context);
      //       },
      //       // leading: const Icon(
      //       //   Icons.close,
      //       //   size: 26.0,
      //       //   color: Colors.black,
      //       // ),
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Log Out',
      //         style: TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.black,
      //         ),
      //       ),
      //       onTap: () {
      //         preferences.clear();
      //         Navigator.pushAndRemoveUntil(
      //             context,
      //             CupertinoPageRoute(
      //                 builder: (c) => LogInScreen()),
      //             ModalRoute.withName('/loggIn'));
      //       },
      //       // leading: const Icon(
      //       //   Icons.exit_to_app,
      //       //   size: 26.0,
      //       //   color: Colors.black,
      //       // ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration:
            BoxDecoration(color: Colors.grey.shade200 //Color(0xffF06767)
                ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: SvgPicture.asset(
                "assets/images/Group 184.svg",
                height: 80,
                width: 80,
              ),
            ),
            Text(
              "${widget.user?.name}",
              style: TextStyle(color: Colors.black38, fontSize: 22),
            ),
            Text(
              "${widget.user?.email}",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        )

        // Stack(children: <Widget>[
        //   Positioned(
        //       bottom: 12.0,
        //       left: 16.0,
        //       child: Text("Flutter Step-by-Step",
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 20.0,
        //               fontWeight: FontWeight.w500))),
        // ])
        );
  }

  Widget _createDrawerItem(
      {IconData? icon,
      String? text,
      GestureTapCallback? onTap,
      bool? isSelected}) {
    return Ink(
      color: isSelected! ? Color(0x33f06767) : Colors.transparent,
      child: ListTile(
        selected: true,
        hoverColor: Colors.white,
        title: Row(
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Color(0xffF06767) : Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text!,
                style: TextStyle(
                    color: isSelected ? Color(0xffF06767) : Colors.black),
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  showAnnouncementDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(36))),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Announcement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffF06767),
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 24.0, top: 0),
                          child: Text(
                            "Title",
                            style: TextStyle(
                              color: Color(0xff59C69C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                          child: TextField(
                            cursorColor: Colors.grey,
                            maxLength: 30,
                            controller: _titleController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (v) {
                              // isValidEmail = _emailExp.hasMatch(v);
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                              focusColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 24.0, top: 0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Color(0xff59C69C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.grey,
                            maxLength: 300,
                            maxLines: 8,
                            textInputAction: TextInputAction.done,
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                              focusColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 24.0, top: 0),
                          child: Text(
                            "Date",
                            style: TextStyle(
                              color: Color(0xff59C69C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.grey,
                            maxLength: 11,
                            textInputAction: TextInputAction.done,
                            controller: _dobController,
                            autofocus: false,
                            focusNode: AlwaysDisabledFocusNode(),
                            onTap: () async {
                              await showDate(context);
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              suffixIcon: const Icon(
                                Icons.calendar_today_rounded,
                                color: Color(0xffF06767),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                              focusColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Map map = {};
                            map['title'] = _titleController.text;
                            map['description'] = _descriptionController.text;
                            map['date'] = _dobController.text;
                            map['admin_id'] = widget.user?.id;
                            addAnnouncement(map);
                          },
                          child: Container(
                            //color: ,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color(0xff59C69C),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                    bottomLeft: Radius.circular(14),
                                    bottomRight: Radius.circular(14))),
                            child: const Align(
                              child: Text(
                                "Add Announcement",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future showDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 7),
      // builder: (context, child) {
      //   return Theme(
      //     data: Theme.of(context).copyWith(
      //       colorScheme: const ColorScheme.light(
      //         //primary: MyColors.accent, // header background color
      //         onPrimary: Colors.white, // header text color
      //         onSurface: Colors.black, // body text color
      //       ),
      //       textButtonTheme: TextButtonThemeData(
      //         style: TextButton.styleFrom(
      //           //primary: MyColors.accent, // button text color
      //         ),
      //       ),
      //     ),
      //     child: child,
      //   );
      // },
    );
    if (selected != null && selected != dateTime) {
      _dobController
        ..text = DateFormat('yyyy-MM-dd').format(selected)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dobController.text.length,
            affinity: TextAffinity.upstream));
      print(_dobController.text.toString());
    }
  }

  void addAnnouncement(Map map) {
    progressDialog?.show();
    _bloc?.addAnnouncement(map).then((value) {
      progressDialog?.hide();
      if (value != null) {
        if (value['status_code'] == 200) {
          Fluttertoast.showToast(msg: "Announcement added");
        } else {
          Fluttertoast.showToast(msg: "Something went wrong");
        }
      }
    });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
