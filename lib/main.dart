import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prime_scheduler/views/clock_in_and_out.dart';
import 'package:prime_scheduler/views/home.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';
import 'package:prime_scheduler/views/login_screen.dart';
import 'package:prime_scheduler/views/splash_screen.dart';
import 'package:sizer/sizer.dart';

 main()  {
  // GestureBinding.instance?.resamplingEnabled = true;
  // WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
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
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/clockInAndOut',
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
      ),
    );
  }
}
