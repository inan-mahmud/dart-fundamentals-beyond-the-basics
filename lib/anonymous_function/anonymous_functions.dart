import 'package:dart_fundamentals/dart_fundamentals.dart';

/// Anonymous Functions
///
/// This file will contain examples on anonymous functions from
/// dart fundamentals: beyond the basic book

Function multiply = (int a, int b) {
  return a * b;
};

void namedFunction(Function anonymousFuction) {
  anonymousFuction();
}

Function returningFunction() {
  return () => print('hello');
}

void main() {
  namedFunction(() {
    print("called anonymous function");
  });

  const numbers = [1, 2, 3];

  /**
   * here's the anonymous function is passed as an argument
   * (int number){
   *  print(3 * number);
   * }
   */
  for (var number in numbers) {
    print(3 * number);
  }

  final flowerColor = {
    'roses': 'red',
    'violets': 'blue',
  };

  flowerColor.forEach((flower, color) {
    print('$flower are $color');
  });

  const evenNumbers = [2, 4, 6, 8, 10, 12];

  // map function
  final mappedNumbers = evenNumbers.map((even) => even * even);
  print(mappedNumbers);

  final user1 = User.anonymous();
  final user2 = User(id: 1, name: 'Inan');
  final user3 = User(id: 2, name: 'Inan');
  final user4 = User(id: 3, name: 'Inan');
  final user5 = User(id: 4, name: 'Inan');
  final user6 = User(id: 5, name: 'Inan');
  final user7 = User(id: 6, name: 'Inan');

  final users = <User>[user1, user2, user3, user4, user5, user6, user7];

  //mapping and filtering
  final ids = users.map((user) => user.id).toList().where((id) => id.isEven);
  print(ids);

  //consolidating -> take all elements of an iterable collection
  // and consolidate them into one value

  // 1. using Reduce

  const evens = [2, 4, 6, 8, 10, 12];
  final total = evens.reduce((sum, element) => sum + element);
  print(total);

  //using reduce won't work for empty list
  //for this we need to use fold

  // 2. using Fold

  final total2 = evens.fold<int>(0, (sum, element) => sum + element);
  print(total2);

  final emptyList = <int>[];
  final result = emptyList.fold<int>(0, (sum, element) => sum + element);

  //prints 0
  print(result);

  //default sorting is alphabetical order
  final heavyFoods = ['tehari', 'kachchi', 'khichuri', 'ilishpolao'];
  heavyFoods.sort();
  print(heavyFoods);

  //we want to sort using length of strings
  heavyFoods.sort(((a, b) {
    return a.length.compareTo(b.length);
  }));
  print(heavyFoods);
}
