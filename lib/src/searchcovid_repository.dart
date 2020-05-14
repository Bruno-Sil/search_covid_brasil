import 'package:dio/dio.dart';

import 'model.dart';

class SearchCovidRepository {

  Future<SearchCovidBrasil> getSearch(String search) async {
   var response = await Dio().get("https://brasil.io/api/dataset/covid19/?format=json");
      return SearchCovidBrasil.fromJson(response.data);
  }
}