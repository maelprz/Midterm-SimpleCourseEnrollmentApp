import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/enrollment_provider.dart';

class EnrollmentReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final enrollment = Provider.of<EnrollmentProvider>(context);
    final student = enrollment.student;
    final course = enrollment.selectedCourse;

    if (student == null || course == null) {
      return Scaffold(
        body: Center(child: Text('No data found.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Review Enrollment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Student Info:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Name: ${student.firstName} ${student.lastName}'),
            Text('Email: ${student.email}'),
            Text('Student ID: ${student.studentID}'),
            SizedBox(height: 20),
            Text('Selected Course:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${course.name} - ${course.credits} credits'),
            Text('Instructor: ${course.instructor}'),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text('Confirm Enrollment'),
              onPressed: () {
                enrollment.clearEnrollment();
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Enrollment Successful!'),
                    content: Text('You have been enrolled successfully.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/studentForm', (route) => false);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
