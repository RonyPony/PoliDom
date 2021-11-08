import 'package:Autority/Models/account_info.dart';
import 'package:Autority/Providers/auth_provider.dart';
import 'package:Autority/Providers/photo_provider.dart';
import 'package:Autority/Screens/reportImages.dart';
import 'package:Autority/theme/AutorityColors.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Autority/Models/report_model.dart';
import 'package:Autority/Providers/report_provider.dart';
import 'package:Autority/Widgets/menu_inferior.dart';
import 'package:maps_launcher/maps_launcher.dart';
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
    final photosProvider = Provider.of<PhotoProvider>(context, listen: false);
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);
    final reportsProvider = Provider.of<ReportProvider>(context, listen: false);
    Future<Report> thereport = reportsProvider.getSingleReport(args);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .10,
        elevation: 0,
        actions: [],
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'DETALLES DEL REPORTE $args',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomSheet: MenuInferior(
        pageIndex: 1,
      ),
      body: FutureBuilder<Report>(
        future: thereport,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            Future<List<Image>> _photos =
                photosProvider.getAllImagesByReportId(snapshot.data.id);
            Future<AccountInfo> ftCreatorUser = _authProvider.getCurrentUser(
                Future.delayed(
                    Duration(seconds: 2), () => snapshot.data.reporterUserID));

            return Center(
              child: Column(
                children: [
                  reportsProvider.getReportIcon(snapshot.data.reportType),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Numero del reporte: ${snapshot.data.id}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.purple,
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
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Reportado por: ',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder<AccountInfo>(
                    future: ftCreatorUser,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.name);
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error cargando el usuario');
                        }
                        if (!snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          return Text('*Sin Usuario*');
                        }
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Reportado el: ${snapshot.data.creationDate}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
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
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                              color: AutorityColors.principal,
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ReportImagesScreen.routeName,
                                  arguments: _photos);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.photo_library_sharp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Imagenes',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                              color: AutorityColors.principal,
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: () {
                              CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.confirm,
                                  title: "Asignacion de caso",
                                  onConfirmBtnTap: () async {
                                    assignCase(
                                        snapshot.data,
                                        await _authProvider.getCurrentUserId(),
                                        reportsProvider);
                                  },
                                  text:
                                      "Estas seguro que quieres atender el ${reportsProvider.getReportLabel(snapshot.data.reportType)} numero ${snapshot.data.id}");
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_police_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Atender',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 10),
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: AutorityColors.principal,
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        onPressed: () {
                          MapsLauncher.launchCoordinates(
                              snapshot.data.ubicacion.latitude,
                              snapshot.data.ubicacion.longitude,
                              reportsProvider
                                  .getReportLabel(snapshot.data.reportType));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Ver en el mapa',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> assignCase(
      Report report, String authorityId, ReportProvider reportsProvider) async {
    bool assigned =
        await reportsProvider.assignToAuthority(report, authorityId);
    if (assigned) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          cancelBtnText: 'No',
          confirmBtnText: 'Vamos!',
          onConfirmBtnTap: () async {
            print('Iniciando Navegacion');

            MapsLauncher.launchCoordinates(
                report.ubicacion.latitude,
                report.ubicacion.longitude,
                reportsProvider.getReportLabel(report.reportType));
            Navigator.pop(context);
          },
          title: 'Iniciar Ruta',
          text:
              "Caso signado correctamente, quieres iniciar la navegacion hacia la ubicacion del reporte?");
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: "Error Asignando el caso",
          title: "Error");
    }
  }
}
