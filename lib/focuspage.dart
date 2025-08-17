import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key, required this.title});
  final String title;

  @override
  State<FocusPage> createState() => _MyFocusPageState();
}

class _MyFocusPageState extends State<FocusPage> {
  static const maxMinutes = 2;
  int seconds = maxMinutes * 60;
  Timer? timer;

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void starttimer() {
    if (timer != null && timer!.isActive) return;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EDEB),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage('assets/bean-icon-removebg-preview.png'),
            width: 100,
            height: 100,
          ),

          Center(child: buildTimer()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: starttimer,
                color: const Color.fromARGB(255, 212, 164, 150),
                child: Text('START BREWING'),
              ),
              MaterialButton(
                onPressed: () {},
                color: const Color.fromARGB(255, 212, 164, 150),
                child: Text('STOP BREWING'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTimer() => SizedBox(
    width: 200,
    height: 200,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: seconds / (maxMinutes * 60),
          strokeWidth: 8,
          backgroundColor: Colors.brown.shade100,
          valueColor: AlwaysStoppedAnimation<Color>(
            Color.fromARGB(255, 157, 128, 119),
          ),
        ),
        Center(child: buildTime()),
      ],
    ),
  );
  Widget buildTime() {
    return Text(
      formatTime(seconds),
      style: GoogleFonts.playfairDisplay(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF6D4C41),
      ),
    );
  }
}
