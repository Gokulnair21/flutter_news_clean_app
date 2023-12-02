import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/di/config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', //file name for get it injectable
  preferRelativeImports: true,
  asExtension: true,
)
configureDependencies() => getIt.init();
