import 'package:Autority/Providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Autority/Models/report_model.dart';
import 'package:Autority/Providers/report_provider.dart';
import 'package:Autority/Screens/authentication/login_screen.dart';
import 'package:Autority/Screens/report_detail.dart';
import 'package:Autority/Widgets/menu_inferior.dart';
import 'package:Autority/theme/AutorityColors.dart';
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
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    Future<List<Report>> allReports = reportsProvider.retriveAllReports();
    Future<String> authId = authProvider.getCurrentUserId();
    Future<Report> assignedReport = reportsProvider.getAssignedReport(authId);
    int assignedReportId = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .20,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'TODOS LOS REPORTES',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FutureBuilder<Report>(
              future: assignedReport,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    leading: Icon(
                      Icons.gps_fixed_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                    tileColor: Colors.purple,
                    title: Text(
                      'Reporte Asignado ( Reporte No. ${snapshot.data.id})',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      reportsProvider.getReportLabel(snapshot.data.reportType),
                      style: TextStyle(color: Colors.white.withOpacity(.5)),
                    ),
                  );
                } else {
                  if (snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasData) {
                    return Text("SIN CASO ASIGNADO");
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasError) {
                    return Text("Error obteniendo los reportes");
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Cargando tus reportes')
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 20, bottom: 20),
            //   child: Text('Otros Reportes'),
            // ),
            FutureBuilder<List<Report>>(
              future: allReports,
              builder: (context, snapshot) {
                List<Report> listha = List<Report>();
                if (snapshot.hasData) {
                  // snapshot.data.forEach((element) {
                  //   if (element.id != assignedReportId) {
                  //     listha.add(element);
                  //   }
                  // });
                  listha = snapshot.data;
                  if (listha.length >= 1) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .7,
                      child: ListView.builder(
                        itemCount: listha.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ReportDetailsScreen.routeName,
                                  arguments: listha[index].id);
                            },
                            dense: false,
                            subtitle: Text(
                                listha[index].description ?? "Sin Descripcion"),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            leading: reportsProvider
                                .getReportIcon(listha[index].reportType),
                            title: Text(reportsProvider.getReportLabel(
                                listha[index].reportType ?? 0808)),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.dashboard_customize,
                            color: Colors.grey,
                            size: 200,
                          ),
                          Text(
                            'Aun no hay reportes para asignar.',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      ),
                    );
                  }
                } else {
                  if (snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasData) {
                    return Text("NO DATA COLLECTED");
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasError) {
                    return Text("Error obteniendo los reportes");
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Cargando tus reportes')
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 1,
      ),
    );
  }
}
