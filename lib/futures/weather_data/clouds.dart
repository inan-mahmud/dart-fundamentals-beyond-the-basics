import 'dart:convert';

import 'package:collection/collection.dart';

class Clouds {
  final int? all;

  const Clouds({this.all});

  @override
  String toString() => 'Clouds(all: $all)';

  factory Clouds.fromMap(Map<String, dynamic> data) => Clouds(
        all: data['all'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'all': all,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Clouds].
  factory Clouds.fromJson(String data) {
    return Clouds.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Clouds] to a JSON string.
  String toJson() => json.encode(toMap());

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Clouds) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => all.hashCode;
}
