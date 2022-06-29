import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/my_reports.dart';
import '../screens/perfil.dart';

class MenuInferior extends StatefulWidget {
  final int pageIndex;
  const MenuInferior({this.pageIndex = 0, key}) : super(key: key);

  @override
  _MenuInferiorState createState() => _MenuInferiorState();
}

class _MenuInferiorState extends State<MenuInferior> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.pageIndex;
    return BottomNavigationBar(
      iconSize: 40,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(size: 30, opacity: .3),
      selectedIconTheme: IconThemeData(size: 50, opacity: 1),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'INICIO',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.report_sharp,
          ),
          label: 'REPORTES',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_rounded,
          ),
          label: 'PERFIL',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.purple, //PolidomColors.principal,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    var screens = [
      HomeScreen.routeName,
      MyReportsScreen.routeName,
      ProfileScreen.routeName
    ];
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamedAndRemoveUntil(
        context, screens[index], (route) => false);
  }
}
