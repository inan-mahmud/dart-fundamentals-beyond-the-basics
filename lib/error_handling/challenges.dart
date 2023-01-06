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
  validatePostalCode('1212121');
}

void validatePostalCode(String postalCode) {
  try {
    int.parse(postalCode);
  } on FormatException {
    throw InvalidPostalCodeException('The postal code is not valid');
  }

  if (postalCode.length != 5) {
    throw InvalidPostalCodeException(
        'The postal code must be of five digits long');
  }
}

///Challenge 2 - Five Digits, No More, No Less

class InvalidPostalCodeException implements Exception {
  final String message;

  InvalidPostalCodeException(this.message);
}
