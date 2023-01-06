void main() {
  challenge1();
  challenge2();
}

///Challenge -1 Double the Fun

void challenge1() {
  try {
    doubleTheFun();
  } on FormatException catch (e) {
    print(e.message);
  }
}

void doubleTheFun() {
  final numbers = ['3', '1E+8', '1.25', 'four', '-0.01', 'Nan', 'Infinity'];
  for (var number in numbers) {
    print(double.parse(number));
  }
}

void challenge2() {
  isValidPostalCode(1234);
}

void isValidPostalCode(int postalCode) {
  String postalCodeString = postalCode.toString();
  if (postalCodeString.length != 5) {
    throw InvalidPostalCodeException('Postal Code must be of 5 digits');
  }
}

///Challenge 2 - Five Digits, No More, No Less

class InvalidPostalCodeException implements Exception {
  final String message;

  InvalidPostalCodeException(this.message);
}
