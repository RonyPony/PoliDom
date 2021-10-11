import 'package:flutter/cupertino.dart';
import 'package:polidom/Screens/Categories/category_1.dart';
import 'package:polidom/Screens/Forms/police_screen.dart';
import 'package:polidom/Screens/authentication/register_screen.dart';
import 'package:polidom/Screens/home_screen.dart';
import 'package:polidom/Screens/authentication/login_screen.dart';
import 'package:polidom/Screens/my_reports.dart';
import 'package:polidom/Screens/perfil.dart';

import 'Screens/Forms/location_picker.dart';
import 'Screens/Forms/pickup_location_screen.dart';

Map<String, WidgetBuilder> getAllRoutes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    RegisterScreen.routeName: (BuildContext context) => RegisterScreen(),
    MyReportsScreen.routeName: (BuildContext context) => MyReportsScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
    CategoryOneScreen.routeName: (BuildContext context) => CategoryOneScreen(),
    PoliceFormScreen.routeName: (BuildContext context) => PoliceFormScreen(),
    SelectExactLocationScreen.routeName: (BuildContext context) =>
        SelectExactLocationScreen(),
    PickupLocationScreen.routeName: (BuildContext context) =>
        PickupLocationScreen(),
  };
}
