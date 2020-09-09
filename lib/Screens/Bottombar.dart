import 'package:flutter/material.dart';
import 'package:gadacts/Screens/account.dart';
import 'package:gadacts/Screens/homepage.dart';
import 'package:gadacts/Screens/middle.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _ontappedItem(int index) {
    setState(() {
      _index = index;
    });
  }

  List<String> title = ['Home', 'Search', 'Account'];

  maptitle() {
    pages.map((e) => title);
  }

  //List<Map<String,Widget>> _list = [
  //  :HomePage(),

// ];

  List<Widget> pages = <Widget>[
    HomePage(),
    Middle(),
    Account(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.elementAt(_index)),
      ),
      body: IndexedStack(
        index: _index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: _ontappedItem,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('search')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), title: Text('Profile')),
          ]),
    );
  }
}
