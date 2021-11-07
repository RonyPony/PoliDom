import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polidom/Screens/Forms/police_screen.dart';
import 'package:polidom/Widgets/home_launch_pad.dart';
import 'package:polidom/Widgets/menu_inferior.dart';

import '../../assets.dart';
import '../perfil.dart';

class OtherReportsScreen extends StatefulWidget {
  static const routeName = 'otherReports';
  const OtherReportsScreen({Key key}) : super(key: key);

  @override
  _OtherReportsScreenState createState() => _OtherReportsScreenState();
}

class _OtherReportsScreenState extends State<OtherReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Otros Reportes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                buildParamedics(),
              ],
            ),
            Row(
              children: [
                buildFirefighters(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 0,
      ),
    );
  }

  Widget buildParamedics() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PoliceFormScreen.routeName, arguments: 11);
      },
      child: Container(
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.pink.withOpacity(1),
              Colors.white.withOpacity(1),
              Colors.blue.withOpacity(1),
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
                    SvgAssets.emergencyIcon,
                    height: 50,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: Text(
                  'PARAMEDICOS',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width * .95,
        ),
      ),
    );
  }

  Widget buildFirefighters() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PoliceFormScreen.routeName, arguments: 11);
      },
      child: Container(
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red.withOpacity(1),
              Colors.white.withOpacity(1),
              Colors.yellow.withOpacity(1),
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
                    SvgAssets.fireIcon,
                    height: 50,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: Text(
                  'BOMBEROS',
                  style: TextStyle(color: Colors.orange, fontSize: 30),
                ),
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width * .95,
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
}
