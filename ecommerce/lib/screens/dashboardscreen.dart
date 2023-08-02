import 'package:ecommerce/screens/accountscreen.dart';
import 'package:ecommerce/screens/categoryscreen.dart';
import 'package:ecommerce/screens/homescreen.dart';
import 'package:ecommerce/screens/morescree.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  bool loading = true;

  int _currentindex = 0;
  // ignore: non_constant_identifier_names
  List Pages = [
    HomeView(),
    CategoryScreen(),
    const MoreSCreen(),
    const AccountScreen(),
  ];
  void _onTapped(index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentindex,
        iconSize: 30.0,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "Category",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: "More",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
            backgroundColor: Colors.black,
          ),
        ],
        onTap: _onTapped,
      ),
      body: Pages.elementAt(_currentindex),
    );
  }
}
