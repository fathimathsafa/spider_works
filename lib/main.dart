import 'package:flutter/material.dart';
import 'package:news_spider/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:news_spider/presentation/home_screen/view/home_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
     // ChangeNotifierProvider(create: (context) => BottomNavigationController()),
      ChangeNotifierProvider(create: (context) => NewsController()),
      //ChangeNotifierProvider(create: (context) => NewsDetailsController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
