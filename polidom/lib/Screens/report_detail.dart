import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Models/report_model.dart';
import 'package:polidom/Providers/report_provider.dart';
import 'package:polidom/Widgets/menu_inferior.dart';
import 'package:provider/provider.dart';

class ReportDetailsScreen extends StatefulWidget {
  static String routeName = '/reports-details';
  const ReportDetailsScreen({Key key}) : super(key: key);

  @override
  _ReportDetailsScreenState createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final reportsProvider = Provider.of<ReportProvider>(context, listen: false);
    Future<Report> thereport = reportsProvider.getSingleReport(args);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .14,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'DETALLES DEL REPORTE $args',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      bottomSheet: MenuInferior(
        pageIndex: 1,
      ),
      body: Container(
          child: FutureBuilder<Report>(
        future: thereport,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'Numero del reporte: ${snapshot.data.id}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tipo de reporte: ${reportsProvider.getReportLabel(snapshot.data.reportType)}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Reportado por: ${snapshot.data.reporterUserID}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Reportado el: ${snapshot.data.creationDate}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Estado del reporte: ${snapshot.data.isCompleted}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Autoridad Asignada: ${snapshot.data.assignedAuthorityId}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- UBICACION -',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Latitud: ${snapshot.data.ubicacion.latitude}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Longitud: ${snapshot.data.ubicacion.longitude}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Localidad: ${snapshot.data.ubicacion.localidad}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pais: ${snapshot.data.ubicacion.pais}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Provincia: ${snapshot.data.ubicacion.provincia}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sector: ${snapshot.data.ubicacion.sector}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Direccion: ${snapshot.data.ubicacion.txtdireccion}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Codigo postal: ${snapshot.data.ubicacion.zipCode}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Descripcion: ${snapshot.data.description}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
