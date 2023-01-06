import 'dart:async';

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  @override
  Future<double> fetchTemperature(String city) async {
    //return Future.value(42.0);
    //return Future.error(ArgumentError("$city doesn't exist"));
    //return Future.delayed(Duration(seconds: 2), () => 42);
    // return Future.delayed(
    //   Duration(seconds: 2),
    //   () => throw ArgumentError('City does not exist'),
    // );
    //return 42.0;

    /// using Completer
    final completer = Completer<double>();
    if (city == 'Portland') {
      completer.complete(42.0);
    } else {
      completer.completeError(ArgumentError("City doesn't exist"));
    }
    return completer.future;
  }
}

Future<void> main() async {
  final web = FakeWebServer();
  try {
    final city = 'Portland';
    final degrees = await web.fetchTemperature(city);
    print("It's $degrees degrees in $city");
  } on ArgumentError catch (e) {
    print(e);
  }
}
