import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/app_bar.dart';
import '../components/text_input.dart';
import '../components/elevated_button.dart';
import 'create_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (_emailController.text == savedEmail &&
        _passwordController.text == savedPassword) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _showAlert('Invalid Credentials', 'The e-mail or password is incorrect');
    }
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page', style: TextStyle(color: Colors.black)),
            const SizedBox(height: 16.0),
            TextInput(
              placeholder: 'E-mail',
              controller: _emailController,
            ),
            const SizedBox(height: 8.0),
            TextInput(
              placeholder: 'Password',
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 16.0),
            CustomElevatedButton(
              text: 'Login',
              onPressed: _login,
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAccount()),
                );
              },
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'New here? ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'Create an account.',
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
