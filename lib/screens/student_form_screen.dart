import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student.dart';
import '../providers/enrollment_provider.dart';

class StudentFormScreen extends StatefulWidget {
  @override
  _StudentFormScreenState createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String studentID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) => value!.isEmpty ? 'Enter first name' : null,
                onSaved: (value) => firstName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) => value!.isEmpty ? 'Enter last name' : null,
                onSaved: (value) => lastName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) return 'Enter email';
                  if (!value.contains('@')) return 'Enter valid email';
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Student ID'),
                validator: (value) => value!.isEmpty ? 'Enter student ID' : null,
                onSaved: (value) => studentID = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<EnrollmentProvider>(context, listen: false)
                        .setStudent(Student(
                      firstName: firstName,
                      lastName: lastName,
                      email: email,
                      studentID: studentID,
                    ));
                    Navigator.pushNamed(context, '/courseSelection');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
