import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polidom/Models/report_model.dart';
import 'package:polidom/Providers/report_provider.dart';
import 'package:polidom/Screens/authentication/login_screen.dart';
import 'package:polidom/Screens/report_detail.dart';
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
    final reportsProvider = Provider.of<ReportProvider>(context, listen: false);
    Future<List<Report>> allReports = reportsProvider.retriveAllReports();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .14,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'MIS REPORTES',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
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
                      onTap: () {
                        Navigator.pushNamed(
                            context, ReportDetailsScreen.routeName,
                            arguments: snapshot.data[index].id);
                      },
                      dense: false,
                      subtitle: Text(snapshot.data[index].description ??
                          "Sin Descripcion"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(
                        Icons.local_police,
                        size: 35,
                        color: Colors.red.withOpacity(.5),
                      ),
                      title: Text(reportsProvider.getReportLabel(
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
}
