// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi3_0.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Openapi30 extends Openapi30 {
  _$Openapi30([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Openapi30;

  @override
  Future<Response<List<Country>>> _countriesGet() {
    final Uri $url = Uri.parse('/countries');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Country>, Country>($request);
  }

  @override
  Future<Response<CountryDetails>> _countriesNameGet({required String? name}) {
    final Uri $url = Uri.parse('/countries/${name}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CountryDetails, CountryDetails>($request);
  }
}
