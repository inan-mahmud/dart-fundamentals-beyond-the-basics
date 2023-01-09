import 'dart:convert';

import 'package:collection/collection.dart';

class Wind {
  final double? speed;
  final int? deg;

  const Wind({this.speed, this.deg});

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';

  factory Wind.fromMap(Map<String, dynamic> data) => Wind(
        speed: (data['speed'] as num?)?.toDouble(),
        deg: data['deg'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'speed': speed,
        'deg': deg,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Wind].
  factory Wind.fromJson(String data) {
    return Wind.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Wind] to a JSON string.
  String toJson() => json.encode(toMap());

  Wind copyWith({
    double? speed,
    int? deg,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Wind) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode;
}
