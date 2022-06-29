import 'package:flutter/cupertino.dart';
import 'package:polidom2/screens/Categories/category_1.dart';
import 'package:polidom2/screens/Categories/othersReports.dart';
import 'package:polidom2/screens/Forms/police_screen.dart';
import 'package:polidom2/screens/authentication/login_screen.dart';
import 'package:polidom2/screens/authentication/register_screen.dart';
import 'package:polidom2/screens/home_screen.dart';
import 'package:polidom2/screens/my_reports.dart';
import 'package:polidom2/screens/perfil.dart';

import 'Screens/Forms/location_picker.dart';
import 'Screens/Forms/pickup_location_screen.dart';
import 'Screens/report_detail.dart';

Map<String, WidgetBuilder> getAllRoutes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
    RegisterScreen.routeName: (BuildContext context) => const RegisterScreen(),
    MyReportsScreen.routeName: (BuildContext context) => const MyReportsScreen(),
    ProfileScreen.routeName: (BuildContext context) => const ProfileScreen(),
    CategoryOneScreen.routeName: (BuildContext context) => const CategoryOneScreen(),
    PoliceFormScreen.routeName: (BuildContext context) => const PoliceFormScreen(),
    OtherReportsScreen.routeName: (BuildContext context) =>
        const OtherReportsScreen(),
    SelectExactLocationScreen.routeName: (BuildContext context) =>
        SelectExactLocationScreen(),
    PickupLocationScreen.routeName: (BuildContext context) =>
        const PickupLocationScreen(),
    ReportDetailsScreen.routeName: (BuildContext context) =>
        const ReportDetailsScreen(),
  };
}
