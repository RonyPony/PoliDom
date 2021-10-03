import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polidom/Widgets/menu_inferior.dart';
import 'package:polidom/theme/polidomColors.dart';

import '../assets.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'profile';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(
          'PERFIL',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          // buildReportCaunter(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          // profileSvg,
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
        ],
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 2,
      ),
    );
  }
}
