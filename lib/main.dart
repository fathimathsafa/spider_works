import 'package:flutter/material.dart';
import 'package:news_spider/presentation/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:news_spider/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:news_spider/presentation/details_screen/controller/details_controller.dart';
import 'package:news_spider/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:news_spider/presentation/home_screen/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomNavigationController()),
      ChangeNotifierProvider(create: (context) => NewsController()),
      ChangeNotifierProvider(create: (context) => NewsDetailsController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Base design size (like iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNavBar(),  // Your main screen
        );
      },
    );
  }
}
