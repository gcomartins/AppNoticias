import 'package:app_noticias/Widgets/bottombar_widget.dart';
import 'package:app_noticias/Widgets/scrollview_widget.dart';
import 'package:app_noticias/Widgets/stack_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../src/consts.dart';
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

  Future<String> _getTrendingPrincipal() async {
    response = await dio.get(Constantes.urlTrendingUS);

    final json = response?.data['articles'];

    _articles = json.map((e) => Article.fromJson(e)).toList();

    return 'OK';
  }

  Future<String> _getTrendingTech() async {
    response = await dio.get(Constantes.urlTrendingTech);

    final json = response?.data['articles'];

    _articles = json.map((e) => Article.fromJson(e)).toList();

    return 'OK';
  }

  Future<String> _getTrendingHealth() async {
    response = await dio.get(Constantes.urlTrendingHealth);

    final json = response?.data['articles'];

    _articles = json.map((e) => Article.fromJson(e)).toList();

    return 'OK';
  }

  Future<String> _getTrendingSports() async {
    response = await dio.get(Constantes.urlTrendingSports);

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
          StackWidget(articles: _articles, method: _getTrendingPrincipal()),
          const Categorias(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height / 15,
            child: Center(
              child: Text(
                "Breaking News",
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          ScrollViewWidget(
              articles: _articles, method: _getTrendingPrincipal()),
        ],
      ),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
