void main() {
  try {
    doubleTheFun();
  } on FormatException catch (e) {
    print(e.message);
  }
}

///Challenge -1 Double the Fun

void doubleTheFun() {
  final numbers = ['3', '1E+8', '1.25', 'four', '-0.01', 'Nan', 'Infinity'];
  for (var number in numbers) {
    print(double.parse(number));
  }
}
