import 'dart:async';

import 'package:flutter/material.dart';
import 'package:students_information/models/student.dart';
import 'package:students_information/services/student_storage.dart';

class MyInheritedWidget extends InheritedWidget {
  final StreamController<Student> currentStudent = StreamController<Student>();
  final StreamController<List<Student>> allStudentController =
      StreamController<List<Student>>();
  final StudentStorage _studentStorage = StudentStorage();

  MyInheritedWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget old) {
    return true;
  }

  void pushCurrentStudent(Student student) {
    currentStudent.add(student);
  }

  void pushAllStudents() async {
    _studentStorage.loadStudents();
    await Future<void>.delayed(const Duration(milliseconds: 2000));
    allStudentController.add(_studentStorage.getAllStudent());
  }
}
