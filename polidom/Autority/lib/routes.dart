import 'package:flutter/cupertino.dart';
import 'package:Autority/Screens/Categories/category_1.dart';
import 'package:Autority/Screens/Categories/othersReports.dart';
import 'package:Autority/Screens/Forms/police_screen.dart';
import 'package:Autority/Screens/authentication/register_screen.dart';
import 'package:Autority/Screens/home_screen.dart';
import 'package:Autority/Screens/authentication/login_screen.dart';
import 'package:Autority/Screens/my_reports.dart';
import 'package:Autority/Screens/perfil.dart';

import 'Screens/Forms/location_picker.dart';
import 'Screens/Forms/pickup_location_screen.dart';
import 'Screens/report_detail.dart';

Map<String, WidgetBuilder> getAllRoutes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    RegisterScreen.routeName: (BuildContext context) => RegisterScreen(),
    MyReportsScreen.routeName: (BuildContext context) => MyReportsScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
    CategoryOneScreen.routeName: (BuildContext context) => CategoryOneScreen(),
    PoliceFormScreen.routeName: (BuildContext context) => PoliceFormScreen(),
    OtherReportsScreen.routeName: (BuildContext context) =>
        OtherReportsScreen(),
    SelectExactLocationScreen.routeName: (BuildContext context) =>
        SelectExactLocationScreen(),
    PickupLocationScreen.routeName: (BuildContext context) =>
        PickupLocationScreen(),
    ReportDetailsScreen.routeName: (BuildContext context) =>
        ReportDetailsScreen(),
  };
}
