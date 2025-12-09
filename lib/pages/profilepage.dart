import 'package:flutter/material.dart';
import 'package:iiken/auth/auth_servers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  Future<void> _signOut() async {
    await authService.signOut();
  }

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = authService.getCurrentUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _signOut();
            },
          ),
        ],
      ),
      body: Center(child: Text('Welcome, $user')),
    );
  }
}
