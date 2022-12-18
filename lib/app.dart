/*
    Created by: Bakhromjon Polat
    Created on: Dec 18 2022 10:55:34

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:websocket/hive_helper/app_prefs.dart';
import 'package:websocket/routes/app_navigator.dart';
import 'package:websocket/screens/auth/regiser_screen.dart';
import 'package:websocket/screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      initialRoute:
          AppPrefs.user == null ? RegisterScreen.route : HomeScreen.route,
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
        RegisterScreen.route: (_) => const RegisterScreen(),
      },
    );
  }
}
