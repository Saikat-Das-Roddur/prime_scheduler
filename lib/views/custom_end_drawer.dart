import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:prime_scheduler/bloc/announcement_bloc.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:progress_dialog/progress_dialog.dart';


class CustomEndDrawer extends StatefulWidget {
  User? user;

  CustomEndDrawer({Key? key, this.user}) : super(key: key);
  @override
  _CustomEndDrawerState createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {

  TextEditingController _titleController =  TextEditingController();
  TextEditingController _descriptionController =  TextEditingController();
  TextEditingController _dobController =  TextEditingController();
  DateTime dateTime = DateTime.now();
  AnnouncementBloc? _bloc;
  ProgressDialog? progressDialog;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = AnnouncementBloc();
  }


  @override
  Widget build(BuildContext context) {

    progressDialog = ProgressDialog(context,isDismissible: false);
    // Home
    // Add announcement
    // Profile
    // Update profile
    // Change password
    // logout

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(250),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width*.7,
          child: Drawer(

            child:  ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(

                  decoration: BoxDecoration(
                      color: Colors.transparent//Color(0xffF06767)
                  ),
                  accountName: const Text(
                    '',
                    style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  currentAccountPicture: SvgPicture.asset("assets/images/Group.svg"),
                  currentAccountPictureSize: Size(180, 80),
                  accountEmail:  Text(
                    '${widget.user?.name}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  // leading: const Icon(
                  //   Icons.person,
                  //   size: 26.0,
                  //   color: Colors.black,
                  // ),
                ),
                ListTile(
                  title: const Text(
                    'Add Announcement',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    showAnnouncementDialog();
                  },
                  // leading: const Icon(
                  //   Icons.notifications,
                  //   size: 26.0,
                  //   color: Colors.black,
                  // ),
                ),
                ListTile(
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  // leading: const Icon(
                  //   Icons.favorite,
                  //   size: 26.0,
                  //   color: Colors.black,
                  // ),
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ListTile(
                  title: const Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    //Navigator.pushReplacementNamed(context, Routes.about);
                    //Navigator.popAndPushNamed(context, Routes.app1);
                  },
                  // leading: const Icon(
                  //   Icons.info_outline,
                  //   size: 26.0,
                  //   color: Colors.black,
                  // ),
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ListTile(
                  title: const Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  // leading: const Icon(
                  //   Icons.close,
                  //   size: 26.0,
                  //   color: Colors.black,
                  // ),
                ),
                ListTile(
                  title: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // leading: const Icon(
                  //   Icons.exit_to_app,
                  //   size: 26.0,
                  //   color: Colors.black,
                  // ),
                ),
              ],
            ),
          ),
        ),
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
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                              focusColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
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
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                              focusColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
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
                              suffixIcon: const Icon(Icons.calendar_today_rounded, color: Color(0xffF06767),),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                              focusColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
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
      lastDate: DateTime(DateTime.now().year+7),
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
    _bloc?.addAnnouncement(map).then((value){
      progressDialog?.hide();
      if(value!=null){
        if(value['status_code']==200){
          Fluttertoast.showToast(msg: "Announcement added");
        }else{
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

