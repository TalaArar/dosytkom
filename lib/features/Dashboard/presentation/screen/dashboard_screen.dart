import 'package:flutter/material.dart';
import 'package:dosytkom/features/DosyScreen/presentation/screen/dosy_screen.dart';
import 'package:dosytkom/features/Home/presentation/screen/home_screen.dart';
import 'package:dosytkom/features/SettingScreen/presentation/screen/setting_screen.dart';
import 'package:dosytkom/features/TalabatScreen/presentation/screen/talabat_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    TalabatScreen(),
    DosyScreen(),
    SettingScreen(),
  ];

  @override
Widget build(BuildContext context) {
  return Directionality( // ⬅️ أضفنا اتجاه RTL
    textDirection: TextDirection.rtl,
    child: Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      body: screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),           // index 0
          Icon(Icons.shopping_cart_outlined, color: Colors.white),  // index 1
          Icon(Icons.library_books_outlined, color: Colors.white),  // index 2
          Icon(Icons.settings_outlined, color: Colors.white),       // index 3
        ],
        index: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        color: const Color(0xFF12416F),
        buttonBackgroundColor: const Color(0xFF0E73B7),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
      ),
    ),
  );
}
}