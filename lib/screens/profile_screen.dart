import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("USER_ID: SYSTEM_ADMIN", style: TextStyle(fontFamily: 'Courier', color: Colors.greenAccent, fontSize: 16)),
              const SizedBox(height: 20),
              // Grid thống kê
              _buildStatPanel("TOTAL_WORDS", "1,240"),
              const SizedBox(height: 10),
              _buildStatPanel("MASTERY_RATE", "85%"),
              const SizedBox(height: 10),
              _buildStatPanel("STREAK_DAYS", "12"),
              const Spacer(),
              // Nút Logout/Config
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.redAccent.withOpacity(0.1),
                child: const Center(child: Text("TERMINATE_SESSION", style: TextStyle(color: Colors.redAccent, fontFamily: 'Courier'))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatPanel(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10, fontFamily: 'Courier')),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
