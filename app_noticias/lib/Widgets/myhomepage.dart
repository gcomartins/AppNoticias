import 'package:app_noticias/Widgets/bottombar_widget.dart';
import 'package:app_noticias/Widgets/scrollview_widget.dart';
import 'package:app_noticias/Widgets/stack_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'article.dart';
import 'categorias.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _articles = [];

  Response? response;
  Dio dio = Dio();

  Future<String> _getNews() async {
    response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=br&apiKey=315271f2d01948be965d0823aa6ecce3");

    final json = response?.data['articles'];

    _articles = json.map((e) => Article.fromJson(e)).toList();

    return 'OK';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StackWidget(articles: _articles, method: _getNews()),
          const Categorias(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height / 15,
            child: const Center(
              child: Text(
                "Últimas notícias",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          ScrollViewWidget(articles: _articles, method: _getNews()),
        ],
      ),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
