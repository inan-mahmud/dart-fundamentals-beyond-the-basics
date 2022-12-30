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

// void callback
// specifying the function type
class Button {
  final String title;
  final void Function() onPressed;

  Button({required this.title, required this.onPressed});
}

// value setter callback
class MyWidget {
  final void Function(double xPosition) onTouch;

  MyWidget({required this.onTouch});
}

//value getter callback
class AnotherWidget {
  final String Function()? timeStamp;

  AnotherWidget({this.timeStamp});
}

//tear-off
class StateManager {
  int _counter = 0;

  void handleButtonClick() {
    _counter++;
  }
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
  final heavyFoods = [
    'tehari',
    'kachchi',
    'khichuri',
    'ilishpolao',
    'polao',
    'nolli',
    'nehari'
  ];
  heavyFoods.sort();
  print(heavyFoods);

  //we want to sort using length of strings
  heavyFoods.sort(((a, b) {
    return a.length.compareTo(b.length);
  }));
  print(heavyFoods);

  //combining higher order functions
  final bigUpperHeavyFoods = heavyFoods
      .where((food) => food.length > 6)
      .map((food) => food.toUpperCase())
      .toList();
  print(bigUpperHeavyFoods);

  final scores = [89, 77, 46, 93, 82, 67, 32, 88];
  scores.sort(((a, b) => b.compareTo(a)));
  final bGrades = scores.where(
    (grade) => grade >= 80 && grade <= 90,
  );
  print(bGrades);

//calling the void callback function
  final button = Button(
      title: 'Click',
      onPressed: () {
        print('clicked');
      });
  button.onPressed.call();

  //call setter callback
  final myWidget = MyWidget(onTouch: ((xPosition) {
    print(xPosition);
  }));
  myWidget.onTouch(3.14);

  //call getter callback
  final anotherWidget = AnotherWidget(
    timeStamp: () => DateTime.now().toIso8601String(),
  );
  final timeStamp = anotherWidget.timeStamp?.call();
  print(timeStamp);

  //use tear-off
  final manager = StateManager();

  /// The () parentheses at the end of handleButtonClick()
  /// tell Dart to execute this function, but the () { }
  /// syntax for the anonymous function tells Dart not to execute this function yet.
  /// Dart stores it in the onPressed  property for possible execution later.
  /// You’ve got a command to execute and a command to not execute.
  /// These cancel each other out,
  /// so you have an opportunity to simplify that syntax.

  final myButton = Button(
    title: 'Click me!',
    // onPressed: () {
    //   manager.handleButtonClick();
    // },
    onPressed: manager.handleButtonClick,
  );

  const cities = ['Dhaka', 'Sylhet', 'Rajshahi', 'Mymensingh'];
  // cities.forEach((city) {
  //   print(city);
  // });

  ///because the anonymous function and print
  ///have the same property, city a tear-off instead
  cities.forEach(print);


//Closure
  var counter = 0;
  final incrementCounter = () {
    counter++;
  };

  incrementCounter();
  incrementCounter();
  incrementCounter();
  incrementCounter();
  incrementCounter();
  incrementCounter();
  print(counter);

  final counter1 = countingFunction();
  final counter2 = countingFunction();

  print(counter1());
  print(counter2());
  print(counter1());
  print(counter1());
  print(counter2());
}

//Closure
// A function that counts itself
Function countingFunction() {
  var counter = 0;
  final incrementCounter = () {
    counter += 1;
    return counter;
  };
  return incrementCounter;
}
