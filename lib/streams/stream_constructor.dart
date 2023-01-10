import 'dart:async';

void main() {
  final first = Future(() => 'Row');
  final second = Future(() => 'Row');
  final third = Future(() => 'Row');
  final fourth = Future.delayed(
      Duration(
        milliseconds: 300,
      ),
      () => 'your boat');

  final stream = Stream<String>.fromFutures([
    first,
    second,
    third,
    fourth,
  ]);
  stream.listen((data) {
    print(data);
  });

  final emptyStream = Stream.empty();
  emptyStream.listen((data) {
    print(data);
  });

  final valueStream = Stream<String>.value('value stream');
  valueStream.listen((data) {
    print(data);
  });

  var data = [1, 2, 3, 4, 5];
  var iterableStream = Stream.fromIterable(data);
  iterableStream.listen((data) {
    print(data);
  });



  //streamcontroller and  sink

  final controller = StreamController<String>();
}


