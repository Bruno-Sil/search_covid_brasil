library search_covid_brasil;

import 'package:dio/dio.dart';

class SearchCovidBrasil {
  String authorName;
  String authorUrl;
  String codeUrl;
  String description;
  String id;
  String licenseName;
  String licenseUrl;
  List<Links> links;
  String name;
  String slug;
  String sourceName;
  String sourceUrl;
  String collectedAt;
  List<Tables> tables;

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

  SearchCovidBrasil.fromJson(Map<String, dynamic> json) {
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    codeUrl = json['code_url'];
    description = json['description'];
    id = json['id'];
    licenseName = json['license_name'];
    licenseUrl = json['license_url'];
    if (json['links'] != null) {
      links = new List<Links>();
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
    name = json['name'];
    slug = json['slug'];
    sourceName = json['source_name'];
    sourceUrl = json['source_url'];
    collectedAt = json['collected_at'];
    if (json['tables'] != null) {
      tables = new List<Tables>();
      json['tables'].forEach((v) {
        tables.add(new Tables.fromJson(v));
      });
    }
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
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['source_name'] = this.sourceName;
    data['source_url'] = this.sourceUrl;
    data['collected_at'] = this.collectedAt;
    if (this.tables != null) {
      data['tables'] = this.tables.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String title;
  String url;

  Links({this.title, this.url});

  Links.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class Tables {
  List<Fields> fields;
  String name;
  String dataUrl;
  String importDate;

  Tables({this.fields, this.name, this.dataUrl, this.importDate});

  Tables.fromJson(Map<String, dynamic> json) {
    if (json['fields'] != null) {
      fields = new List<Fields>();
      json['fields'].forEach((v) {
        fields.add(new Fields.fromJson(v));
      });
    }
    name = json['name'];
    dataUrl = json['data_url'];
    importDate = json['import_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fields != null) {
      data['fields'] = this.fields.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['data_url'] = this.dataUrl;
    data['import_date'] = this.importDate;
    return data;
  }
}

class Fields {
  String name;
  String type;

  Fields({this.name, this.type});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }

  Future<SearchCovidBrasil> fromJson(String search) async {
      var response = await Dio().get("https://brasil.io/api/dataset/covid19/?format=json");
      return SearchCovidBrasil.fromJson(response.data);
  }
}