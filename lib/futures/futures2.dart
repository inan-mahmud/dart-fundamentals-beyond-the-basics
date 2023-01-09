import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dart_fundamentals/futures/comment/comment.dart';
import 'package:http/http.dart' as http;

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
  Future<double> fetchRandomTemperature(String city);
  Future<void> fetchRealData();
  Future<void> fetchCommentList();
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

  @override
  Future<double> fetchRandomTemperature(String city) {
    final random = Random();
    final isError = random.nextBool();
    if (isError) {
      return Future.error(HttpException('Could not reach server'));
    } else {
      final temp = random.nextDouble() * 50;
      return Future.value(temp);
    }
  }

  @override
  Future<void> fetchRealData() async {
    const base = 'https://fcc-weather-api.glitch.me/api/current';
    const lattitude = 45.5;
    const longitude = -122.7;
    final url = Uri.parse('$base?lat=$lattitude&lon=$longitude');
    try {
      final response = await http.get(url);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        throw HttpException('$statusCode');
      }
      final jsonString = response.body;
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      print(jsonMap);
      final temperature = jsonMap['main']['temp'] as double;
      final city = jsonMap['name'] as String;
      print("It's $temperature degrees in $city.");
    } on SocketException catch (error) {
      print(error);
    } on HttpException catch (error) {
      print(error);
    } on FormatException catch (error) {
      print(error);
    }
  }

  @override
  Future<void> fetchCommentList() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final commentList = <Comment>[];
    try {
      final response = await http.get(url);
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final rawJsonString = response.body;
        final jsonList = jsonDecode(rawJsonString);
        for (var element in jsonList) {
          final comment = Comment.fromJson(element);
          commentList.add(comment);
        }
      } else {
        throw HttpException('$statusCode');
      }
    } on SocketException catch (error) {
      print(error);
    } on HttpException catch (error) {
      print(error);
    } on FormatException catch (error) {
      print(error);
    }
    print("CommentList: $commentList");
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
