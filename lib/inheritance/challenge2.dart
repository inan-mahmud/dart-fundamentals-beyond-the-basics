// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Roles {
  athelete,
  bandMember,
  studentUnionMember,
}

class Person {
  final String name;

  Person(this.name);
}

class Student extends Person {
  List<Roles>? roles;

  Student(this.roles, super.name);
}

void main() {
  final aStudent = Student([Roles.bandMember, Roles.athelete], 'John');
  final bStudent = Student([Roles.studentUnionMember, Roles.athelete], 'Kenny');
}
