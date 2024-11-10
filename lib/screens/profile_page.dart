import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = '';
  String _userEmail = '';
  bool _useGreenText = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadGreenTextPreference();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? 'User';
      _userEmail = prefs.getString('email') ?? 'email@example.com';
    });
  }

  Future<void> _loadGreenTextPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _useGreenText = prefs.getBool('useGreenText') ?? false;
    });
  }

  Future<void> _saveGreenTextPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('useGreenText', _useGreenText);
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = _useGreenText ? Colors.green : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Profile Page', style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $_userName',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'E-mail: $_userEmail',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: _useGreenText,
                  onChanged: (value) {
                    setState(() {
                      _useGreenText = value;
                      _saveGreenTextPreference();
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Mude a cor das strings dessa tela',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
