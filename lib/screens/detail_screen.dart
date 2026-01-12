import 'package:flutter/material.dart';
import '../models/word_model.dart';

class DetailScreen extends StatelessWidget {
  final WordModel word;
  const DetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    const Color nokiaBlue = Color(0xFF0055FF);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF444444), Color(0xFF000000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text(word.kanji, style: const TextStyle(fontSize: 16, fontFamily: 'monospace')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. KHU VỰC VIẾT CHỮ
            _nokiaSection("CÁCH VIẾT", 
              Container(
                height: 160, width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: nokiaBlue, width: 3),
                ),
                child: Center(child: Text(word.kanji, style: const TextStyle(fontSize: 110, color: Colors.black))),
              )
            ),

            // 2. NHÓM THÔNG TIN CHÍNH
            _nokiaSection("THÔNG TIN", 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _infoItem("GIẢN", word.kanji),
                  _infoItem("PHỒN", word.kanji),
                  _infoItem("HÁN VIỆT", "PHỤ"),
                  IconButton(icon: const Icon(Icons.volume_up, color: nokiaBlue), onPressed: () {}),
                ],
              )
            ),

            // 3. CẤU TẠO BỘ THỦ
            _nokiaSection("BỘ THỦ", 
              Row(
                children: [
                  _radicalTag("父", "PHỤ"),
                  const SizedBox(width: 10),
                  _radicalTag("巴", "BA"),
                ],
              )
            ),

            // 4. AI GIẢI THÍCH
            _nokiaSection("AI_EXPLAIN", 
              Text(word.analysis, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4))
            ),

            // 5. NGHĨA & VÍ DỤ
            _nokiaSection("NGHĨA & VÍ DỤ", 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(word.vietnamese.toUpperCase(), style: const TextStyle(color: nokiaBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                  const Divider(color: Colors.white10),
                  ...word.examples.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.play_circle_fill, size: 14, color: Colors.white30),
                        const SizedBox(width: 8),
                        Expanded(child: Text("${e.cn}: ${e.vn}", style: const TextStyle(color: Colors.white60, fontSize: 13))),
                      ],
                    ),
                  )),
                ],
              )
            ),

            // 6. HÌNH ẢNH
            _nokiaSection("ẢNH MINH HỌA", 
              Image.network("https://picsum.photos/seed/word/400/200", fit: BoxFit.cover)
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _nokiaSection(String title, Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            color: const Color(0xFF333333),
            child: Text(title, style: const TextStyle(fontSize: 10, color: Colors.white54, fontWeight: FontWeight.bold)),
          ),
          Padding(padding: const EdgeInsets.all(12), child: Center(child: child)),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String val) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white24, fontSize: 9)),
        Text(val, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _radicalTag(String c, String n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Text(c, style: const TextStyle(color: Colors.orangeAccent, fontSize: 16)),
          const SizedBox(width: 4),
          Text(n, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      ),
    );
  }
}
