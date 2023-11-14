import 'package:news_app/core/network/network_result.dart';

abstract class NewsRepository {
  Future<ApiResult> getTopHeadLines();
}
