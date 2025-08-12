import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'focuspage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EDEB), // soft cream
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8EDEB),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF6D4C41), // deep coffee brown
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/hero-cafe.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              'WELCOME TO BOBA FOCUS',
              style: GoogleFonts.merriweather(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4E342E),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Your cozy productivity companion.\nSip your drink, focus on your goals, and earn sweet rewards!',
                style: GoogleFonts.openSans(
                  fontSize: 18.0,
                  color: const Color(0xFF5D4037),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FocusPage(title: 'BOBA FOCUS'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8D6E63), // latte brown
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: const Color(0xFF4E342E),
                elevation: 5,
              ),
              child: Text(
                "☕ Start Focus",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
