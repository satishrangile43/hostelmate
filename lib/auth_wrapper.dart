import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmate/screens/teacher/teacher_dashboard_screen.dart';
import 'main.dart'; // HomePage के लिए

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // अगर कनेक्शन की स्थिति प्रतीक्षा में है
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // अगर उपयोगकर्ता लॉग इन है
        if (snapshot.hasData) {
          // तो उसे सीधे टीचर डैशबोर्ड पर भेजें
          return const TeacherDashboardScreen();
        }

        // अगर उपयोगकर्ता लॉग इन नहीं है
        // तो उसे मुख्य होम पेज (पोर्टल चयन) पर भेजें
        return const HomePage();
      },
    );
  }
}
