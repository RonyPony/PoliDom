import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Widgets/menu_inferior.dart';

class ReportImagesScreen extends StatefulWidget {
  static String routeName = 'Report-image-screen';
  const ReportImagesScreen({Key key}) : super(key: key);

  @override
  _ReportImagesScreenState createState() => _ReportImagesScreenState();
}

class _ReportImagesScreenState extends State<ReportImagesScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    Future<List<Image>> _photos = args;
    return Scaffold(
      appBar: AppBar(
        title: Text('Adjuntos del caso'),
        backgroundColor: Colors.red.withOpacity(.5),
        toolbarHeight: 100,
      ),
      bottomSheet: MenuInferior(
        pageIndex: 1,
      ),
      body: FutureBuilder<List<Image>>(
        future: _photos,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length == 0) {
              return Column(
                children: [
                  Center(
                      child: Icon(
                    Icons.photo_camera_back,
                    size: 190,
                    color: Colors.grey,
                  )),
                  Center(
                    child: Text(
                      'Ups !',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'roboto',
                          color: Colors.grey),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Este reporte no tiene imagenes adjuntas',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'roboto',
                          color: Colors.grey),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height * 2,
                child: ListView.builder(
                  itemBuilder: (BuildContext ctx, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SafeArea(
                          child: Column(
                            children: <Widget>[
                              snapshot.data[index],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              );
            }
          } else {
            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return Text("Este reporte no tiene imagenes adjuntas");
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasError) {
              return Text("Error obteniendo las imagenes de este reporte");
            }
            return Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text('Cargando imagenes del reporte')
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
