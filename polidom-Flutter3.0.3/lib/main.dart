import 'package:flutter/material.dart';
import 'package:polidom2/contracts/photo_contract.dart';
import 'package:polidom2/providers/auth_provider.dart';
import 'package:polidom2/providers/location_provider.dart';
import 'package:polidom2/providers/photo_provider.dart';
import 'package:polidom2/providers/report_provider.dart';
import 'package:polidom2/routes.dart';
import 'package:polidom2/screens/authentication/login_screen.dart';
import 'package:polidom2/services/address_service.dart';
import 'package:polidom2/services/auth_service.dart';
import 'package:polidom2/services/photo_service.dart';
import 'package:polidom2/services/report_service.dart';
import 'package:polidom2/theme/theme.dart';
import 'package:provider/provider.dart';

import 'contracts/reports_contrac.dart';

void main() {
  runApp( Polidom());
}

class Polidom extends StatelessWidget {
  ReportServiceContract? _reportContract;
  PhotoServiceContract? _photoContract;
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
        title: 'Polidom App',
        routes: getAllRoutes(),
        theme: PolidomTheme.getPolidomTheme(),
        home: HomePage(title:"Reportes"), 
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}


