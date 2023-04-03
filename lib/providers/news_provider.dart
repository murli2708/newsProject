// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_news_app/models/news_detailed.dart';
import 'package:basic_news_app/models/top_stories.dart';
import 'package:basic_news_app/providers/news_states.dart';
import 'package:basic_news_app/services/news_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsNotifier extends StateNotifier<TopNewsState> {
  NewsNotifier() : super(LoadingState());

  final NewsService service = NewsService();

  getTopNews() async {
    try {
      TopStories news = await service.fetchNews();
      print("dgfhgjkl;kljhghf");
      state = HomeState(data: news.data);
    } catch (e) {
      state = ErrorState(message: "Something Went wrong");
    }
  }

  setToInitialState() {
    state = LoadingState();
  }
}

class DetailedNewsNotifier extends StateNotifier<DetailedNewsState> {
  DetailedNewsNotifier() : super(DetailedLoadingState());

  final NewsService service = NewsService();

  getDetailedNews(String uuid) async {
    try {
      DetailedNews news = await service.fetchNewsByUUID(uuid);
      state = DetailsState(news: news);
    } catch (e) {
      state = DetailedErrorState(message: "Something Went wrong");
    }
  }
}

final newsProvider = StateNotifierProvider<NewsNotifier, TopNewsState>(
  (ref) => NewsNotifier(),
);

final detailedNewsProvider =
    StateNotifierProvider<DetailedNewsNotifier, DetailedNewsState>(
  (ref) => DetailedNewsNotifier(),
);

String selectedUUID = '';
final uuidProvider = StateProvider<String>(
  (ref) => selectedUUID,
);
