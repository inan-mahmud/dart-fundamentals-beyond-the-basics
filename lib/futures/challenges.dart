import 'package:dart_fundamentals/futures/futures2.dart';

void main() async {
  await realTemperature();
  await commentList();
  await randomTemperature();
  await randomTemperature();
  await randomTemperature();
  await randomTemperature();
}

Future<void> randomTemperature() async {
  final web = FakeWebServer();
  try {
    final city = 'Portland';
    final degrees = await web.fetchRandomTemperature(city);
    print("It's $degrees degrees in $city");
  } on ArgumentError catch (e) {
    print(e);
  }
}

Future<void> realTemperature() async {
  final web = FakeWebServer();
  await web.fetchRealData();
}

Future<void> commentList() async {
  final web = FakeWebServer();
  await web.fetchCommentList();
}
