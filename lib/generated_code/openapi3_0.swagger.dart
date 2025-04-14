// ignore_for_file: type=lint

import 'dart:async';

import 'package:chopper/chopper.dart' as chopper;
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

import 'client_mapping.dart';
import 'openapi3_0.models.swagger.dart';

export 'openapi3_0.models.swagger.dart';

part 'openapi3_0.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Openapi30 extends ChopperService {
  static Openapi30 create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$Openapi30(client);
    }

    final newClient = ChopperClient(
      services: [_$Openapi30()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http://'),
    );
    return _$Openapi30(newClient);
  }

  ///Retrieve all countries
  Future<chopper.Response<List<Country>>> countriesGet() {
    generatedMapping.putIfAbsent(Country, () => Country.fromJsonFactory);

    return _countriesGet();
  }

  ///Retrieve all countries
  @GET(path: '/countries')
  Future<chopper.Response<List<Country>>> _countriesGet();

  ///Retrieve details about a specific Country
  ///@param name
  Future<chopper.Response<CountryDetails>> countriesNameGet({
    required String? name,
  }) {
    generatedMapping.putIfAbsent(
      CountryDetails,
      () => CountryDetails.fromJsonFactory,
    );

    return _countriesNameGet(name: name);
  }

  ///Retrieve details about a specific Country
  ///@param name
  @GET(path: '/countries/{name}')
  Future<chopper.Response<CountryDetails>> _countriesNameGet({
    @Path('name') required String? name,
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
