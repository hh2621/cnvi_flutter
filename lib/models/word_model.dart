class ExampleModel {
  final String cn, pinyin, vn;
  ExampleModel({required this.cn, required this.pinyin, required this.vn});
}

class WordModel {
  final String kanji, pinyin, vietnamese, type, analysis, memoryTip;
  final List<ExampleModel> examples;

  WordModel({
    required this.kanji,
    required this.pinyin,
    required this.vietnamese,
    required this.type,
    required this.analysis,
    required this.memoryTip,
    required this.examples,
  });
}

// Dữ liệu mẫu
final List<WordModel> mockWords = [
  WordModel(
    kanji: "爸爸",
    pinyin: "bàba",
    vietnamese: "Bố, Cha",
    type: "Danh từ",
    analysis: "Gồm bộ Phụ (父) chỉ người cha và chữ Ba (巴) chỉ âm đọc.",
    memoryTip: "Người cha vác bao tải (巴) nặng trên vai.",
    examples: [
      ExampleModel(cn: "我爸爸是老师。", pinyin: "Wǒ bàba shì lǎoshī.", vn: "Bố tôi là giáo viên."),
    ],
  ),
  WordModel(
    kanji: "好",
    pinyin: "hǎo",
    vietnamese: "Tốt, ngon, đẹp",
    type: "Tính từ",
    analysis: "Gồm bộ Nữ (女) và bộ Tử (子).",
    memoryTip: "Người phụ nữ có con trai là điều tốt lành.",
    examples: [
      ExampleModel(cn: "你好吗？", pinyin: "Nǐ hǎo ma?", vn: "Bạn khỏe không?"),
    ],
  ),
];
