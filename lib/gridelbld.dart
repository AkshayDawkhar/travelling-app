import 'package:flutter/material.dart';
import 'package:glass/screen_2.dart';

import 'datain.dart';

class GridelBld extends StatefulWidget {
  const GridelBld({Key? key}) : super(key: key);

  @override
  State<GridelBld> createState() => _GridelBldState();
}

class _GridelBldState extends State<GridelBld> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: DataIn.li.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 15),
        itemBuilder: (BuildContext c, int indx) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ScondScr())));
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              // ignore: sort_child_properties_last
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DataIn.li[indx]['name'],
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DataIn.li[indx]['dis'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(DataIn.li[indx]['si']),
                      fit: BoxFit.cover)),
            ),
          );
        });
  }
}