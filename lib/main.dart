import 'package:flutter/material.dart';
import 'package:glass/homrout.dart';
import 'package:glass/rout.dart';
import 'package:glass/screen_2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScr(),
        // RoutMap.second: (context) => ScondScr()
      },
      // home: SafeArea(child: HomeScr()),
    );
  }
}
