import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polidom/Widgets/menu_inferior.dart';
import 'package:polidom/theme/polidomColors.dart';

import '../assets.dart';

class MyReportsScreen extends StatefulWidget {
  static const String routeName = 'my-reports';
  const MyReportsScreen({Key key}) : super(key: key);

  @override
  _MyReportsScreenState createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  @override
  Widget build(BuildContext context) {
    SvgPicture logout = SvgPicture.asset(
      SvgAssets.logoutIcon,
      color: Colors.purple.withOpacity(.5),
      placeholderBuilder: (context) => CircularProgressIndicator(),
      height: 30,
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .14,
        elevation: 0,
        // title: Text(
        //   'Mis reportes',
        //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        // ),
        leading: Container(
          padding: EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            SvgAssets.editIcon,
            color: Colors.purple.withOpacity(.5),
          ),
        ),
        actions: [
          // buildReportCaunter(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          Container(padding: EdgeInsets.only(right: 20), child: logout),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
        ],
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 1,
      ),
    );
  }
}
