import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key, required this.articles, required this.method})
      : super(key: key);

  final List<dynamic> articles;
  final method;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            future: method,
            builder: ((context, snapshot) => Visibility(
                  visible: snapshot.hasData,
                  child: FittedBox(
                    clipBehavior: Clip.hardEdge,
                    fit: BoxFit.cover,
                    child: Image.network(
                      articles[0].urlToImage ?? '',
                    ),
                  ),
                )),
          ),
        ),
        InkWell(
          onTap: () {
            launch(articles[0].url ?? '');
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             NewsPage(article: articles[0])));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(176, 0, 0, 0),
            ),
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
                    child: Text(
                      "News of the day",
                      style: GoogleFonts.lato(
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
                    future: method,
                    builder: ((context, snapshot) => Visibility(
                          visible: snapshot.hasData,
                          child: Text(
                            articles[0].title ?? '',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "by ${articles[0].author ?? articles[0].name}",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: const Color.fromARGB(209, 255, 255, 255),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Learn More    ",
                          style: GoogleFonts.lato(
                            fontSize: 18,
                          )),
                      const WidgetSpan(
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
