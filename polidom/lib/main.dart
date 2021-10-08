import 'package:flutter/material.dart';
import 'package:polidom/Screens/authentication/login_screen.dart';
import 'package:polidom/Screens/home_screen.dart';
import 'package:polidom/routes.dart';
import 'theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getAllRoutes(),
      title: 'POLIDOM',
      theme: PolidomTheme.getPolidomTheme(),
      home: HomePage(title: 'REPORTES'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
