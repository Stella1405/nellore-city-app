import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'blogs_screen.dart';
import 'restaurant_screen.dart';
import 'city_info_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    BlogsScreen(),
    ServicesScreen(),
    RestaurantsScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFFC107), // yellow
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Blogs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: "City Info",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: "Restaurant",
        ),
        ],
      ),
    );
  }
}