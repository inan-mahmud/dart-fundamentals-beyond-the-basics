import 'package:dart_fundamentals/abstract_classes/abstract_class.dart';

///Challenge 1 - Calculator

class Calculator with Adder {}

mixin Adder {
  void sum(int a, int b) {
    print(a + b);
  }
}

void main() {
  final calculator = Calculator();
  calculator.sum(1, 2);

  final willi = Platypus(1.0);
  final billi = Platypus(2.4);
  final nilli = Platypus(2.1);
  final jilli = Platypus(0.4);
  final silli = Platypus(1.7);

  final platypi = [willi, billi, nilli, jilli, silli];

  for (final platypus in platypi) {
    print(platypus.weight);
  }

  print('--------');
  platypi.sort();
  for (final platypus in platypi) {
    print(platypus.weight);
  }
}
