import 'package:injectable/injectable.dart';
import 'package:news_app/core/network/helpers/network_result.dart';
import 'package:news_app/features/news/data/remote/news_service.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsService _newsService;

  NewsRepositoryImpl(this._newsService);

  @override
  Future<ApiResult> getTopHeadLines() async {
    final res = await _newsService.getTopHeadLines("in");
    return ApiSuccess(res);
  }

  @override
  Future<ApiResult> getAllNews(String category) async {
    final res = await _newsService.getAllNews(category);
    return ApiSuccess(res);
  }
}
