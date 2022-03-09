import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
            onPressed: () => 1,
            child: const Text(
              "Principal",
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
            onPressed: () => 1,
            child: const Text(
              "Tecnologia",
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
            onPressed: () => 1,
            child: const Text(
              "Saúde",
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
            onPressed: () => 1,
            child: const Text(
              "Economia",
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
