import 'package:flutter/material.dart';
import '../services/dict_service.dart';
import '../models/word_model.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<WordModel> _results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Nhập từ cần tìm...", border: InputBorder.none),
          onChanged: (v) => setState(() => _results = DictionaryService.search(v)),
        ),
      ),
      body: ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, i) {
          final word = _results[i];
          return ListTile(
            leading: Text(word.kanji, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent)),
            title: Text("${word.pinyin} [${word.type}]"),
            subtitle: Text(word.vietnamese),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(word: word))),
          );
        },
      ),
    );
  }
}
