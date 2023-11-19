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

//*********************Latest News State********************

abstract class LatestNewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LatestNewsLoading extends LatestNewsState {}

class LatestNewsLoaded extends LatestNewsState {
  final List<News> news;

  LatestNewsLoaded(this.news);

  @override
  List<Object?> get props => [news];
}

class LatestNewsError extends LatestNewsState {}

class LatestNewsAction extends LatestNewsState {}

class LatestNewsToNavigateDetails extends LatestNewsAction {
  final News news;

  @override
  List<Object?> get props => [news];
  LatestNewsToNavigateDetails(this.news);
}
