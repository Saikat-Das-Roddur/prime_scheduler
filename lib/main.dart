import 'package:flutter/material.dart';
import 'package:prime_scheduler/views/home.dart';
import 'package:prime_scheduler/views/logged_in_home.dart';
import 'package:prime_scheduler/views/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

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
        initialRoute: '/home',
        routes: {
          // '/splash': (context) => const SplashScreen(),
          '/home': (context) => const Home(),
          '/loggedInHome': (context) => LoggedInHomeScreen(),
          // '/splash': (context) => const SplashScreen(),
          // '/splash': (context) => const SplashScreen(),
        },
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
