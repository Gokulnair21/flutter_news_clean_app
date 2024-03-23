import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/news/data/model/news_list_response.dart';
import 'package:retrofit/http.dart';


part 'news_service.g.dart';

@Singleton()
@RestApi()
abstract class NewsService {

  @FactoryMethod()
  factory NewsService(Dio dio) = _NewsService;

  @GET("top-headlines")
  Future<NewsListResponse> getTopHeadLines(@Query("country") String country);

  @GET("everything")
  Future<NewsListResponse> getAllNews(@Query("q") String category);
}
