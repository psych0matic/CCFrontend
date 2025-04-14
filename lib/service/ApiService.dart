import 'package:flag_explorer_web/generated_code/openapi3_0.models.swagger.dart';
import 'package:flag_explorer_web/generated_code/openapi3_0.swagger.dart'
    as swagger;

class ApiService {
  final swagger.Openapi30 client;

  ApiService(Uri baseUrl) : client = swagger.Openapi30.create(baseUrl: baseUrl);

  Future<List<Country>> getCountries() async {
    final response = await client.countriesGet();
    return response.body!;
  }

  Future<CountryDetails> getCountryDetails(String countryName) async {
    final response = await client.countriesNameGet(name: countryName);
    return response.body!;
  }
}
