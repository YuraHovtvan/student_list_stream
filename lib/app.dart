import 'package:flutter/material.dart';
import 'package:students_information/widgets/myinheritedwidget.dart';
import 'package:students_information/widgets/student_information.dart';
import 'package:students_information/widgets/student_name.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Students'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: MyInheritedWidget(
            child: Column(
              children: [
                StudentInformation(),
                StudentName(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
