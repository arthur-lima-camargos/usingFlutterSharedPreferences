import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/bottom_navigation_bar.dart';
import 'screens/login_page.dart';
import 'screens/home.dart';
import 'screens/list_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationChecker(),
      routes: {
        '/home': (context) => const MainScreen(),
      },
    );
  }
}

class AuthenticationChecker extends StatefulWidget {
  const AuthenticationChecker({super.key});

  @override
  State<AuthenticationChecker> createState() => _AuthenticationCheckerState();
}

class _AuthenticationCheckerState extends State<AuthenticationChecker> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    setState(() {
      _isLoggedIn = savedEmail != null && savedPassword != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return const LoginPage();
    } else {
      return const LoginPage();
    }
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomePage(),
    ListPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
