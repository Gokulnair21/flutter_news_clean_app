import 'package:flutter/material.dart';

import 'package:news_app/core/env_manager.dart';
import 'package:news_app/core/local/preference_manager.dart';

import 'app/app.dart';
import 'di/config.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvManager().loadEnvFile();
  configureDependencies();
  await getIt.get<PreferenceManager>().initialize();
  runApp(const MyApp());
}
