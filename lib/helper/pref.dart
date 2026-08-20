import 'package:hive_flutter/hive_flutter.dart';

class Pref {
  static late Box _box;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('myData');
  }

  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: true);

  static set showOnboarding(bool value) {
    _box.put('showOnboarding', value);
  }
}
