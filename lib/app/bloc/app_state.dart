import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool darkModeStatus;

  const AppState(this.darkModeStatus);

  @override
  List<Object?> get props => [darkModeStatus];
}
