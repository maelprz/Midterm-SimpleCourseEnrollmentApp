import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/student_form_screen.dart';
import 'screens/course_selection_screen.dart';
import 'screens/enrollment_review_screen.dart';
import 'providers/enrollment_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EnrollmentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Enrollment App',
      initialRoute: '/studentForm',
      routes: {
        '/studentForm': (_) => StudentFormScreen(),
        '/courseSelection': (_) => CourseSelectionScreen(),
        '/enrollmentReview': (_) => EnrollmentReviewScreen(),
      },
    );
  }
}
