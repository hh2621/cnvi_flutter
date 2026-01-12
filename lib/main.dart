import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/flashcard_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const ChineseApp());
}

class ChineseApp extends StatelessWidget {
  const ChineseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505),
        fontFamily: 'Roboto', // Font nội dung
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Danh sách các trang con
  final List<Widget> _screens = [
    const HomeScreen(),
    const FlashcardScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF333333), width: 1.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: const Color(0xFF111111),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          selectedLabelStyle: const TextStyle(fontFamily: 'Courier', fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Courier', fontSize: 10),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.terminal, size: 20),
              label: 'DATABASE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bolt, size: 20),
              label: 'TRAINING',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 20),
              label: 'USER_ID',
            ),
          ],
        ),
      ),
    );
  }
}
