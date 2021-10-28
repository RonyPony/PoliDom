import 'package:flutter/material.dart';
import 'package:polidom/Contracts/auth_contract.dart';
import 'package:polidom/Contracts/photo_contract.dart';
import 'package:polidom/Providers/auth_provider.dart';
import 'package:polidom/Providers/location_provider.dart';
import 'package:polidom/Providers/photo_provider.dart';
import 'package:polidom/Screens/authentication/login_screen.dart';
import 'package:polidom/Services/photo_service.dart';
import 'package:polidom/routes.dart';
import 'package:provider/provider.dart';
import 'Contracts/reports_contract.dart';
import 'Providers/report_provider.dart';
import 'Services/auth_service.dart';
import 'Services/location_service.dart';
import 'Services/report_service.dart';
import 'theme/theme.dart';

void main() {
  runApp(PolidomApp());
}

class PolidomApp extends StatelessWidget {
  ReportServiceContract _reportContract;
  PhotoServiceContract _photoContract;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => LocationProvider(AddressService())),
        ChangeNotifierProvider(
            create: (context) => ReportProvider(ReportService())),
        ChangeNotifierProvider(
            create: (context) => AuthProvider(AuthService())),
        ChangeNotifierProvider(
            create: (context) => PhotoProvider(PhotoService())),
      ],
      child: MaterialApp(
        routes: getAllRoutes(),
        title: 'POLIDOM',
        theme: PolidomTheme.getPolidomTheme(),
        home: HomePage(title: 'REPORTES'),
      ),
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
