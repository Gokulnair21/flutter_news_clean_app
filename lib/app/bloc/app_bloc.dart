import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/app/bloc/app_event.dart';
import 'package:news_app/app/bloc/app_state.dart';

import '../../core/local/preference_manager.dart';

@Injectable()
class AppBloc extends Bloc<AppEvent, AppState> {
  final PreferenceManager preferenceManager;

  AppBloc(this.preferenceManager) : super(const AppState(false)) {
    on<AppEventDarkModeToggled>(
        (event, state) => _updateDarkMode(event, state));
    on<AppEventInitializePreferences>(
        (event, state) => _currentDarkModeStatus(event, state));
  }

  Future<void> _updateDarkMode(
      AppEventDarkModeToggled event, Emitter<AppState> emit) async {
    final current = await preferenceManager.isDarkModeEnabled();
    preferenceManager.enableDarkMode(!current);
    emit(AppState(!current));
  }

  Future<void> _currentDarkModeStatus(
      AppEventInitializePreferences event, Emitter<AppState> emit) async {
    final current = await preferenceManager.isDarkModeEnabled();
    emit(AppState(current));
  }
}
