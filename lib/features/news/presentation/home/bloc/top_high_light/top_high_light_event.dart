
import 'package:news_app/features/news/domain/entity/news.dart';

abstract class TopHiglightEvent {}

class LoadData extends TopHiglightEvent {}

class NavigateToDetails extends TopHiglightEvent {
  final News news;

  NavigateToDetails(this.news);
}
