import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                buildLaunchPads("ANTIRUIDO", "+8000 POLICIAS", Colors.purple,
                    SvgAssets.musicIcon, ProfileScreen.routeName),
                buildLaunchPads("PARAMEDICOS", "+8000 DOCTORES", Colors.red,
                    SvgAssets.emergencyIcon, ProfileScreen.routeName),
              ],
            ),
            Row(
              children: [
                buildLaunchPads("MEDICO", "+8000 MEDICOS", Colors.pink,
                    SvgAssets.doctorIcon, ProfileScreen.routeName),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 0,
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
