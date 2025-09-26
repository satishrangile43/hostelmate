
import 'package:flutter/material.dart';
import 'screens/student/login_screen.dart';
import 'screens/teacher/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HostelMate',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPortalCard(
                  context,
                  title: 'Student Portal',
                  buttonText: 'Student Login',
                  color: const Color(0xFF8B5CF6),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudentLoginScreen()),
                    );
                  },
                ),
                const SizedBox(width: 40),
                _buildPortalCard(
                  context,
                  title: 'Teacher Portal',
                  buttonText: 'Teacher Login',
                  color: const Color(0xFF00FFFF),
                  onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const TeacherLoginScreen()),
                     );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortalCard(BuildContext context, {required String title, required String buttonText, required Color color, required VoidCallback onPressed}) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: color.withOpacity(0.7), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: onPressed,
            child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
