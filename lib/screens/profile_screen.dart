import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.red.withValues(alpha: 0.1),
          child: const Text("USER_ID: ADMIN_2008", style: TextStyle(color: Colors.red)),
        ),
      ),
    );
  }
}
