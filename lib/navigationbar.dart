import 'package:flutter/material.dart';
import 'focuspage.dart';
import 'shoppingpage.dart';
import 'checklist.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FocusPage(title: 'BOBA FOCUS'), // Entry page
    ChecklistPage(title: 'BOBA FOCUS'),
    ShoppingPage(title: 'BOBA FOCUS'),
    ProfilePage(title: 'BOBA FOCUS'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_currentIndex < _pages.length && _currentIndex >= 0)
          ? _pages[_currentIndex]
          : Center(child: Text('Page not found')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.brown.withOpacity(0.6),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Focus',
            backgroundColor: const Color(0xFFF8EDEB),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Checklist',
            backgroundColor: const Color(0xFFF8EDEB),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
            backgroundColor: const Color(0xFFF8EDEB),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: const Color(0xFFF8EDEB),
          ),
        ],
      ),
    );
  }
}
