import 'package:news_app/models/source_model.dart';

class ArticleModel {
  final SourceModels source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String img;
  final String date;
  final String content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.img,
    required this.date,
    required this.content,
  });

  ArticleModel.fromJson(Map<String, dynamic> json)
      : source = json["source"] != null
            ? SourceModels.fromJson(json["source"] as Map<String, dynamic>)
            : SourceModels("", "", "", "", "", "", ""),
        author = json["author"],
        title = json["title"],
        description = json["description"],
        url = json["url"],
        img = json["urlToImage"] ?? "",
        date = json["publishedAt"],
        content = json["content"] ?? "";
}
