// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Grade { A, B, C, D, F }

class Person {
  String givenName;
  String surname;
  Person(
    this.givenName,
    this.surname,
  );
  String get fullName => '$givenName $surname';

  @override
  String toString() => fullName;
}

class Student extends Person {
  Student(super.givenName, super.surname);

  var grades = <Grade>[];

  @override
  String get fullName => '$surname, $givenName';
}

class SchooldBandMember extends Student {
  SchooldBandMember(super.givenName, super.surname);

  static const minimumPracticeTime = 2;
}

class StudentAthlete extends Student {
  StudentAthlete(super.givenName, super.surname);

  bool get isEligible => grades.every((grade) => grade != Grade.F);
}

void main() {
  final inan = Person('Inan', 'Mahmud');
  final sanji = Student('Sanji', 'Vinsmoke');
  print(inan.fullName);
  print(sanji.fullName);

  final historyGrade = Grade.B;
  sanji.grades.add(historyGrade);

  final jessie = SchooldBandMember('Jessie', 'Jones');
  final marty = StudentAthlete('Marty', 'McFly');

  final students = [sanji, jessie, marty];
  print(jessie is Object);
  print(jessie is Person);
  print(jessie is Student);
  print(jessie is SchooldBandMember);
  print(jessie is! StudentAthlete);
}
