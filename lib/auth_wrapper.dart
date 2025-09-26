
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelmate/screens/student/application_form_screen.dart';
import 'package:hostelmate/screens/student/student_profile_screen.dart';
import 'package:hostelmate/screens/teacher/teacher_dashboard_screen.dart';
import 'main.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          final user = snapshot.data!;
          final providerId = user.providerData.isNotEmpty ? user.providerData.first.providerId : '';

          if (providerId == 'password') {
            // User logged in with email/password -> Teacher
            return const TeacherDashboardScreen();
          } else if (providerId == 'phone') {
            // User logged in with a phone number -> Student
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection('students').doc(user.uid).get(),
              builder: (context, studentDocSnapshot) {
                if (studentDocSnapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(body: Center(child: CircularProgressIndicator()));
                }
                if (studentDocSnapshot.hasData && studentDocSnapshot.data!.exists) {
                  // Student has submitted the form, go to profile
                  return const StudentProfileScreen();
                } else {
                  // New student, go to application form
                  return const ApplicationFormScreen();
                }
              },
            );
          }
          // If the provider is unknown or user doc doesn't exist, send to the home page.
          return const HomePage();
        } else {
          // If the user is not logged in, show the home page.
          return const HomePage();
        }
      },
    );
  }
}
