class ShortPasswordException implements Exception {
  final String message;

  ShortPasswordException(this.message);
}

class NoNumberException implements Exception {
  final String message;

  NoNumberException(this.message);
}

class NoLowerCaseException implements Exception {
  final String message;

  NoLowerCaseException(this.message);
}

class NoUpperCaseException implements Exception {
  final String message;

  NoUpperCaseException(this.message);
}

void main() {
  const password = 'password1234';

  try {
    validatePassword(password);
  } on ShortPasswordException catch (e) {
    print(e.message);
  } on NoLowerCaseException catch (e) {
    print(e.message);
  } on NoUpperCaseException catch (e) {
    print(e.message);
  } on NoNumberException catch (e) {
    print(e.message);
  }
}

void validatePassword(String password) {
  validateLength(password);
  validateLowercase(password);
  validateUppercase(password);
  validateNumber(password);
}

void validateLength(String password) {
  final goodLength = RegExp(r'.{12,}');
  if (!password.contains(goodLength)) {
    throw ShortPasswordException('Password must be at least 12 characters!');
  }
}

void validateLowercase(String password) {
  final goodLength = RegExp(r'[a-z]');
  if (!password.contains(goodLength)) {
    throw NoLowerCaseException('Password must have a lowercase letter!');
  }
}

void validateUppercase(String password) {
  final goodLength = RegExp(r'[A-Z]');
  if (!password.contains(goodLength)) {
    throw NoUpperCaseException('Password must have a uppercase letter!');
  }
}

void validateNumber(String password) {
  final goodLength = RegExp(r'[0-9]');
  if (!password.contains(goodLength)) {
    throw NoNumberException('Password must have a number!');
  }
}
