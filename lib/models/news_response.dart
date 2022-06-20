import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsResponse {
  String? status;
  int? totalResults;
  List<Articles>? articles;
  NewsResponse(this.articles, this.status, this.totalResults);

factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

Map<String, dynamic> toJson() => _$NewsResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Articles(
    this.source,
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.title,
    this.url,
    this.urlToImage,
  );
  factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Source {
  String? id;
  String? name;
  Source(this.id, this.name);
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
