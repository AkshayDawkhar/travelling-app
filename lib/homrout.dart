import 'dart:async';

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
  Timer? coutimer;
  bool bo = true;
  int bi = 0;
  int a = 0;
  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (bi == DataIn.pg.length) {
        bi = 0;
      }

      pageController.animateToPage(bi,
          duration: const Duration(seconds: 1), curve: Curves.easeInQuint);
      bi++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.9);
    super.initState();
    setState(() {
      Future.delayed(const Duration(seconds: 0), (() {
        bo = !bo;
      }));
    });
    coutimer = getTimer();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 44, 62, 71),
          leading: const Icon(Icons.recommend_outlined),
          title: const Text("JAPAN"),
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
            bi = a;
            pageController.animateToPage(bi,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInQuint);
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onPanDown: (details) {
                    coutimer?.cancel();
                    coutimer = null;
                  },
                  onPanCancel: () {
                    coutimer = getTimer();
                  },
                  child: SizedBox(
                    height: 230,
                    child: PageView.builder(
                        allowImplicitScrolling: true,
                        controller: pageController,
                        onPageChanged: (index) {
                          bi = index;
                          setState(() {});
                        },
                        itemCount: DataIn.pg.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22)),
                                height: 230,
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  // padding: EdgeInsets.all(12),

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              DataIn.pg[index]['aurl']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ],
                          );
                        })),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      DataIn.pg.length,
                      (index) => GestureDetector(
                            onTap: () {
                              bi = index;
                            },
                            child: Container(
                              margin: bi == index
                                  ? const EdgeInsets.all(1)
                                  : const EdgeInsets.all(3),
                              child: Icon(
                                     Icons.circle,
                                size: bi == index ? 12 : 6,
                                color:
                                    index == bi ? Colors.blue : Colors.blueGrey,
                              ),
                            ),
                          )),
                ),
                // GestureDetector(
                //   onTap: (() {
                //     bo = !bo;

                //     setState(() {});
                //   }),
                //   child: SizedBox(
                //     height: 250,
                //     child: AnimatedContainer(
                //       // ignore: sort_child_properties_last
                //       child: AnimatedOpacity(
                //           curve: updown(count: 9999),
                //           opacity: bo ? 1 : 0,
                //           duration: const Duration(seconds: 66653),
                //           // curve: SawTooth(3),

                //           child: Container(
                //             decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                     fit: BoxFit.cover,
                //                     image: NetworkImage(DataIn.pg[1]['aurl']))),
                //           )),
                //       duration: const Duration(seconds: 2),
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage(DataIn.li[2]['si']))),
                //     ),
                //   ),
                // ),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridelBld(),
                )
              ],
            ),
          ),
        ));
  }
}
