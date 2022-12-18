/*
    Created by: Bakhromjon Polat
    Created on: Dec 18 2022 10:55:01

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:websocket/hive_helper/hive_serive.dart';

import 'app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();


  runApp(const MyApp());
}
