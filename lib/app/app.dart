import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/app/bloc/app_bloc.dart';
import 'package:news_app/app/bloc/app_event.dart';
import '../di/config.dart';
import '../features/news/presentation/home/bloc/latest_news/latest_news_bloc.dart';
import '../features/news/presentation/home/bloc/top_high_light/top_high_light_bloc.dart';
import '../route/routes.dart';
import 'bloc/app_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                getIt.get<AppBloc>()..add(AppEventInitializePreferences())),
        BlocProvider(create: (_) => getIt.get<TopHighLightBloc>()),
        BlocProvider(create: (_) => getIt.get<LatestNewsBloc>())
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            title: 'News App',
            theme: ThemeData(
              brightness:
                  state.darkModeStatus ? Brightness.dark : Brightness.light,
              useMaterial3: true,
              textTheme: GoogleFonts.latoTextTheme(),
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
