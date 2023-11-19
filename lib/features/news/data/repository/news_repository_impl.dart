import 'package:injectable/injectable.dart';
import 'package:news_app/core/network/network_manager.dart';
import 'package:news_app/core/network/network_result.dart';
import 'package:news_app/features/news/data/model/news_list_response.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NetworkManager _networkManager;

  NewsRepositoryImpl(this._networkManager);

  @override
  Future<ApiResult> getTopHeadLines() async {
    final res = await _networkManager
        .get(endPoint: "top-headlines", queryParams: {"country": "in"});
    if (res is ApiSuccess) {
      return ApiSuccess(NewsListResponse.fromJson(res.value));
    }
    return res;
  }

  @override
  Future<ApiResult> getAllNews(String category) async {
    final res = await _networkManager
        .get(endPoint: "everything", queryParams: {"q": category});
    if (res is ApiSuccess) {
      return ApiSuccess(NewsListResponse.fromJson(res.value));
    }
    return res;
  }
}
