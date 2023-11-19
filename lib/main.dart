import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/env_manager.dart';
import 'package:news_app/features/news/presentation/home/bloc/home_bloc.dart';
import 'package:news_app/route/routes.dart';

import 'di/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvManager().loadEnvFile();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<TopHighLightBloc>()),
        BlocProvider(create: (_) => getIt.get<LatestNewsBloc>())
      ],
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'News App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        routerConfig: router,
      ),
    );
  }
}
