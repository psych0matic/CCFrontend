import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'default_api_test.mocks.dart';

/// tests for DefaultApi
@GenerateMocks([http.Client])
void main() {
  group('Country API', () {
    test('returns a list of Country when response is successful', () async {
      final client = MockClient();

      when(client.get(Uri.parse("http://localhost:3000/countries"))).thenAnswer(
        (_) async => http.Response(
          jsonEncode([
            {"name": "Canada", "flag": "https://flagcdn.com/w320/ca.png"},
            {"name": "Germany", "flag": "https://flagcdn.com/w320/de.png"},
          ]),
          200,
        ),
      );

      String list =
          (await client.get(Uri.parse("http://localhost:3000/countries"))).body;

      var json = jsonDecode(list);
      expect(json[0]['name'], "Canada");
      expect(json[0]['flag'], "https://flagcdn.com/w320/ca.png");
      expect(json[1]['name'], "Germany");
      expect(json[1]['flag'], "https://flagcdn.com/w320/de.png");
    });

    test(
      'returns the details of a country when response is successful',
      () async {
        final client = MockClient();

        when(
          client.get(Uri.parse("http://localhost:3000/countries/Canada")),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode({
              "name": "Canada",
              "flag": "https://flagcdn.com/w320/ca.png",
              "capital": "Ottawa",
              "population": 38005238,
            }),
            200,
          ),
        );

        String country =
            (await client.get(
              Uri.parse("http://localhost:3000/countries/Canada"),
            )).body;

        var json = jsonDecode(country);
        expect(json['name'], "Canada");
        expect(json['flag'], "https://flagcdn.com/w320/ca.png");
        expect(json['capital'], "Ottawa");
        expect(json['population'], 38005238);
      },
    );
  });
}
