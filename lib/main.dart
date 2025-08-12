import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 228, 178, 160),
        textTheme: TextTheme(
          // Headers – handwritten style
          headlineLarge: GoogleFonts.patrickHand(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.amaticSc(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),

          // Body – sans-serif
          bodyLarge: GoogleFonts.openSans(fontSize: 16),
          bodyMedium: GoogleFonts.openSans(fontSize: 16),
        ),
      ),
      home: const MyHomePage(title: 'BOBA FOCUS'),
    );
  }
}
