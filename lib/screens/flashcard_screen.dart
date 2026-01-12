import 'package:flutter/material.dart';

class FlashcardScreen extends StatelessWidget {
  const FlashcardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 280, height: 380,
          decoration: BoxDecoration(
            color: const Color(0xFF151515),
            border: Border.all(color: const Color(0xFF0055FF).withValues(alpha: 0.5)),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("爸", style: TextStyle(fontSize: 80, color: Colors.white)),
              SizedBox(height: 20),
              Text("[ CHẠM ĐỂ LẬT ]", style: TextStyle(color: Colors.white24, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
