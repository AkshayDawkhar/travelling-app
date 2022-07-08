import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavFolat extends StatefulWidget {
  const NavFolat({Key? key}) : super(key: key);

  @override
  State<NavFolat> createState() => _NavFolatState();
}

class _NavFolatState extends State<NavFolat> {
  int inn = 2;
  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      onTap: (val) {
        inn = val;
        setState(() {});
      },
      backgroundColor: const Color.fromARGB(207, 53, 53, 53),
      currentIndex: inn,
      borderRadius: 15,
      iconSize: 30,
      selectedItemColor: Colors.black,
      selectedBackgroundColor: Colors.blueGrey,
      unselectedItemColor: Colors.blueGrey,
      itemBorderRadius: 90,
      items: [
        FloatingNavbarItem(icon: Icons.public),
        FloatingNavbarItem(icon: Icons.person),
        FloatingNavbarItem(icon: Icons.person),
        FloatingNavbarItem(icon: Icons.person),
      ],
    );
  }
}
