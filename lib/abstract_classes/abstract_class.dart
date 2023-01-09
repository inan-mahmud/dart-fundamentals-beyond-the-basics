abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }
}

class Platypus extends Animal implements Comparable {
  final double weight;

  Platypus(this.weight);

  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }

  void layEggs() {
    print('Plop plop');
  }

  @override
  int compareTo(other) {
    if (weight > other.weight) {
      return 1;
    } else if (weight < other.weight) {
      return -1;
    }
    return 0;
  }
}

void main() {
  Animal platypus = Platypus(2);
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  //platypus.layEggs();
  print(platypus);
}
