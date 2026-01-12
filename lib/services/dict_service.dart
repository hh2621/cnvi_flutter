import '../models/word_model.dart';

class DictService {
  static List<WordModel> getMockWords() {
    return [
      WordModel(
        kanji: "爸",
        pinyin: "bà",
        vietnamese: "Bố",
        type: "Danh từ",
        analysis: "Bộ Phụ chỉ ý.",
        memoryTip: "Cha cầm gậy.",
        examples: [
          ExampleModel(cn: "爸爸", pinyin: "bàba", vn: "Bố"),
        ],
      ),
    ];
  }
}
