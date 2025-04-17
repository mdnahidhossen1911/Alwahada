import 'package:alwahda/feature/home/screens/home_screen.dart';
import 'package:alwahda/feature/profile/screens/profile_screen.dart';
import 'package:alwahda/feature/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

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
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
      body: IndexedStack(index: _currentIndex, children: _screens),
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
              radius: 13.5,
              backgroundColor:
                  _currentIndex == 3 ? Colors.black : Colors.transparent,
              child: CircleAvatar(
                radius: 11.5,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 10.5,
                  backgroundImage: NetworkImage(
                    'https://scontent.fbzl5-1.fna.fbcdn.net/v/t39.30808-6/488259833_122221468874074736_6951742490121162663_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=4TWTN7ofNQsQ7kNvwGWV08C&_nc_oc=AdlQ9qlZ9rjPBWWrFMvjcMn14hdWE7iWLZXTWLYQaPK-iGX-_bxfK-Qq295s8ZmE5rs&_nc_zt=23&_nc_ht=scontent.fbzl5-1.fna&_nc_gid=3KzZxDxJCX42nwzaf5QbNw&oh=00_AfHRmsd8pQ0ObWGrfsI43ED4Z09nIToFS3FyFYVYrELGJg&oe=68052B2B',
                  ),
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
