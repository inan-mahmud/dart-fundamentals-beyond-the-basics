///Challenge 1 - Fizzy Bottles

abstract class Bottle {
  void open();

  factory Bottle() => SodaBottle();
}

class SodaBottle implements Bottle {
  @override
  void open() {
    print('Fizz fizz');
  }
}

void main() {
  final bottle = Bottle();
  bottle.open();
}
