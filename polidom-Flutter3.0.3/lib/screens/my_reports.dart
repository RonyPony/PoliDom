import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:polidom2/models/report_model.dart';
import 'package:polidom2/screens/report_detail.dart';
import 'package:provider/provider.dart';

import '../Widgets/menu_inferior.dart';
import '../assets.dart';
import '../providers/report_provider.dart';

class MyReportsScreen extends StatefulWidget {
  static const String routeName = 'my-reports';
  const MyReportsScreen({Key? key}) : super(key: key);

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
        toolbarHeight: MediaQuery.of(context).size.height * .16,
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
                height: MediaQuery.of(context).size.height * .7,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ReportDetailsScreen.routeName,
                            arguments: snapshot.data![index].id);
                      },
                      dense: false,
                      subtitle: Text(snapshot.data![index].description ??
                          "Sin Descripcion"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      leading: reportsProvider
                          .getReportIcon(snapshot.data![index].reportType),
                      title: Text(reportsProvider.getReportLabel(
                          snapshot.data![index].reportType ?? 0808)),
                    );
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
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
