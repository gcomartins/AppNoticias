import 'dart:convert';

import 'package:app_noticias/Widgets/parte_inicial.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'article.dart';
import 'article.dart';
import 'categorias.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _articles = [];
  String _imagemInicial = '';
  String _tituloInicial = '';
  String _noticia1 = '';
  String _imagem1 = '';
  String _noticia2 = '';
  String _imagem2 = '';
  String _noticia3 = '';
  String _imagem3 = '';
  String _noticia4 = '';
  String _imagem4 = '';

  Response? response;
  Dio dio = Dio();

  Future<String> _getNews() async {
    response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=br&apiKey=315271f2d01948be965d0823aa6ecce3");

    final json = response?.data['articles'];

    _articles = json.map((e) => Article.fromJson(e)).toList();

    _imagemInicial = response?.data['articles'][0]["urlToImage"] ??
        'https://images.pexels.com/photos/159652/table-food-book-newspaper-159652.jpeg?cs=srgb&dl=pexels-pixabay-159652.jpg&fm=jpg';
    _tituloInicial = response?.data['articles'][0]["title"] ?? '';

    _imagem1 = response?.data['articles'][1]["urlToImage"] ?? '';
    _noticia1 = response?.data['articles'][1]["title"];

    _imagem2 = response?.data['articles'][2]["urlToImage"] ?? '';
    _noticia2 = response?.data['articles'][2]["title"];

    _imagem3 = response?.data['articles'][3]["urlToImage"] ?? '';
    _noticia3 = response?.data['articles'][3]["title"];

    _imagem4 = response?.data['articles'][4]["urlToImage"] ?? '';
    _noticia4 = response?.data['articles'][4]["title"];

    return 'OK';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Pesquisar',
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF000000),
                ),
                child: FutureBuilder<String>(
                  future: _getNews(),
                  builder: ((context, snapshot) => Visibility(
                        visible: snapshot.hasData,
                        child: FittedBox(
                          clipBehavior: Clip.hardEdge,
                          fit: BoxFit.cover,
                          child: Image.network(
                            // _imagemInicial,
                            _articles[0].urlToImage,
                          ),
                        ),
                      )),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 80,
                  horizontal: 10,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: AlignmentGeometry.lerp(
                              Alignment.center, Alignment.center, 0),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            shape: BoxShape.rectangle,
                            borderRadius: (BorderRadius.circular(100)),
                          ),
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 30,
                          child: const Text(
                            "Notícia do Dia",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        child: FutureBuilder(
                          future: _getNews(),
                          builder: ((context, snapshot) => Visibility(
                                visible: snapshot.hasData,
                                child: Text(
                                  // _tituloInicial,
                                  _articles[0].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                        child: Text(
                          "Leia mais ->",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Categorias(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Center(
              child: Text(
                "Últimas notícias",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 8,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1,
                              height: MediaQuery.of(context).size.height / 4,
                              child: FittedBox(
                                clipBehavior: Clip.hardEdge,
                                fit: BoxFit.cover,
                                child: FutureBuilder<String>(
                                  future: _getNews(),
                                  builder: (context, snapshot) => Visibility(
                                    visible: snapshot.hasData,
                                    child: Image.network(
                                      _articles[index + 1].urlToImage,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child:
                            Flexible(
                              child: FutureBuilder(
                                future: _getNews(),
                                builder: (context, snapshot) => Visibility(
                                  child: Text(
                                    _articles[index + 1].title,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
