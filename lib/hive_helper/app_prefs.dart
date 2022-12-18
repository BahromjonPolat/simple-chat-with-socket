/*
    Created by: Bakhromjon Polat
    Created on: Dec 17 2022 22:18:49

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:hive/hive.dart';
import 'hive_boxes.dart';
import 'package:websocket/models/user/user_model.dart';

class AppPrefs {
  static final Box _box = HiveBoxes.prefBox;

  static Future setUser(UserModel user) async {
    await _box.put('user', user);
  }

  static UserModel? get user => _box.get('user');
}
