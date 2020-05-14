import 'searchcovid_repository.dart';

class SearchCovidBrasil {
  final String authorName;
  final String authorUrl;
  final String codeUrl;
  final String description;
  final String id;
  final String licenseName;
  final String licenseUrl;
  final List<SearchCovidBrasil> links;
  final String name;
  final String slug;
  final String sourceName;
  final String sourceUrl;
  final String collectedAt;
  final List<SearchCovidBrasil> tables;

  SearchCovidBrasil(
      {this.authorName,
      this.authorUrl,
      this.codeUrl,
      this.description,
      this.id,
      this.licenseName,
      this.licenseUrl,
      this.links,
      this.name,
      this.slug,
      this.sourceName,
      this.sourceUrl,
      this.collectedAt,
      this.tables});

  factory SearchCovidBrasil.fromJson(Map<String, dynamic> json) {
    return SearchCovidBrasil(
    authorName : json['author_name'],
    authorUrl : json['author_url'],
    codeUrl : json['code_url'],
    description : json['description'],
    id : json['id'],
    licenseName : json['license_name'],
    licenseUrl : json['license_url'],
    name : json['name'],
    slug : json['slug'],
    sourceName : json['source_name'],
    sourceUrl : json['source_url'],
    collectedAt : json['collected_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_name'] = this.authorName;
    data['author_url'] = this.authorUrl;
    data['code_url'] = this.codeUrl;
    data['description'] = this.description;
    data['id'] = this.id;
    data['license_name'] = this.licenseName;
    data['license_url'] = this.licenseUrl;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['source_name'] = this.sourceName;
    data['source_url'] = this.sourceUrl;
    data['collected_at'] = this.collectedAt;
    return data;
  }

  static Future<SearchCovidBrasil> getInstance(String search) async {
      return SearchCovidRepository().getSearch(search);
  }
}