//Given the map below:

final animals = {
  'sheep': 99,
  'goats': 32,
  'snakes': 7,
  'lions': 80,
  'seals': 18,
};

//Use higher-order functions to find the total number of animals whose names begin with “s”.
//How many sheep, snakes and seals are there?

main() {
  final count = animals.keys
      .where((key) => key.startsWith('s'))
      .fold<int>(0, (sum, key) => sum + (animals[key] ?? 0));
  print(count);

  final result = repeatTask(4, 2, (num input) {
    return input * input;
  });
  print(result);
}

/// It repeats a given task on input for times
///number of times.
/// Pass an anonymous function to repeatTask
///to square the input of
///that you get the result 65536
///because 2 squared is 4 , 4  squared is 16 ,
/// 16 squared is 256 and 256 squared is 65536 .

int repeatTask(int times, int input, Function task) {
  int result = task(input);
  for (var i = 1; i < times; i++) {
    result = task(result);
  }
  return result;
}
