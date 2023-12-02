import 'package:equatable/equatable.dart';

abstract class AppEvent {}

class AppEventInitializePreferences extends AppEvent {}

class AppEventDarkModeToggled extends AppEvent {}
