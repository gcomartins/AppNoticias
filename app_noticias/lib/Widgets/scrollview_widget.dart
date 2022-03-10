import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScrollViewWidget extends StatelessWidget {
  const ScrollViewWidget(
      {Key? key, required this.articles, required this.method})
      : super(key: key);

  final method;
  final List<dynamic> articles;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Column(
                    children: [
                      InkWell(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1,
                            height: MediaQuery.of(context).size.height / 4,
                            child: FittedBox(
                              clipBehavior: Clip.hardEdge,
                              fit: BoxFit.cover,
                              child: FutureBuilder<String>(
                                future: method,
                                builder: (context, snapshot) => Visibility(
                                  visible: snapshot.hasData,
                                  child: Image.network(
                                    articles[index + 1].urlToImage,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            launch(articles[index + 1].url);
                          }),
                      Flexible(
                        child: FutureBuilder(
                          future: method,
                          builder: (context, snapshot) => Visibility(
                            child: Text(
                              articles[index + 1].title,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
