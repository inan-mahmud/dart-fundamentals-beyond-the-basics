extension on int {
  Duration get minutes => Duration(minutes: this);
}

void main() {
  final timeRemaining = 3.minutes;
  print(timeRemaining);
}
