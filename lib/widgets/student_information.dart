import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:students_information/models/student.dart';
import 'package:students_information/widgets/myinheritedwidget.dart';

class StudentInformation extends StatefulWidget {
  const StudentInformation({Key? key}) : super(key: key);

  @override
  _StudentInformationState createState() => _StudentInformationState();
}

class _StudentInformationState extends State<StudentInformation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: StreamBuilder<Student>(
        stream: context
            .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
            ?.currentStudent
            .stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Choose a student'));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Name: ${snapshot.data?.name}"),
                Text("Surname: ${snapshot.data?.surname}"),
                Text("Group: ${snapshot.data?.group}"),
                Text("Year of Birth: ${snapshot.data?.birthYear}"),
              ],
            );
          }
        },
      ),
    );
  }
}
