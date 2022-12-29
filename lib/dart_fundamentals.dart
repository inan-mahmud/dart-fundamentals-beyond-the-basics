class User {
  final int _id;
  final String _name;

  const User({int id = 0, String name = 'anonymous'})
      : _id = id,
        _name = name;

  const User.anonymous() : this();

  int get id => _id;
}

class PhoneNumber {
  final String value;

  const PhoneNumber({required this.value});
}

class Student {
  final String firstName;
  final String lastName;
  int grade;

  Student(this.firstName, this.lastName, this.grade);
}
