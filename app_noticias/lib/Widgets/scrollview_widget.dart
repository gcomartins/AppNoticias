import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // color: Colors.orange,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (articles.length - 1) > 0 ? articles.length - 1 : 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          child: SizedBox(
                            // color: Colors.orange,
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height / 6.5,
                            child: FittedBox(
                              clipBehavior: Clip.hardEdge,
                              fit: BoxFit.cover,
                              child: FutureBuilder<String>(
                                future: method,
                                builder: (context, snapshot) => Visibility(
                                  visible: snapshot.hasData,
                                  child: Expanded(
                                    child: Image.network(
                                      articles[index + 1].urlToImage,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            launch(articles[index + 1].url);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) => NewsPage(
                            //             article: articles[index + 1])));
                          }),
                      Flexible(
                        child: FutureBuilder(
                          future: method,
                          builder: (context, snapshot) => Visibility(
                            child: Text(
                              articles[index + 1].title,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${(DateTime.now().hour - DateTime.parse(articles[index + 1].publishedAt).hour) + 2} hours ago",
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(87, 0, 0, 0),
                            fontSize: 13),
                      ),
                      Text(
                        "by ${articles[index + 1].author ?? articles[index + 1].name}",
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(87, 0, 0, 0),
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
