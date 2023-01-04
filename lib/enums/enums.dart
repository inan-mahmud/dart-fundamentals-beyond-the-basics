enum TrafficLight {
  green('Go!'),
  yellow('Slow down!'),
  red('Stop!');

  final String message;
  const TrafficLight(this.message);
}

/// operator overloading

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  @override
  String toString() => '($x, $y)';

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }
}

enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  Day operator +(int days) {
    final numberOfItems = Day.values.length;

    final index = (this.index + days) % numberOfItems;

    return Day.values[index];
  }

  Day get next {
    return this + 1;
  }
}

abstract class Serializable {
  String serialize();
}

enum Weather implements Serializable {
  sunny,
  cloudy,
  rainy;

  @override
  String serialize() => name;

  static Weather deserialize(String value) {
    return values.firstWhere(
      (element) => element.name == value,
      orElse: () => Weather.sunny,
    );
  }
}

void main() {
  final color = TrafficLight.green;

  print(color.message);

  const pointA = Point(1, 4);
  const pointB = Point(3, 2);

  final pointC = pointA + pointB;
  print(pointC);

  var day = Day.monday;

  day = day + 2;
  print(day.name);

  day += 4;
  print(day.name);

  day++;
  print(day.name);

  final restDay = Day.saturday;
  print(restDay.next);

  final weather = Weather.cloudy;

  String serialized = weather.serialize();
  print(serialized);

  Weather deserialized = Weather.deserialize(serialized);
  print(deserialized);
}
