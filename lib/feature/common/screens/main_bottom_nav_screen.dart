import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:alwahda/feature/home/ui/screens/home_screen.dart';
import 'package:alwahda/feature/notification/screens/notification_screen.dart';
import 'package:alwahda/feature/profile/screens/profile_screen.dart';
import 'package:alwahda/feature/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static String name = '/MainBottomNav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12.5,
              backgroundColor:
                  _currentIndex == 3 ? Colors.black : Colors.transparent,
              child: CircleAvatar(
                radius: 10.5,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 9.5,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage: AssetImage(AssetsPath.avater),
                ),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
