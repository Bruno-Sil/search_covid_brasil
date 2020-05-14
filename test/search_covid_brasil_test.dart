import 'package:flutter_test/flutter_test.dart';
import 'package:search_covid_brasil/search_covid_brasil.dart';

void main() {
  test('consumir api search_covid_brasil', () async{
    final searchcovidBrasil = await SearchCovidBrasil.getInstance("69005180");
    expect(searchcovidBrasil, isA<SearchCovidBrasil>()); 
  });
}