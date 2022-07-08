import 'package:flutter/material.dart';
import 'package:glass/rout.dart';

import 'datain.dart';
import 'gridelbld.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  late PageController pageController;

  int a = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.9);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 44, 62, 71),
          leading: const Icon(Icons.recommend_outlined),
          title: const Text("data"),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(3)),
              // ignore: sort_child_properties_last
              child: const Icon(
                Icons.free_breakfast,
                color: Colors.orange,
              ),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(12),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          currentIndex: a,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: ' ',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.public), label: ' '),
            BottomNavigationBarItem(icon: Icon(Icons.public), label: ' ')
            // https://images.unsplash.com/photo-1568822241089-05fe03f22b25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80
          ],
          onTap: (a) {
            this.a = a;
            setState(() {});
            Navigator.pushNamed(context, RoutMap.second);
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 230,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: DataIn.li.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 230,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                // padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(DataIn.li[index]['si']),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ],
                        );
                      })),
                ),
                SizedBox(
                  height: 250,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1568822241089-05fe03f22b25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridelBld(),
                )
              ],
            ),
          ),
        ));
  }
}
