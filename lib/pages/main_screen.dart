import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';

import 'home_page.dart';
import 'library_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: TEXT_REGULAR,
        unselectedFontSize: TEXT_REGULAR,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
            ),
            activeIcon: Icon(
              Feather.home,
              color: SELECTED_TEXT_COLOR,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.book,
              color: Colors.black,
            ),
            title: Text(
              "Library",
            ),
            activeIcon: Icon(
              Feather.book,
              color: SELECTED_TEXT_COLOR,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
