import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prime_scheduler/views/clock_in_and_out.dart';
import 'package:prime_scheduler/views/home.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';
import 'package:prime_scheduler/views/login_screen.dart';
import 'package:prime_scheduler/views/splash_screen.dart';
import 'package:sizer/sizer.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

main() {
  // GestureBinding.instance?.resamplingEnabled = true;
  //WidgetsFlutterBinding.ensureInitialized();
  //HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        // '/splash': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/loggedInHome': (context) => LoggedInHomeScreen(),
        '/loggIn': (context) => LogInScreen(),
        '/clockInAndOut': (context) => ClockInAndOut(),

        // '/splash': (context) => const SplashScreen(),
        // '/splash': (context) => const SplashScreen(),
      },
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );

    //   Sizer(
    //   builder: (context, orientation, deviceType) => MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     initialRoute: '/home',
    //     routes: {
    //       // '/splash': (context) => const SplashScreen(),
    //       '/home': (context) => const Home(),
    //       '/loggedInHome': (context) => LoggedInHomeScreen(),
    //       '/loggIn': (context) => LogInScreen(),
    //       '/clockInAndOut': (context) => ClockInAndOut(),
    //
    //       // '/splash': (context) => const SplashScreen(),
    //       // '/splash': (context) => const SplashScreen(),
    //     },
    //     //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //   ),
    // );
  }
}
//
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         signInWithGoogle();
//       }),// This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   Future signInWithGoogle() async {
//
//     try {
//       await _googleSignIn.signOut();
//
//       final GoogleSignInAccount? googleSignInAccount =
//       await _googleSignIn.signIn();
//
//       Map map = new Map();
//
//       //TEST USER
//       /*map['uid'] = "5616186165181616";
//       map['provider'] = "google";
//       map['email'] = "test50@gmail.com";
//       map['name'] = "test50";*/
//
//       map['uid'] = googleSignInAccount?.id;
//       map['provider'] = "google";
//       if (googleSignInAccount?.email != null) {
//         map['email'] = googleSignInAccount?.email ?? "";
//         //BaseFunctions().setEmail(googleSignInAccount.email);
//       }
//       if (googleSignInAccount?.displayName != null) {
//         map['name'] = googleSignInAccount?.displayName ?? "";
//         //BaseFunctions().setEmail(googleSignInAccount.displayName);
//       }
//
//       map['image'] = googleSignInAccount?.photoUrl ?? "";
//
//       print("GoogleUser::" + map.toString());
//
//       // _logInBloc.socialLogIn(body: map).then((value){
//       //   progressDialog.hide();
//       //   this.logInResponse = value;
//       //   if (logInResponse.status == 200) {
//       //     print("Token :" + logInResponse.status.toString());
//       //     BaseFunctions().setToken(logInResponse.token);
//       //     gotoHomePage(context);
//       //   }
//       // }, onError: (v){
//       //   print("Token : here");
//       // }).noSuchMethod(throw UnauthorisedException());
//
//       // this.logInResponse = await socialLogIn(
//       //     progressDialog, "api/v1/users/social_login",
//       //     body: map);
//       //
//       // if (logInResponse.status == 200) {
//       //   //print("Token :" + logInResponse.token);
//       //   BaseFunctions().setToken(logInResponse.token);
//       //   gotoHomePage(context);
//       // } else {
//       //   //print("ResponseCode::" + logInResponse.status.toString());
//       // }
//     } on Exception catch (e) {
//       print(e.toString());
//       // if (progressDialog!.isShowing()) {
//       //   progressDialog?.hide();
//       // }
//       //print('login failed :' + e.toString());
//       // Fluttertoast.showToast(msg: e.toString());
//     }
//     return 'signInWithGoogle succeeded:';
//   }
// }
