class DetailedNews {
  DetailedNews({
    required this.uuid,
    required this.title,
    required this.description,
    required this.keywords,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedAt,
    required this.source,
    required this.categories,
  });
  late final String uuid;
  late final String title;
  late final String description;
  late final String keywords;
  late final String snippet;
  late final String url;
  late final String imageUrl;
  late final String language;
  late final String publishedAt;
  late final String source;
  late final List<String> categories;

  DetailedNews.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
    snippet = json['snippet'];
    url = json['url'];
    imageUrl = json['image_url'];
    language = json['language'];
    publishedAt = json['published_at'];
    source = json['source'];
    categories = List.castFrom<dynamic, String>(json['categories']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['title'] = title;
    _data['description'] = description;
    _data['keywords'] = keywords;
    _data['snippet'] = snippet;
    _data['url'] = url;
    _data['image_url'] = imageUrl;
    _data['language'] = language;
    _data['published_at'] = publishedAt;
    _data['source'] = source;
    _data['categories'] = categories;
    return _data;
  }
}
