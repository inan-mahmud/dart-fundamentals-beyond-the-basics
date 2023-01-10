import 'dart:async';

void main() {
  final controller = StreamController<String>();
  final stream = controller.stream;
  final sink = controller.sink;

  stream.listen(
    print,
    onError: print,
    onDone: () => print('Sink closed'),
  );

  sink.add('grape');
  sink.add('mango');
  sink.add('grape');
  sink.addError(Exception('cherry'));
  sink.add('grape');
  sink.close();
}
