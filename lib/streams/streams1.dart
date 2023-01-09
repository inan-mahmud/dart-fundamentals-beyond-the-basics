import 'dart:async';
import 'dart:io';

Future<void> main() async {
  // try {
  final file = File('assets/lorem.txt');
  // final contents = await file.readAsString();
  // print(contents);
  final stream = file.openRead();
  // stream.listen((data) {
  //   print(data.length);
  // });
  // await for (var data in stream) {
  //   print(data.length);
  // }

  // stream.listen(
  //   (data) {
  //     print(data.length);
  //   },
  //   onError: (Object error) {
  //     print(error);
  //   },
  //   onDone: (() {
  //     print('All finished');
  //   }),
  // );

  // } on Exception catch (error) {
  //   print(error);
  // } finally {
  //   print('All finished');
  // }
  // StreamSubscription<List<int>>? subscription;
  // subscription = stream.listen(
  //   (data) {
  //     print(data.length);
  //     subscription?.cancel();
  //   },
  //   cancelOnError: true,
  //   onDone: () => print('All finished'),
  // );

  // stream.listen((data) {
  //   print(data);
  // });
  // final stringStream = stream.transform(utf8.decoder);
  // await for (var data in stringStream) {
  //   print(data);
  // }
  final myStream = Stream<int>.periodic(
    Duration(seconds: 1),
    (value) => value,
  ).take(10);

  await for (var data in myStream) {
    print(data);
  }
}
