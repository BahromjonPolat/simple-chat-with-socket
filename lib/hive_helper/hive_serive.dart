import 'package:hive_flutter/hive_flutter.dart';

import '../models/user/user_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());

    await Hive.openBox('prefs');
  }
}
