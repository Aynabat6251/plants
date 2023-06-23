import 'package:flutter/material.dart';
import 'package:flutter_application_1/favorites.dart';
import 'package:flutter_application_1/mainscreen_provider.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/searchpage.dart';
import 'package:provider/provider.dart';
import 'bottom_nav.dart';
import 'cartpage.dart';
import 'homepage.dart';

class MainScreen extends StatelessWidget {

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    Favorites(),
    CartPage(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainSecreenNotifier>(
        builder: (context, mainSecreenNotifier, child) {
      return Scaffold(
        backgroundColor: const Color(0XFFE2E2E2),
        body: pageList[mainSecreenNotifier.pageIndex],
        bottomNavigationBar: const BottonNavBar(),
      );
    });
  }
}
