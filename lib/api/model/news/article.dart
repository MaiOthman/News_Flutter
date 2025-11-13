// import 'package:json_annotation/json_annotation.dart';
//
// import '../../../model/source_response.dart';
// part 'article.g.dart';
// @JsonSerializable()
// class Article {
//   @JsonKey(name: "source")
//   final Source? source;
//   @JsonKey(name: "author")
//   final String? author;
//   @JsonKey(name: "title")
//   final String? title;
//   @JsonKey(name: "description")
//   final String? description;
//   @JsonKey(name: "url")
//   final String? url;
//   @JsonKey(name: "urlToImage")
//   final String? urlToImage;
//   @JsonKey(name: "publishedAt")
//   final String? publishedAt;
//   @JsonKey(name: "content")
//   final String? content;
//
//   Article ({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });
//
//   factory Article.fromJson(Map<String, dynamic> json) {
//     return _$ArticleFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$ArticleToJson(this);
//   }
// }
//
//
//
