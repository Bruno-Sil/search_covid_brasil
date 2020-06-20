import 'package:flutter_test/flutter_test.dart';
import 'package:search_covid_brasil/search_covid_brasil.dart';

void main() {
  test('consumir api search_covid_brasil', () {
    final searchcovidBrasil =  SearchCovidBrasil;
    expect(searchcovidBrasil, isA<SearchCovidBrasil>()); 
  });
}