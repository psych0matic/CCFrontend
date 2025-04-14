// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'openapi3_0.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Country {
  const Country({
    this.name,
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  static const toJsonFactory = _$CountryToJson;
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'flag')
  final String? flag;
  static const fromJsonFactory = _$CountryFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Country &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(flag) ^
      runtimeType.hashCode;
}

extension $CountryExtension on Country {
  Country copyWith({String? name, String? flag}) {
    return Country(name: name ?? this.name, flag: flag ?? this.flag);
  }

  Country copyWithWrapped({Wrapped<String?>? name, Wrapped<String?>? flag}) {
    return Country(
        name: (name != null ? name.value : this.name),
        flag: (flag != null ? flag.value : this.flag));
  }
}

@JsonSerializable(explicitToJson: true)
class CountryDetails {
  const CountryDetails({
    this.name,
    this.population,
    this.capital,
    this.flag,
  });

  factory CountryDetails.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsFromJson(json);

  static const toJsonFactory = _$CountryDetailsToJson;
  Map<String, dynamic> toJson() => _$CountryDetailsToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'population')
  final int? population;
  @JsonKey(name: 'capital')
  final String? capital;
  @JsonKey(name: 'flag')
  final String? flag;
  static const fromJsonFactory = _$CountryDetailsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CountryDetails &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.population, population) ||
                const DeepCollectionEquality()
                    .equals(other.population, population)) &&
            (identical(other.capital, capital) ||
                const DeepCollectionEquality()
                    .equals(other.capital, capital)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(population) ^
      const DeepCollectionEquality().hash(capital) ^
      const DeepCollectionEquality().hash(flag) ^
      runtimeType.hashCode;
}

extension $CountryDetailsExtension on CountryDetails {
  CountryDetails copyWith(
      {String? name, int? population, String? capital, String? flag}) {
    return CountryDetails(
        name: name ?? this.name,
        population: population ?? this.population,
        capital: capital ?? this.capital,
        flag: flag ?? this.flag);
  }

  CountryDetails copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<int?>? population,
      Wrapped<String?>? capital,
      Wrapped<String?>? flag}) {
    return CountryDetails(
        name: (name != null ? name.value : this.name),
        population: (population != null ? population.value : this.population),
        capital: (capital != null ? capital.value : this.capital),
        flag: (flag != null ? flag.value : this.flag));
  }
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
