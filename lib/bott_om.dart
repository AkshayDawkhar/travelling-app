import 'dart:io';

import 'package:flutter/material.dart';

class BottomNavv extends StatefulWidget {
  const BottomNavv({Key? key}) : super(key: key);

  @override
  State<BottomNavv> createState() => _BottomNavvState();
}

class _BottomNavvState extends State<BottomNavv> {
  int ind = 0;

  bool bo = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(71, 96, 125, 139)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Icon(Icons.access_alarm),
                style: ElevatedButton.styleFrom(
                    primary: ind == 0
                        ? Color.fromARGB(0, 255, 255, 255)
                        : Colors.blue),
                onPressed: (() {
                  setState(() {
                    ind = 0;
                  });
                })),
            IconButton(
              onPressed: (() {
                ind = 1;
                setState(() {});
              }),
              icon: const Icon(Icons.home),
              iconSize: ind == 1 ? 35 : 35,
              padding: EdgeInsets.only(bottom: ind == 1 ? 23 : 0),
              color: ind == 1 ? Colors.red : Colors.cyanAccent,
            ),
            IconButton(
              onPressed: (() {
                ind = 2;
                setState(() {});
              }),
              icon: const Icon(Icons.home),
              iconSize: ind == 2 ? 35 : 35,
              padding: EdgeInsets.only(bottom: ind == 2 ? 23 : 0),
              color: ind == 2 ? Colors.red : Colors.cyanAccent,
            ),
            IconButton(
              onPressed: (() {
                ind = 3;
                setState(() {});
              }),
              icon: const Icon(Icons.home),
              iconSize: ind == 3 ? 35 : 35,
              padding: EdgeInsets.only(bottom: ind == 3 ? 23 : 0),
              color: ind == 3 ? Colors.red : Colors.cyanAccent,
            )
          ]),
    );
  }
}
