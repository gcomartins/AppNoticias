import 'package:flutter/material.dart';

class ParteInicial extends StatefulWidget {
  const ParteInicial({
    Key? key,
    required Future<String> method,
    required String imagemInicial,
    required String tituloInicial,
  }) : super(key: key);

  @override
  State<ParteInicial> createState() => _ParteInicialState();
}

class _ParteInicialState extends State<ParteInicial> {
  final Future<String>? method = null;
  final String? imagemInicial = '';
  final String tituloInicial = '';

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
                      imagemInicial ?? '',
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
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: FutureBuilder(
                    future: method,
                    builder: ((context, snapshot) => Visibility(
                          visible: snapshot.hasData,
                          child: Text(
                            tituloInicial,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
    );
  }
}
