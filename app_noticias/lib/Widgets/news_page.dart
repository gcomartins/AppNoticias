import 'package:app_noticias/Widgets/article.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, required this.article}) : super(key: key);

  final Article article;
  // final method;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF000000),
                ),
                child:
                    // FutureBuilder<String>(
                    //   // future: ,
                    //   builder: ((context, snapshot) => Visibility(
                    //         visible: snapshot.hasData,
                    //         child:
                    FittedBox(
                  clipBehavior: Clip.hardEdge,
                  fit: BoxFit.cover,
                  child: Image.network(
                    article.urlToImage.toString(),
                  ),
                ),
                //       )),
                // ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        child:
                            // FutureBuilder(
                            //   // future: method,
                            //   builder: ((context, snapshot) => Visibility(
                            //         visible: snapshot.hasData,
                            //         child:
                            Text(
                          article.title.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          // ),
                          // )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(article.content.toString()),
            ),
          )
        ],
      ),
    );
  }
}
