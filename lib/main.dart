import 'package:flutter/material.dart';

import 'package:news_app/core/env_manager.dart';
import 'package:news_app/core/local/preference_manager.dart';

import 'app/app.dart';
import 'app/bloc/app_bloc.dart';
import 'di/config.dart';


void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await EnvManager().loadEnvFile();
  await configureDependencies();
 // await getIt.get<EnvManager>().loadEnvFile()
  await getIt.get<PreferenceManager>().initialize();
  runApp(const MyApp());
}
