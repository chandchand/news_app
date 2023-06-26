class SourceModels {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  SourceModels(this.id, this.name, this.description, this.url, this.language,
      this.category, this.country);

  SourceModels.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        url = json["url"],
        category = json["category"],
        country = json["country"],
        language = json["language"];
}
