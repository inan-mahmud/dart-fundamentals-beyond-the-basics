class Fruit {
  String color;

  Fruit(this.color);

  void describeColor() {
    print("Color: $color");
  }
}

class Melon extends Fruit {
  Melon(super.color);
}

class Watermelon extends Melon {
  Watermelon(super.color);

  @override
  void describeColor() {
    print("Waltermelon Color: $color");
  }
}

class Cantaloupe extends Melon {
  Cantaloupe(super.color);
}

void main() {
  final fruit = Fruit('Green');
  final waterMelon = Watermelon('Red');

  print(fruit.color);
  print(waterMelon.color);
}
