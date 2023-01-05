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
  monday("Monday"),
  tuesday("Tuesday"),
  wednesday("Wednesday"),
  thursday("Thursday"),
  friday("Friday"),
  saturday("Saturday"),
  sunday("Sunday");

  Day operator +(int days) {
    final numberOfItems = Day.values.length;

    final index = (this.index + days) % numberOfItems;

    return Day.values[index];
  }

  //challenge 1: Better days ahead
  Day operator -(int days) {
    final numberOfItems = Day.values.length;
    final index = (this.index - days) % numberOfItems;
    return Day.values[index];
  }

  Day get next {
    return this + 1;
  }

  final String displayName;

  const Day(this.displayName);
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

mixin Describer on Enum {
  void describe() {
    print('This $runtimeType is a $name');
  }
}

enum Fruit with Describer {
  cherry,
  peach,
  banana,
}

enum Vegetable with Describer {
  carrot,
  broccoli,
  spinach,
}

enum Default<T extends Object> {
  font<String>('roboto'),
  size<double>(17.0),
  weight<int>(400);

  final T value;
  const Default(this.value);
}

//Challenge 2- Not Found, 404

enum HttpResponse {
  success(200, 'Ok'),
  notFound(404, 'Not Found'),
  serverError(500, 'Internal Server Error'),
  badRequest(400, 'Bad Request');

  final int code;
  final String message;

  const HttpResponse(this.code, this.message);
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

  day = day - 1;
  print(day.name);

  day--;
  print(day.name);
  print(day.displayName);

  final weather = Weather.cloudy;

  String serialized = weather.serialize();
  print(serialized);

  Weather deserialized = Weather.deserialize(serialized);
  print(deserialized);

  final fruit = Fruit.banana;
  final vegi = Vegetable.broccoli;

  fruit.describe();
  vegi.describe();

  String defaultFont = Default.font.value;
  double defaultSize = Default.size.value;
  int defaultWeight = Default.weight.value;
}
