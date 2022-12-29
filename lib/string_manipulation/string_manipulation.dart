/// String manipulation
///
/// This file will contain all the string manipulation functions or techniques from Dart fundamentals: Beyond the basics book

// pad left

void stringPadding() {
  final time = Duration(hours: 1, minutes: 2, seconds: 3);
  final hours = time.inHours;
  final minutes = '${time.inMinutes % 60}'.padLeft(2, '0');
  final seconds = '${time.inSeconds % 60}'.padLeft(2, '0');
  final timeString = '$hours:$minutes:$seconds';

  print(timeString);
}

// building strings with String buffers

void buffer() {
  final message = StringBuffer();
  message.write('Hello');
  message.write(' my name is ');
  message.write('Slim Shady');
  print(message.toString());
}

bool isPhoneNumber(String phoneNumber) {
  final onlyNumbers = RegExp(r'^[0-9]+$');
  return onlyNumbers.hasMatch(phoneNumber);
}

bool validatedPassword(String password) {
  if (password.isEmpty) {
    return false;
  }
  final lowercase = RegExp(r'[a-z]');
  final upperCase = RegExp(r'[A-Z]');
  final number = RegExp(r'[0-9]');
  final specialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>_-]');
  final minLength = 6;

  bool hasUppercase = password.contains(upperCase);
  bool hasLowercase = password.contains(lowercase);
  bool hasNumber = password.contains(number);
  bool hasSpecialCharacters = password.contains(specialCharacters);
  bool hasMinLength = password.length >= minLength;

  return hasUppercase &&
      hasLowercase &&
      hasNumber &&
      hasSpecialCharacters &&
      hasMinLength;
}

void main() {
  stringPadding();
  buffer();
  print(isPhoneNumber('12345678'));
  print(isPhoneNumber('2dfds1dd3'));
  print(validatedPassword('123456A_a'));
}
