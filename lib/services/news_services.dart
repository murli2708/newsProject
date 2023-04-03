import 'package:basic_news_app/constants/constants.dart';
import 'package:basic_news_app/models/news_detailed.dart';
import 'package:basic_news_app/models/top_stories.dart';
import 'package:dio/dio.dart';

// top stories
// top?api_token=7NWOR1V2s1LASPheMv8hhKA3E0QbwLtYiAG5zdLt&locale=us&limit=3

// news by uuid
// uuid/147013d8-6c2c-4d50-8bad-eb3c8b7f5740?api_token=7NWOR1V2s1LASPheMv8hhKA3E0QbwLtYiAG5zdLt

class NewsService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: ApiUrls.baseUrl, responseType: ResponseType.json));

  fetchNews() async {
    var response =
        await _dio.get('top?api_token=${ApiUrls.apiToken}&locale=us&limit=10');
    print(".................");
    print(response.toString());
    return TopStories.fromJson(response.data);
  }

  fetchNewsByUUID(String uuid) async {
    var response = await _dio.get('uuid/$uuid?api_token=${ApiUrls.apiToken}');
    return DetailedNews.fromJson(response.data);
  }
}
