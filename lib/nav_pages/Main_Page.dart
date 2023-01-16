// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel/nav_pages/BarPage.dart';
import 'package:travel/nav_pages/SettingsPage.dart';
import 'package:travel/nav_pages/profile.dart';
import 'package:travel/pages/HomePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List Pages = [
    const HomePage(),
    const BarPage(),
    const SettingsPage(),
    const AdminPage()
  ];
  List PageNames = ["Home", "Bar", "Settings", "Profile"];
  void ontap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(PageNames[currentIndex]),
      //   centerTitle: true,
      //   titleTextStyle: const TextStyle(
      //       color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: ontap,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: PageNames[currentIndex]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.bar_chart),
              label: PageNames[currentIndex]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: PageNames[currentIndex]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: PageNames[currentIndex])
        ],
      ),
    );
  }
}
