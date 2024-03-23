import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/local/preference_manager.dart';
import 'package:path_provider/path_provider.dart';

@Singleton(as: PreferenceManager)
class HivePreferenceManager implements PreferenceManager {
  late Box box;

  @override
  Future<void> initialize() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await _openSettingsBox();
    test();
  }

  @override
  Future<void> dispose() async {
    await Hive.close();
  }

  Future<void> _openSettingsBox() async {
    box = await Hive.openBox("app_preferences");
  }

  @override
  Future<bool> isDarkModeEnabled() async {
    return box.get(DARK_MODE_STATUS, defaultValue: false);
  }

  @override
  Future<void> enableDarkMode(bool status) async {
    await box.put(DARK_MODE_STATUS, status);
  }

  static const DARK_MODE_STATUS = "DARK_MODE_STATUS";

  test() {
    Hive.box('settings').listenable();
   return box.watch(key: DARK_MODE_STATUS);
  }


}
