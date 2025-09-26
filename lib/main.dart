import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Firebase Core पैकेज को इम्पोर्ट करें।
import 'package:firebase_core/firebase_core.dart';
// FlutterFire द्वारा उत्पन्न कॉन्फ़िगरेशन फ़ाइल को इम्पोर्ट करें।
import 'firebase_options.dart';
// // FlutterFire द्वारा उत्पन्न कॉन्फ़िगरेशन फ़ाइल को इम्पोर्ट करें।
// import 'firebase_options.dart';
import 'screens/student/login_screen.dart';
import 'screens/teacher/login_screen.dart';

// main function को async बनाएँ और Firebase को इनिशियलाइज़ करें।
void main() async {
  // सुनिश्चित करें कि Flutter बाइंडिंग इनिशियलाइज़ हो गई है।
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase को शुरू करें।
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // // Firebase को शुरू करें।
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const HostelMateApp());
}

// यह ऐप का रूट विजेट है।
class HostelMateApp extends StatelessWidget {
  const HostelMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HostelMate',
      debugShowCheckedModeBanner: false,
      // ऐप की थीम आपके स्पेसिफिकेशन के अनुसार सेट की गई है।
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF09090b), // बहुत गहरा ग्रे बैकग्राउंड
        primaryColor: const Color(0xFF8b5cf6), // गहरा बैंगनी (Student Portal)
        // ColorScheme को नवीनतम Flutter मानकों के अनुसार अपडेट किया गया है।
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8b5cf6),
          secondary: Color(0xFF00ffff), // गहरा सियान/टील (Teacher Portal)
          surface: Color(0xFF1a1a1a), // कार्ड/पैनल का रंग
        ),
        // ऐप के लिए कस्टम फ़ॉन्ट्स सेट किए गए हैं।
        textTheme: GoogleFonts.exo2TextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      // ऐप का पहला पेज होमपेज होगा।
      home: const HomePage(),
    );
  }
}

// होमपेज विजेट, जहाँ उपयोगकर्ता अपनी भूमिका चुनता है।
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineStyle = GoogleFonts.orbitron(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ऐप का शीर्षक
              Text(
                'HostelMate',
                style: headlineStyle,
              ),
              const SizedBox(height: 12),
              Text(
                'आधुनिक हॉस्टल प्रबंधन प्रणाली',
                style: GoogleFonts.exo2(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 60),
              // दो पोर्टल के लिए विकल्प
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // छात्र पोर्टल कार्ड
                  Expanded(
                    child: PortalCard(
                      title: 'Student Portal',
                      buttonText: 'Student Login',
                      icon: Icons.school,
                      primaryColor: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const StudentLoginScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  // शिक्षक पोर्टल कार्ड
                  Expanded(
                    child: PortalCard(
                      title: 'Teacher Portal',
                      buttonText: 'Teacher Login',
                      icon: Icons.admin_panel_settings,
                      primaryColor: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TeacherLoginScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// एक पुनः प्रयोज्य कार्ड विजेट जो पोर्टल विकल्प प्रदर्शित करता है।
class PortalCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final IconData icon;
  final Color primaryColor;
  final VoidCallback onPressed;

  const PortalCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.icon,
    required this.primaryColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        // आपके स्पेसिफिकेशन के अनुसार "ग्लो बॉर्डर" प्रभाव।
        boxShadow: [
          BoxShadow(
            color: primaryColor.withAlpha((255 * 0.3).round()),
            blurRadius: 15,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: primaryColor.withAlpha((255 * 0.1).round()),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
        border: Border.all(color: primaryColor.withAlpha((255 * 0.5).round()), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: primaryColor),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.orbitron(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          // लॉगिन बटन
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shadowColor: primaryColor,
              elevation: 8,
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
