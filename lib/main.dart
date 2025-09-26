import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HostelMateApp());
}

class HostelMateApp extends StatelessWidget {
  const HostelMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HostelMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF09090b),
        primaryColor: const Color(0xFF8b5cf6),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8b5cf6),
          secondary: Color(0xFF00ffff),
          surface: Color(0xFF1a1a1a),
        ),
        fontFamily: 'Exo2',
      ),
      home: const HomeScreen(),
    );
  }
}
