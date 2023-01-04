extension on String {
  String get encoded => _code(1);
  String get decoded => _code(-1);

  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }
}

void main() {
  final secret = 'abc'.encoded;
  print(secret);
  print(secret.decoded);
}
