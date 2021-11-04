import 'dart:math';

import 'package:students_information/models/student.dart';

class StudentStorage {
  late List<Student> _studentsList;

  void loadStudents() {
    final Random _random = Random();
    final List _names = [
      'Carl',
      'Sophia',
      'Steven',
      'Bogdan',
      'Lubov',
      'Nastya'
    ];
    final List _surnames = [
      'Hovtvan',
      'Garmash',
      'Listopad',
      'Petriv',
      'Zinchenko',
      'Saglaev'
    ];
    _studentsList = List.generate(
      40,
      (index) {
        return Student(
            name: _names[_random.nextInt(6)],
            surname: _surnames[_random.nextInt(6)],
            group: 'KI-21',
            birthYear: 2000 + _random.nextInt(2));
      },
    );
  }

  List<Student> getAllStudent() {
    return _studentsList;
  }
}
