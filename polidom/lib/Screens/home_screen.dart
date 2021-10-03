import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polidom/Screens/Categories/category_1.dart';
import 'package:polidom/Screens/perfil.dart';
import 'package:polidom/Widgets/home_launch_pad.dart';
import 'package:polidom/Widgets/menu_inferior.dart';
import 'package:polidom/assets.dart';
import 'package:polidom/theme/polidomColors.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home-screen';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SvgPicture profileSvg = SvgPicture.asset(
      SvgAssets.accountIcon,
      color: PolidomColors.oscuro,
      placeholderBuilder: (context) => CircularProgressIndicator(),
      height: MediaQuery.of(context).size.height * .06,
    );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(
          'REPORTES',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          buildReportCaunter(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
            child: profileSvg,
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
              Row(
                children: [
                  buildLaunchPads("POLICIA", '+8000 POLICIAS', Colors.blue,
                      SvgAssets.policeIcon, CategoryOneScreen.routeName),
                  buildLaunchPads("BOMBEROS", "+8000 BOMBERO", Colors.orange,
                      SvgAssets.fireIcon, ProfileScreen.routeName),
                ],
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
                  buildLaunchPads("PSICOLOGO", "+8000 DOCTORES", Colors.green,
                      SvgAssets.psicoIcon, ProfileScreen.routeName),
                  buildLaunchPads("MEDICO", "+8000 MEDICOS", Colors.pink,
                      SvgAssets.doctorIcon, ProfileScreen.routeName),
                ],
              )
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
        svg: svg,
        title: title,
        subtitle: subtitle,
        backgroundColor: color,
        onTapRouteName: routeName,
      ),
    );
  }

  buildReportCaunter() {
    return CircleAvatar(
      backgroundColor: Colors.red.withOpacity(.7),
      maxRadius: 13,
      foregroundColor: PolidomColors.principal,
      child: Text('5'),
    );
  }
}
