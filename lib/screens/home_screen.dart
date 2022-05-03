import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/history_screen.dart';
import 'package:zoom_clone/screens/meet_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [MeetingScreen(), HistoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Meet & Chat',
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: footerColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meeting'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ]),
      body: pages[pageIndex],
    );
  }
}
