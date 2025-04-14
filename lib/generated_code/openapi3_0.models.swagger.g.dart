// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi3_0.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'flag': instance.flag,
    };

CountryDetails _$CountryDetailsFromJson(Map<String, dynamic> json) =>
    CountryDetails(
      name: json['name'] as String?,
      population: (json['population'] as num?)?.toInt(),
      capital: json['capital'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryDetailsToJson(CountryDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'population': instance.population,
      'capital': instance.capital,
      'flag': instance.flag,
    };
