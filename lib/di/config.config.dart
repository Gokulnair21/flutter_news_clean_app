// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/bloc/app_bloc.dart' as _i12;
import '../core/env_manager.dart' as _i3;
import '../core/local/hive_preference_manager_impl.dart' as _i9;
import '../core/local/preference_manager.dart' as _i8;
import '../core/network/dio_service/dio_service.dart' as _i5;
import '../core/network/network_manager.dart' as _i4;
import '../features/news/data/repository/news_repository_impl.dart' as _i7;
import '../features/news/domain/repository/news_repository.dart' as _i6;
import '../features/news/domain/usecase/latest_news_usecase.dart' as _i13;
import '../features/news/domain/usecase/top_head_line_usecase.dart' as _i10;
import '../features/news/presentation/home/bloc/latest_news/latest_news_bloc.dart'
    as _i14;
import '../features/news/presentation/home/bloc/top_high_light/top_high_light_bloc.dart'
    as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.EnvManager>(_i3.EnvManager());
    gh.singleton<_i4.NetworkManager>(_i5.DioService());
    gh.factory<_i6.NewsRepository>(
        () => _i7.NewsRepositoryImpl(gh<_i4.NetworkManager>()));
    gh.singleton<_i8.PreferenceManager>(_i9.HivePreferenceManager());
    gh.factory<_i10.TopHeadlineUseCase>(
        () => _i10.TopHeadlineUseCase(gh<_i6.NewsRepository>()));
    gh.factory<_i11.TopHighLightBloc>(
        () => _i11.TopHighLightBloc(gh<_i10.TopHeadlineUseCase>()));
    gh.factory<_i12.AppBloc>(() => _i12.AppBloc(gh<_i8.PreferenceManager>()));
    gh.factory<_i13.LatestNewsUseCase>(
        () => _i13.LatestNewsUseCase(gh<_i6.NewsRepository>()));
    gh.factory<_i14.LatestNewsBloc>(
        () => _i14.LatestNewsBloc(gh<_i13.LatestNewsUseCase>()));
    return this;
  }
}
