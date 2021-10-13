import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polidom/Models/report_model.dart';
import 'package:polidom/Providers/report_provider.dart';
import 'package:polidom/Screens/authentication/login_screen.dart';
import 'package:polidom/Widgets/menu_inferior.dart';
import 'package:polidom/theme/polidomColors.dart';
import 'package:provider/provider.dart';

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
    final reportsProvider = Provider.of<ReportProvider>(context, listen: false);
    Future<List<Report>> allReports = reportsProvider.retriveAllReports();
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
          Container(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: logout,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                },
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Report>>(
          future: allReports,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height * .5,
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // dense: false,
                      subtitle: Text(snapshot.data[index].description ??
                          "Sin Descripcion"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(
                        Icons.local_police,
                        size: 35,
                        color: Colors.red.withOpacity(.5),
                      ),
                      title: Text(getReportType(
                          snapshot.data[index].reportType ?? 0808)),
                    );
                  },
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 1,
      ),
    );
  }

  String getReportType(int reportType) {
    switch (reportType) {
      case 0808:
        return "Error cargando el tipo de reporte";
        break;
      case 0:
        return "Reporte Policial";
        break;
      case 1:
        return "Reporte de robo";
      default:
        return "Otro tipo de Reporte";
    }
  }
}
