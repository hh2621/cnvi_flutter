import 'package:flutter/material.dart';

class FlashcardScreen extends StatelessWidget {
  const FlashcardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("TRAINING_MODULE_01", style: TextStyle(fontFamily: 'Courier', color: Colors.grey)),
          const SizedBox(height: 30),
          // Thẻ Flashcard khổng lồ
          Center(
            child: Container(
              width: 300, height: 400,
              decoration: BoxDecoration(
                color: const Color(0xFF151515),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.5), width: 2),
                boxShadow: [BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 20)],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("爸爸", style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("[ TAP_TO_FLIP ]", style: TextStyle(fontFamily: 'Courier', color: Colors.white24, fontSize: 10)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          // Nút bấm Feedback
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _statusBtn("FORGOT", Colors.redAccent),
              _statusBtn("REMEMBER", Colors.greenAccent),
            ],
          )
        ],
      ),
    );
  }

  Widget _statusBtn(String label, Color col) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(side: BorderSide(color: col), foregroundColor: col),
      onPressed: () {},
      child: Text(label, style: const TextStyle(fontFamily: 'Courier')),
    );
  }
}
