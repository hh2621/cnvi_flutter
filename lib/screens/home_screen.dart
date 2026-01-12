import 'package:flutter/material.dart';
import 'detail_screen.dart';
import '../models/word_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<WordModel> _allWords = [
    WordModel(
      kanji: "爸", pinyin: "bà", vietnamese: "Bố", type: "Danh từ",
      analysis: "Bộ Phụ chỉ ý.", memoryTip: "Cha cầm gậy.",
      examples: [ExampleModel(cn: "爸爸", pinyin: "bàba", vn: "Bố")]
    ),
    WordModel(
      kanji: "妈", pinyin: "mā", vietnamese: "Mẹ", type: "Danh từ",
      analysis: "Bộ Nữ chỉ ý.", memoryTip: "Người phụ nữ.",
      examples: [ExampleModel(cn: "妈妈", pinyin: "māma", vn: "Mẹ")]
    ),
  ];

  List<WordModel> _foundWords = [];

  @override
  void initState() {
    _foundWords = _allWords;
    super.initState();
  }

  void _search(String k) {
    setState(() {
      _foundWords = _allWords.where((w) => w.kanji.contains(k) || w.pinyin.contains(k)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: const Color(0xFF1A1A1A), title: const Text("NOKIA DARK 2008")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xFF222222),
            child: TextField(
              onChanged: _search,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(fillColor: Colors.white, filled: true, hintText: "Tìm kiếm..."),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _foundWords.length,
              itemBuilder: (c, i) => ListTile(
                onTap: () => Navigator.push(c, PageRouteBuilder(pageBuilder: (c, a1, a2) => DetailScreen(word: _foundWords[i]))),
                title: Text(_foundWords[i].kanji, style: const TextStyle(color: Colors.white)),
                subtitle: Text(_foundWords[i].pinyin, style: const TextStyle(color: Colors.grey)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
