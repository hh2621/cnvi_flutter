class ExampleModel {
  final String cn;
  final String pinyin;
  final String vn;
  ExampleModel({required this.cn, required this.pinyin, required this.vn});
}

class WordModel {
  final String kanji;
  final String pinyin;
  final String vietnamese;
  final String type;
  final String analysis;
  final String memoryTip;
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
