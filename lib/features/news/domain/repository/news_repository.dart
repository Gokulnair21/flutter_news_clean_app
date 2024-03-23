import 'package:news_app/core/network/helpers/network_result.dart';

abstract class NewsRepository {
  Future<ApiResult> getTopHeadLines();

  Future<ApiResult> getAllNews(String category);
}
