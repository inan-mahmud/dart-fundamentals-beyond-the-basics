import 'dart:convert';
import 'dart:io';
import 'package:dart_fundamentals/futures/todo.dart';
import 'package:http/http.dart' as http;
//void main() {
// final myFuture = Future<int>.delayed(
//   Duration(seconds: 1),
//   () => 42,
// );
// print(myFuture);

///using callbacks
// print('Before the future');

// final myFuture = Future<int>.delayed(
//   Duration(seconds: 1),
//   () => 42,
// )
//     .then(
//       (value) => print('Value: $value'),
//     )
//     .catchError(
//       (Object error) => print('Error: $error'),
//     )
//     .whenComplete(
//       () => print('Future is complete'),
//     );
// print('After the future');
//}

/// async await

// Future<void> main() async {
//   print('Before the future');

//   try {
//     final value = await Future<int>.delayed(
//       Duration(seconds: 1),
//       () => 42,
//     );
//     print('Value: $value');
//   } catch (error) {
//     print(error);
//   } finally {
//     print('Future is complete');
//   }
//   print('After the future');
// }

///http request

Future<void> main() async {
  try {
    final url = 'http://jsonplaceholder.typicode.com/todos/1';
    final parsedUrl = Uri.parse(url);

    final response = await http.get(parsedUrl);
    final statusCode = response.statusCode;

    if (statusCode != 200) {
      throw HttpException('$statusCode');
    }

    final jsonString = response.body;
    final jsonMap = jsonDecode(jsonString);

    final todo = Todo.fromJson(jsonMap);
    print(todo);
  } on SocketException catch (error) {
    print(error);
  } on HttpException catch (error) {
    print(error);
  } on FormatException catch (error) {
    print(error);
  }
}
