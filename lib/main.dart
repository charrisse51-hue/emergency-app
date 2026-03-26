import 'package:flutter/material.dart';

import '../Frontend/Mobile/lib/screens/home/login_screen.dart';

void main() {
  runApp(const EmergencyApp());
}

class EmergencyApp extends StatelessWidget {
  const EmergencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmergencyLink',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      ),
      home: const LoginPage(),
    );
  }
}