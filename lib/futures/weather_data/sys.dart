import 'dart:convert';

import 'package:collection/collection.dart';

class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  const Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  @override
  String toString() {
    return 'Sys(type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  factory Sys.fromMap(Map<String, dynamic> data) => Sys(
        type: data['type'] as int?,
        id: data['id'] as int?,
        country: data['country'] as String?,
        sunrise: data['sunrise'] as int?,
        sunset: data['sunset'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'id': id,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Sys].
  factory Sys.fromJson(String data) {
    return Sys.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Sys] to a JSON string.
  String toJson() => json.encode(toMap());

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Sys) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      type.hashCode ^
      id.hashCode ^
      country.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode;
}
