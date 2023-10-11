import 'package:flutter/material.dart';
import 'package:my_project_app/components/bottom_nav_bar.dart';
import 'package:my_project_app/pages/cart_page.dart';
import 'package:my_project_app/pages/shop_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: unused_field
  int _selectedIndex = 0;

  void navigateBottomBar(int newIndex){
    setState(() {
    _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}