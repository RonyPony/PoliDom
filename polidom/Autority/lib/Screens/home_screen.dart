import 'package:Autority/Providers/report_provider.dart';
import 'package:Autority/Screens/my_reports.dart';
import 'package:Autority/Screens/report_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Autority/Screens/Categories/category_1.dart';
import 'package:Autority/Screens/perfil.dart';
import 'package:Autority/Widgets/home_launch_pad.dart';
import 'package:Autority/Widgets/menu_inferior.dart';
import 'package:Autority/assets.dart';
import 'package:Autority/theme/AutorityColors.dart';
import 'package:provider/provider.dart';

import 'Categories/othersReports.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home-screen';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final reportsProvider = Provider.of<ReportProvider>(context, listen: false);
    Future<int> allReportsCount = reportsProvider.getCount();
    SvgPicture profileSvg = SvgPicture.asset(
      SvgAssets.accountIcon,
      color: Colors.white.withOpacity(.5),
      placeholderBuilder: (context) => CircularProgressIndicator(),
      height: MediaQuery.of(context).size.height * .06,
    );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: AutorityColors.principal,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(
          'CASOS',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "roboto"),
        ),
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
                child: profileSvg),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
        ],
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildWelcomeBanner(),
              Row(
                children: [
                  buildLaunchPads("Atendidos", '2 Casos', Colors.purple,
                      SvgAssets.smile, CategoryOneScreen.routeName),
                  FutureBuilder(
                    future: allReportsCount,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return buildLaunchPads(
                            "Reportados",
                            "${snapshot.data} Casos",
                            Colors.green,
                            SvgAssets.work,
                            MyReportsScreen.routeName);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
              buildPanicBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLaunchPads(String title, String subtitle, Color color, String svg,
      String routeName) {
    return Container(
      padding: EdgeInsets.all(8),
      child: HomeLaunchPad(
        isSmall: false,
        svg: svg,
        title: title,
        subtitle: subtitle,
        backgroundColor: color,
        onTapRouteName: routeName,
      ),
    );
  }

  buildPanicBtn() {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.pink.withOpacity(1),
            Colors.blue.withOpacity(1),
            Colors.orange.withOpacity(1),
          ],
        ),
        color: Colors.white,
        border: Border.all(
          width: 0,
          color: Colors.black.withOpacity(.3),
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 0),
                child: SvgPicture.asset(
                  'images/svg/emergency.svg',
                  height: 50,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 0),
              child: Text(
                'Caso Actual',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .95,
      ),
    );
  }

  buildWelcomeBanner() {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.red.withOpacity(.5),
            Colors.white.withOpacity(.5),
            Colors.blue.withOpacity(1),
          ],
        ),
        color: Colors.white, //widget.backgroundColor.withOpacity(.3),
        border: Border.all(
          width: 0,
          color: Colors.black.withOpacity(.3),
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55, left: 0),
              child: Text(
                'Bienvenido a Polidom Authority',
                style: TextStyle(color: AutorityColors.principal, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .95,
      ),
    );
  }
}
