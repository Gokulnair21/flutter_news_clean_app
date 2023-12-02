import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/domain/entity/filter.dart';
import 'package:news_app/features/news/domain/entity/news.dart';

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
  final DateTime dateTime = DateTime.now();

  @override
  List<Object?> get props => [dateTime];

  LatestNewsToNavigateDetails(this.news);
}

class FilterChanged extends LatestNewsState {
  final Filter filter;

  FilterChanged({required this.filter});

  @override
  List<Object?> get props => [filter];
}
