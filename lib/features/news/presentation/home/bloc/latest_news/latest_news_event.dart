import 'package:news_app/features/news/domain/entity/filter.dart';
import 'package:news_app/features/news/domain/entity/news.dart';

abstract class LatestNewsEvent {}

class LoadLatestNews extends LatestNewsEvent {}

class LatestNewsToDetails extends LatestNewsEvent {
  final News news;

  LatestNewsToDetails(this.news);
}

class FilterSelected extends LatestNewsEvent {
  final Filter filter;

  FilterSelected({required this.filter});
}
