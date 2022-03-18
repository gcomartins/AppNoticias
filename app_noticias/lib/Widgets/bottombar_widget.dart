import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_rounded,
            color: Colors.black,
          ),
          label: 'Serach',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_outlined,
            color: Colors.black,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
