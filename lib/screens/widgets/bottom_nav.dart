import 'package:flutter/material.dart';

import '../all_plants_page.dart';
import '../favourite_plants.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    AllPlantsPage(),
    const Text('Checkout Cart'),  // Replace with actual screens
    FavouritePlants(),
    const Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp, color: Colors.black45,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black45,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.black45,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.black45,size: 30,),
            label: '',
          ),
        ],

        currentIndex: _selectedIndex,
        // selectedFontSize: 20,
        // unselectedFontSize: 20,
        elevation: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
