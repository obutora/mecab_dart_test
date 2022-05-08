import 'package:mecab_dart/mecab_dart.dart';

class Tokenizer {
  static var mecab = Mecab();
  static Future<void> init() async {
    await mecab.init('assets/ipadic', true);
  }

  //TODO : 用途に合わせて返却する値を設定する
  static void parse(String text) {
    final List tokens = mecab.parse(text);

    // print(tokens.length);

    for (TokenNode element in tokens) {
      if (element.features.contains('名詞') &&
          !element.features.contains('非自立') &&
          !element.features.contains('代名詞') &&
          !element.features.contains('数') &&
          !element.features.contains('接尾')) {
        // print(element.features);
        print(element.surface);
      }
    }
  }
}
