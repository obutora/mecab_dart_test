import 'package:flutter/material.dart';
import 'package:mecab_dart_test/mecab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Tokenizer.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
              home: const HomeScreen(),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String text =
        '''自分には、人間の生活というものが、見当つかないのです。自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。自分は停車場のブリッジを、上って、降りて、そうしてそれが線路をまたぎ越えるために造られたものだという事には全然気づかず、ただそれは停車場の構内を外国の遊戯場みたいに、複雑に楽しく、ハイカラにするためにのみ、設備せられてあるものだとばかり思っていました。しかも、かなり永い間そう思っていたのです。ブリッジの上ったり降りたりは、自分にはむしろ、ずいぶん垢抜あかぬけのした遊戯で、それは鉄道のサーヴィスの中でも、最も気のきいたサーヴィスの一つだと思っていたのですが、のちにそれはただ旅客が線路をまたぎ越えるための頗る実利的な階段に過ぎないのを発見して、にわかに興が覚めました。''';

    // var mecab = Mecab();
    // NOTE assetに自動で含まれるワケではないので、手動でとってくる
    // mecab.init('assets/ipadic', true);

    Tokenizer.parse(text);

    return const Scaffold(
      body: Center(
        child: Text('hello world'),
        // child: FutureBuilder(
        //     future: mecab.init('assets/ipadic', true),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         final List tokens = mecab.parse(text);

        //         // print(tokens.length);

        //         for (TokenNode element in tokens) {
        //           if (element.features.contains('名詞') &&
        //               !element.features.contains('非自立') &&
        //               !element.features.contains('代名詞') &&
        //               !element.features.contains('数') &&
        //               !element.features.contains('接尾')) {
        //             // print(element.features);
        //             print(element.surface);
        //           }
        //         }

        //         return const Text('done');
        //       } else {
        //         return const CircularProgressIndicator();
        //       }
        //     }),
      ),
    );
  }
}
