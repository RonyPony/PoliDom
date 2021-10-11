import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Screens/Forms/police_screen.dart';
import 'package:polidom/Widgets/home_launch_pad.dart';
import 'package:polidom/Widgets/menu_inferior.dart';

import '../../assets.dart';
import '../perfil.dart';

class CategoryOneScreen extends StatefulWidget {
  static const routeName = 'categoryOne';
  const CategoryOneScreen({Key key}) : super(key: key);

  @override
  _CategoryOneScreenState createState() => _CategoryOneScreenState();
}

class _CategoryOneScreenState extends State<CategoryOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Reporte de Policia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildFirstPanell(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            buildViolencePanel(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            buildcarPanel(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            buildLastOne(),
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
        isSmall: true,
        svg: svg,
        title: title,
        subtitle: subtitle,
        backgroundColor: color,
        onTapRouteName: routeName,
      ),
    );
  }

  buildFirstPanell() {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
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
      child: Row(
        children: [
          buildLaunchPads("ROBO", "REPORTA UN ROBO A TU PROPIEDAD",
              Colors.purple, SvgAssets.policeIcon, PoliceFormScreen.routeName),
          buildLaunchPads("ATRACO", "REPORTA UN NUEVO ASALTO", Colors.blue,
              SvgAssets.policeIcon, ProfileScreen.routeName),
          buildLaunchPads("RUIDO", "REPORTA MUSICA ALTA", Colors.redAccent,
              SvgAssets.policeIcon, ProfileScreen.routeName),
        ],
      ),
    );
  }

  buildViolencePanel() {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
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
      child: Row(
        children: [
          buildLaunchPads("VIOLENCIA SEXUAL", "VIOLACIONES", Colors.orange,
              SvgAssets.policeIcon, ProfileScreen.routeName),
          buildLaunchPads("VIOLENCIA FAMILIAR", "INTRAFAMILIAR", Colors.green,
              SvgAssets.policeIcon, ProfileScreen.routeName),
          buildLaunchPads("VIOLENCIA CALLEJERA", "VANDALISMO", Colors.pink,
              SvgAssets.policeIcon, ProfileScreen.routeName),
        ],
      ),
    );
  }

  buildcarPanel() {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
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
      child: Row(
        children: [
          buildLaunchPads("ACCIDENTE DE TRANSITO", "CHOQUES", Colors.orange,
              SvgAssets.policeIcon, ProfileScreen.routeName),
          buildLaunchPads("VEHICULO ABANDONADO", "CARROS", Colors.green,
              SvgAssets.policeIcon, ProfileScreen.routeName),
          buildLaunchPads("SUSTANCIAS PROHIVIDAS", "DROGAS", Colors.pink,
              SvgAssets.policeIcon, ProfileScreen.routeName),
        ],
      ),
    );
  }

  buildLastOne() {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.red.withOpacity(.5),
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
              padding: const EdgeInsets.only(top: 50, left: 0),
              child: Text(
                '¿INCONDUCTA POLICIAL?',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                'en esta seccion puedes reportar al policia',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .95,
      ),
    );
  }
}
