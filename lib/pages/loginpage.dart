import 'package:flutter/material.dart';
import 'package:iiken/auth/auth_servers.dart';
import 'package:iiken/pages/registrationpage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final authService = AuthService();

  void login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      await authService.signInWithEmailPassword(email, password);
      // Navigate to home page after success
    } on AuthApiException catch (e) {
      if (e.code == 'email_not_confirmed') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please verify your email before logging in'),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: ${e.message}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: login, child: const Text('Login')),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationPage(),
                ),
              );
            },
            child: Center(child: Text("Don't have an account? Sign up")),
          ),
        ],
      ),
    );
  }
}
