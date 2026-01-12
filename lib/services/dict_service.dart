import '../models/word_model.dart';

class DictionaryService {
  static final List<WordModel> _data = [
    WordModel(
      kanji: "爸",
      pinyin: "bà",
      vietnamese: "Bố, cha",
      type: "n",
      analysis: "Bộ '父' (fù - cha) ở trên và chữ '巴' (bā - bám víu) ở dưới.",
      memoryTip: "Đứa trẻ bám víu (巴) lấy cha (父).",
      examples: [
        ExampleModel("我爸喜欢喝茶。", "wǒ bà xǐhuān hē chá.", "Cha tôi thích uống trà."),
        ExampleModel("爸在厨房做饭。", "bà zài chúfáng zuò fàn.", "Bố đang nấu ăn trong bếp."),
      ],
    ),
    WordModel(
      kanji: "学",
      pinyin: "xué",
      vietnamese: "Học, bắt chước",
      type: "v",
      analysis: "Phía trên là tổ chim, phía dưới là đứa trẻ (tử) đang học.",
      memoryTip: "Đứa trẻ ngồi học dưới mái nhà.",
      examples: [
        ExampleModel("我学习汉语。", "wǒ xuéxí hànyǔ.", "Tôi học tiếng Hán."),
      ],
    ),
  ];

  static List<WordModel> search(String q) {
    return _data.where((w) => w.kanji.contains(q) || w.pinyin.contains(q)).toList();
  }
}
