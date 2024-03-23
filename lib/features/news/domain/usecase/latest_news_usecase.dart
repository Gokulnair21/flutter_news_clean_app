import 'package:injectable/injectable.dart';
import 'package:news_app/base/usecase.dart';
import 'package:news_app/core/network/helpers/network_result.dart';
import 'package:news_app/features/news/data/model/news_list_response.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

@Injectable()
class LatestNewsUseCase implements UseCase<List<News>, String> {
  final NewsRepository _newsRepository;

  LatestNewsUseCase(this._newsRepository);

  @override
  Future<List<News>> call(String params) async {
    final res = await _newsRepository.getAllNews(params);
    if (res is ApiSuccess) {
      final value = res.value as NewsListResponse;
      return value.articles
          .map((e) => News(
              source: e.url,
              thumbnail: e.urlToImage,
              content: e.content ?? "",
              title: e.title,
              sourceName: e.source.name,
              dateTime: e.publishedAt.toString(),
              author: e.author))
          .toList();
    } else {
      throw Exception("Api Calling  Failed");
    }
  }
}
