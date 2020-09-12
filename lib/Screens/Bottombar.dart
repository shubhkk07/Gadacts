import 'package:flutter/material.dart';
import 'package:gadacts/Screens/account.dart';
import 'package:gadacts/Screens/drawer.dart';
import 'package:gadacts/Screens/homepage.dart';
import 'package:gadacts/Screens/middle.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Color yellowishWhite = Color(0xffFFF9EC);
  void _ontappedItem(int index) {
    setState(() {
      _index = index;
    });
  }

  List<Widget> pages = <Widget>[
    HomePage(),
    Middle(),
    Account(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: Drawer(
       child:SideDrawer()
     ),
      backgroundColor: yellowishWhite,
      body: IndexedStack(
        index: _index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: yellowishWhite,
          currentIndex: _index,
          onTap: _ontappedItem,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('Search')),
            BottomNavigationBarItem(icon: Icon(Icons.save_alt),title: Text('Saved')),
          ]),
    );
  }
}
