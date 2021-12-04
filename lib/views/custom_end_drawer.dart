import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                 const UserAccountsDrawerHeader(
                  accountName: Text(
                    '',
                    style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Profile & Security',
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
                  leading: const Icon(
                    Icons.person,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Notifications',
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
                  leading: const Icon(
                    Icons.notifications,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Favorites',
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
                  leading: const Icon(
                    Icons.favorite,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ListTile(
                  title: const Text(
                    'About WelakaOne',
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
                  leading: const Icon(
                    Icons.info_outline,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ListTile(
                  title: const Text(
                    'Close Menu',
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
                  leading: const Icon(
                    Icons.close,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Log Out & Exit',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.exit_to_app,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
