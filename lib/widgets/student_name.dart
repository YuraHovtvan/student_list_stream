import 'package:flutter/material.dart';
import 'package:students_information/models/student.dart';
import 'package:students_information/widgets/myinheritedwidget.dart';

class StudentName extends StatefulWidget {
  const StudentName({Key? key}) : super(key: key);

  @override
  _StudentNameState createState() => _StudentNameState();
}

class _StudentNameState extends State<StudentName> {
  @override
  Widget build(BuildContext context) {
    context
        .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
        ?.pushAllStudents();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: StreamBuilder<List<Student>>(
        stream: context
            .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
            ?.allStudentController
            .stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Student>? studentList = snapshot.data;
            return ListView.builder(
              itemCount: studentList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text(
                        '${studentList[index].name} ${studentList[index].surname}'),
                  ),
                  onTap: () {
                    context
                        .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
                        ?.pushCurrentStudent(studentList[index]);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
