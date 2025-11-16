import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/enrollment_provider.dart';

class CourseSelectionScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(id: 'C1', name: 'Math', credits: 3, instructor: 'Maam Miro'),
    Course(id: 'C2', name: 'English', credits: 3, instructor: 'Ms. Sevilla'),
    Course(id: 'C3', name: 'Mob Dev', credits: 4, instructor: 'Mr. Formentera'),
    Course(id: 'C4', name: 'Science', credits: 3, instructor: 'Sir Perez'),
    Course(id: 'C5', name: 'Filipino', credits: 3, instructor: 'Ms. Holiday'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select a Course')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.name),
            subtitle: Text('${course.credits} credits - ${course.instructor}'),
            onTap: () {
              Provider.of<EnrollmentProvider>(context, listen: false)
                  .setCourse(course);
              Navigator.pushNamed(context, '/enrollmentReview');
            },
          );
        },
      ),
    );
  }
}
