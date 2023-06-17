import 'package:news_app/models/source_model.dart';

class SourceResponse {
  final List<SourceModels> articles;
  final String error;

  SourceResponse(this.articles, this.error);
  SourceResponse.fromJson(Map<String, dynamic> json)
      : articles = (json["articles"] as List)
            .map((i) => SourceModels.fromJson(i))
            .toList(),
        error = "";
  SourceResponse.withError(String errorValue)
      : articles = [],
        error = errorValue;
}
