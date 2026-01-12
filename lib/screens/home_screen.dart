import 'package:flutter/material.dart';
import 'detail_screen.dart';
import '../models/word_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Data gốc
  final List<WordModel> allWords = [
    WordModel(kanji: "爸", pinyin: "bà", vietnamese: "Bố", type: "Danh từ", analysis: "Bộ Phụ chỉ ý.", memoryTip: "Cha cầm gậy.", examples: [ExampleModel(cn: "爸爸", pinyin: "bàba", vn: "Bố")]),
    WordModel(kanji: "妈", pinyin: "mā", vietnamese: "Mẹ", type: "Danh từ", analysis: "Bộ Nữ + Mã.", memoryTip: "Mẹ cưỡi ngựa.", examples: [ExampleModel(cn: "妈妈", pinyin: "māma", vn: "Mẹ")]),
    WordModel(kanji: "好", pinyin: "hǎo", vietnamese: "Tốt", type: "Tính từ", analysis: "Nữ + Tử.", memoryTip: "Mẹ có con là tốt.", examples: [ExampleModel(cn: "你好", pinyin: "nǐ hǎo", vn: "Chào bạn")]),
    WordModel(kanji: "学", pinyin: "xué", vietnamese: "Học", type: "Động từ", analysis: "Trẻ em dưới mái nhà.", memoryTip: "Đi học.", examples: [ExampleModel(cn: "学习", pinyin: "xuéxí", vn: "Học tập")]),
    WordModel(kanji: "书", pinyin: "shū", vietnamese: "Sách", type: "Danh từ", analysis: "Chồng giấy.", memoryTip: "Quyển sách.", examples: [ExampleModel(cn: "看书", pinyin: "kàn shū", vn: "Xem sách")]),
    WordModel(kanji: "大", pinyin: "dà", vietnamese: "Lớn", type: "Tính từ", analysis: "Người dang tay.", memoryTip: "To lớn.", examples: [ExampleModel(cn: "大人", pinyin: "dàrén", vn: "Người lớn")]),
    WordModel(kanji: "小", pinyin: "xiǎo", vietnamese: "Nhỏ", type: "Tính từ", analysis: "Ba nét nhỏ.", memoryTip: "Cát nhỏ.", examples: [ExampleModel(cn: "小猫", pinyin: "xiǎo māo", vn: "Mèo nhỏ")]),
    WordModel(kanji: "人", pinyin: "rén", vietnamese: "Người", type: "Danh từ", analysis: "Người đi.", memoryTip: "Đôi chân.", examples: [ExampleModel(cn: "好人", pinyin: "hǎorén", vn: "Người tốt")]),
    WordModel(kanji: "水", pinyin: "shuǐ", vietnamese: "Nước", type: "Danh từ", analysis: "Dòng nước.", memoryTip: "Nước chảy.", examples: [ExampleModel(cn: "喝水", pinyin: "hē shuǐ", vn: "Uống nước")]),
    WordModel(kanji: "火", pinyin: "huǒ", vietnamese: "Lửa", type: "Danh từ", analysis: "Ngọn lửa.", memoryTip: "Đống lửa.", examples: [ExampleModel(cn: "着火", pinyin: "zháohuǒ", vn: "Bị cháy")]),
  ];

  List<WordModel> displayedWords = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedWords = mockWords; // Mặc định hiện hết
  }

  void _runSearch(String query) {
    setState(() {
      displayedWords = allWords
          .where((w) => 
            w.kanji.contains(query) || 
            w.pinyin.toLowerCase().contains(query.toLowerCase()) ||
            w.vietnamese.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(decoration: const BoxDecoration(color: Color(0xFF1A1A1A))),
        title: const Text("NOKIA DICT V1", style: TextStyle(fontSize: 14, fontFamily: 'monospace')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchBox(),
          Expanded(
            child: ListView.builder(
              itemCount: displayedWords.length,
              itemBuilder: (context, index) => _buildFastTile(context, displayedWords[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF222222),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(0)),
        child: TextField(
          controller: _searchController,
          onChanged: _runSearch, // Tìm ngay khi gõ
          style: const TextStyle(color: Colors.black, fontSize: 13),
          decoration: const InputDecoration(
            hintText: "Gõ chữ hoặc pinyin...",
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.grey, size: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildFastTile(BuildContext context, WordModel word) {
    return ListTile(
      onTap: () {
        // Chuyển trang KHÔNG animation
        Navigator.push(context, PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => DetailScreen(word: word),
          transitionDuration: Duration.zero, // Tắt hoàn toàn transition
          reverseTransitionDuration: Duration.zero,
        ));
      },
      leading: Text(word.kanji, style: const TextStyle(fontSize: 22, color: Colors.white)),
      title: Text("${word.pinyin} - ${word.vietnamese}", style: const TextStyle(color: Colors.white70, fontSize: 13)),
      trailing: const Icon(Icons.keyboard_arrow_right, color: Color(0xFF0055FF), size: 16),
    );
  }
}
