import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:futter_fanshion_ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Colors.white,
        selectedIconColor: Colors.blue,
        unselectedIconColor: Colors.blue.withOpacity(0.6),
        items: [
          FloatingNavBarItem(
              iconData: Icons.home_outlined,
              page: const HomePage(),
              title: 'Home'),
          FloatingNavBarItem(
              iconData: Icons.search_outlined,
              page: const HomePage(),
              title: 'Home'),
          FloatingNavBarItem(
              iconData: Icons.shopping_bag_outlined,
              page: const HomePage(),
              title: 'Home'),
          FloatingNavBarItem(
              iconData: Icons.bookmark_border_outlined,
              page: const HomePage(),
              title: 'Home'),
        ],
        horizontalPadding: 10.0,
        hapticFeedback: true,
        showTitle: false,
      ),
    );
  }
}
