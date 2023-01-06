void main() {
  print('first');
  // Future(
  //   () => print('second'),
  // ).then(
  //   (value) => print('third'),
  // );
  // Future.microtask(
  //   () => print('third'),
  // );
  // Future(
  //   () => print('fourth'),
  // );

  // print('fifth');

  Future.delayed(
    Duration(seconds: 2),
    () => print('second'),
  );

  print('third');

  ///Challenge 1 ans
  /// Ans: 1, 11, 4, 5, 2, 3, 7, 9, 10, 8, 6
}
