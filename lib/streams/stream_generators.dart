void main() {
  ///synchronous generators
  Iterable<int> iterators = getNumbers(7);
  var itStream = Stream.fromIterable(iterators);
  itStream.listen((data) {
    print(data);
  });

  ///asynchronous generators
  final consStream = consciousness();
  consStream.listen((data) {
    print(data);
  });
}

Iterable<int> getNumbers(int number) sync* {
  for (int i = 0; i < number; i++) {
    yield i;
  }
}

Stream<String> consciousness() async* {
  final data = ['con', 'scious', 'ness'];
  for (final part in data) {
    await Future<void>.delayed(Duration(milliseconds: 500));
    yield part;
  }
}
