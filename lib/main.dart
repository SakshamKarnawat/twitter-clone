import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/home_screen.dart';
import 'package:twitter_clone/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}


//Dependencies added:
//1. FontAwesomeFlutter - for Twitter icon
//2. fluter_launcher_icons - to change App icons