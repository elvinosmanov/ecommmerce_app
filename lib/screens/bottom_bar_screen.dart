import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'cart/cart.dart';
import 'feed_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'user_screen.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {"page": HomeScreen(), "title": "Home", "icon": FeatherIcons.home},
      {"page": FeedScreen(), "title": "Feed", "icon": FeatherIcons.rss},
      {"page": SearchScreen(), "title": "Search", "icon": FeatherIcons.search},
      {"page": Cart(), "title": "Cart", "icon": FeatherIcons.shoppingBag},
      {"page": UserScreen(), "title": "User", "icon": FeatherIcons.user},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          decoration:
              BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: _navigationItem(index: 0)),
              _navigationItem(index: 1),
              SizedBox(width: 40),
              _navigationItem(index: 3),
              Container(
                padding: EdgeInsets.only(right: 30.0),
                child: _navigationItem(index: 4),
              ), // The dummy child
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: Icon(_pages[2]['icon']),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _navigationItem({required int index}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.zero,
          height: 30.0,
          child: IconButton(
              tooltip: _pages[index]['title'],
              padding: EdgeInsets.zero,
              color: _selectedIndex != index ? Colors.blue[200] : Colors.purple,
              iconSize: _selectedIndex != index ? 20.0 : 30.0,
              icon: Icon(_pages[index]['icon']),
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
        if (_selectedIndex == index)
          Text(
            _pages[index]['title'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
          )
      ],
    );
  }
}
