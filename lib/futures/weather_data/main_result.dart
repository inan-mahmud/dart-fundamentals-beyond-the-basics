import 'dart:convert';

import 'package:collection/collection.dart';

class Main {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  const Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
  }

  factory Main.fromMap(Map<String, dynamic> data) => Main(
        temp: (data['temp'] as num?)?.toDouble(),
        feelsLike: (data['feels_like'] as num?)?.toDouble(),
        tempMin: (data['temp_min'] as num?)?.toDouble(),
        tempMax: (data['temp_max'] as num?)?.toDouble(),
        pressure: data['pressure'] as int?,
        humidity: data['humidity'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Main].
  factory Main.fromJson(String data) {
    return Main.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Main] to a JSON string.
  String toJson() => json.encode(toMap());

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Main) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      temp.hashCode ^
      feelsLike.hashCode ^
      tempMin.hashCode ^
      tempMax.hashCode ^
      pressure.hashCode ^
      humidity.hashCode;
}
