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
  static const maxMinutes = 25;
  int seconds = maxMinutes * 60;
  Timer? timer;
  int remainingSecs = 0;
  bool isrunning = true;
  bool pressedonce = false;

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  Future<bool?> confirmstop() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 195, 168, 158),
          title: Text(
            'Are you sure you want to stop brewing?',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> stoptimer() async {
    bool? stopornot = await confirmstop();

    if (stopornot == true && stopornot != null) {
      timer?.cancel();
      setState(() {
        isrunning = false;
        seconds = maxMinutes * 60;
      });
    }
  }

  void starttimer() {
    if (isrunning) {
      // Pause the timer
      timer?.cancel();
      setState(() {
        isrunning = false;
      });
    } else {
      // Start or resume the timer
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(() {
          if (seconds > 0) {
            seconds--;
          } else {
            timer?.cancel();
            isrunning = false;
          }
        });
      });
      setState(() {
        isrunning = true;
      });
    }
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
                onPressed: () {
                  starttimer();
                },
                color: const Color.fromARGB(255, 212, 164, 150),
                child: Text(isrunning ? 'PAUSE BREWING' : 'START BREWING'),
              ),
              MaterialButton(
                onPressed: () async {
                  stoptimer();
                },
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
          value: 1 - (seconds / (maxMinutes * 60)),
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
