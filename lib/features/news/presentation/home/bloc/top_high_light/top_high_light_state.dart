import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/domain/entity/news.dart';

abstract class TopHighLightState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopHigLightLoading extends TopHighLightState {}

class TopHigLightDataLoaded extends TopHighLightState {
  final List<News> news;

  TopHigLightDataLoaded(this.news);

  @override
  List<Object?> get props => [news];
}

class TopHighLightDataError extends TopHighLightState {}

class TopHighlightAction extends TopHighLightState {}

class NavigateToDetailsPage extends TopHighlightAction {
  final News news;

  @override
  List<Object?> get props => [news];

  NavigateToDetailsPage(this.news);
}
