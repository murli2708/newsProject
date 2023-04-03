class TopStories {
  TopStories({
    required this.meta,
    required this.data,
  });
  late final Meta meta;
  late final List<Data> data;

  TopStories.fromJson(Map<String, dynamic> json) {
    meta = Meta.fromJson(json['meta']);
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meta'] = meta.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Meta {
  Meta({
    required this.found,
    required this.returned,
    required this.limit,
    required this.page,
  });
  late final int found;
  late final int returned;
  late final int limit;
  late final int page;

  Meta.fromJson(Map<String, dynamic> json) {
    found = json['found'];
    returned = json['returned'];
    limit = json['limit'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['found'] = found;
    _data['returned'] = returned;
    _data['limit'] = limit;
    _data['page'] = page;
    return _data;
  }
}

class Data {
  Data({
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
    this.relevanceScore,
    required this.locale,
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
  late final Null relevanceScore;
  late final String locale;

  Data.fromJson(Map<String, dynamic> json) {
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
    relevanceScore = null;
    locale = json['locale'];
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
    _data['relevance_score'] = relevanceScore;
    _data['locale'] = locale;
    return _data;
  }
}
