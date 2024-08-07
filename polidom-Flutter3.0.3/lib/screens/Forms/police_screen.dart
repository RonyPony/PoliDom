import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom2/models/user_location_model.dart';
import 'package:polidom2/providers/location_provider.dart';
import 'package:polidom2/providers/report_provider.dart';
import 'package:polidom2/screens/Forms/pickup_location_screen.dart';
import 'package:provider/provider.dart';

import '../../Widgets/flatBtn.dart';
import '../../Widgets/menu_inferior.dart';
import '../../models/image_upload_model.dart';
import '../../models/report_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/photo_provider.dart';

class PoliceFormScreen extends StatefulWidget {
  static String routeName = 'PoliceForm';
  const PoliceFormScreen({Key? key}) : super(key: key);

  @override
  _PoliceFormScreenState createState() => _PoliceFormScreenState();
}

class _PoliceFormScreenState extends State<PoliceFormScreen> {
  bool _annony = false;

  int? _reportType;
  List<File> imagesFiles = [];
  String? _selectedLocation = 'Toca para seleccionar la ubicacion del reporte';
  String? _reportDescription;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    _reportType = args as int?;
    final reportsProvider = Provider.of<ReportProvider>(context, listen: false);
    print(reportsProvider.getReportLabel(args));
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo ${reportsProvider.getReportLabel(args)}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildReportDetailSection(),
            buildProofFileSection(),
            buildMapSection(),
            buildSendBtn()
          ],
        ),
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 0,
      ),
    );
  }

  buildReportDetailSection() {
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
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // set border color
                        width: 0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // set rounded corner radius
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    onChanged: (value) {
                      _reportDescription = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Detalles del caso',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      validateAnn();
                    });
                  },
                  child: Chip(
                      avatar: _annony
                          ? Icon(
                              Icons.done_outline_outlined,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.blur_circular_rounded,
                              color: Colors.red,
                            ),
                      backgroundColor: !_annony ? Colors.grey : Colors.green,
                      label: Text('Enviar de forma anonima')),
                )
              ],
            ))
          ],
        ),
        height: MediaQuery.of(context).size.height * .35,
        width: MediaQuery.of(context).size.width * .95,
      ),
    );
  }

  // Future<List<AssetEntity>> pickAsset() async {
  //   List<AssetEntity> imgList = await PhotoPicker.pickAsset(
  //     context: context,
  //     // BuildContext requied

  //     /// The following are optional parameters.
  //     themeColor: Colors.blueAccent[100],
  //     // the title color and bottom color
  //     padding: 1.0,
  //     // item padding
  //     dividerColor: Colors.white,
  //     // divider color
  //     disableColor: Colors.grey.shade300,
  //     // the check box disable color
  //     itemRadio: 0.88,
  //     // the content item radio
  //     maxSelected: 3,

  //     // max picker image count
  //     provider: I18nProvider.english,
  //     // i18n provider ,default is chinese. , you can custom I18nProvider or use ENProvider()
  //     rowCount: 5,
  //     // item row count
  //     textColor: Colors.white,
  //     // text color
  //     thumbSize: 150,

  //     // preview thumb size , default is 64
  //     sortDelegate: SortDelegate.common,
  //     // default is common ,or you make custom delegate to sort your gallery
  //     checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
  //       activeColor: Colors.white,
  //       unselectedColor: Colors.white,
  //       checkColor: Colors.blue,
  //     ), // default is DefaultCheckBoxBuilderDelegate ,or you make custom delegate to create checkbox

  //     badgeDelegate: const DefaultBadgeDelegate(),

  //     /// or custom class extends [BadgeDelegate]

  //     pickType: PickType.all, // all/image/video

  //     //List<AssetPathEntity> photoPathList, /// when [photoPathList] is not null , [pickType] invalid .
  //   );
  //   return imgList;
  // }

  buildMapSection() {
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
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () async {
          final locationProvider =
              Provider.of<LocationProvider>(context, listen: false);
          await Navigator.pushNamed(
              context, SelectExactLocationScreen.routeName);
          if (locationProvider.wasSaved) {
            Map loc = await locationProvider.getSelectedAddress();
            UserLocation locacion = getLocationFromMap(loc);
            setState(() {
              _selectedLocation =
                  "Direccion: ${locacion.txtdireccion} \nProvincia: ${locacion.provincia} \nLocalidad: ${locacion.localidad} \nSector: ${locacion.sector}\nCodigo Postal: ${locacion.zipCode} \nPais: ${locacion.pais}";
            });
          }
        },
        child: Container(
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.orange, // set border color
                            width: 0), // set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)), // set rounded corner radius
                      ),
                      child: Row(
                        children: [
                          SizedBox(),
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.blue,
                            size: 50,
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_selectedLocation!),
                  )
                ],
              ))
            ],
          ),
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .95,
        ),
      ),
    );
  }

  buildProofFileSection() {
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
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.orange, // set border color
                          width: 0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                    ),
                    child: Row(
                      children: [
                        imagesFiles.length >= 1
                            ? Container(
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * .72,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imagesFiles.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              imagesFiles.removeAt(index);
                                            });
                                          },
                                          child: Image.file(
                                            imagesFiles[index],
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                3,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(),
                        GestureDetector(
                          onTap: () async {
                            // List<AssetEntity> images = await pickAsset();
                            // images.forEach((element) async {
                            //   print('##################################');
                            //   print("ID: ${element.id}");
                            //   print(
                            //       "createDateTime: ${element.createDateTime}");
                            //   print("title: ${element.title}");
                            //   print("type: ${element.type}");
                            //   print("longitude: ${element.longitude}");
                            //   print("latitude: ${element.latitude}");
                            //   print("size: ${element.size}");
                            //   print("file: ${await element.file}");
                            //   print("typeInt: ${element.typeInt}");
                            //   print('##################################');
                            //   imagesFiles.add(await element.file);
                            // });
                            print(imagesFiles);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 50,
                          ),
                        )
                      ],
                    )),
                imagesFiles.length >= 1
                    ? Text('Toca la imagen para remover')
                    : SizedBox()
              ],
            ))
          ],
        ),
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width * .95,
      ),
    );
  }

  buildSendBtn() {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(.5),
          borderRadius: BorderRadius.circular(20)),
      child: FlatButton(
        onPressed: () async {
          final authProvider =
              Provider.of<AuthProvider>(context, listen: false);
          final locationProvider =
              Provider.of<LocationProvider>(context, listen: false);
          final reportsProvider =
              Provider.of<ReportProvider>(context, listen: false);

          final photoProvider =
              Provider.of<PhotoProvider>(context, listen: false);
          if (locationProvider.wasSaved) {
            List<ImageUpload> _photos = <ImageUpload>[];
            imagesFiles.forEach((element) {
              ImageUpload info =
                  ImageUpload(reportId: 1, photo: File(element.path));
              _photos.add(info);
            });
            Map loc = await locationProvider.getSelectedAddress();
            final UserLocation locacion = getLocationFromMap(loc);
            Report policeReport = Report();
            policeReport.creationDate = DateTime.now().toString();
            policeReport.description = _reportDescription;
            policeReport.reportType = _reportType;
            policeReport.reporterUserID = await authProvider.getCurrentUserId();
            policeReport.ubicacion = locacion;
            photoProvider.saveImage(_photos, context);
            reportsProvider.placePoliceReport(policeReport, context);
          } else {
            print('No locations selected');
          }
        },
        child: Text(
          'Enviar Reporte',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget checkbox(
      {String? title, bool? initValue, Function(bool boolValue)? onChanged}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title!),
          Checkbox(value: initValue, onChanged: (b) => onChanged!(b!))
        ]);
  }

  void validateAnn() {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        onConfirmBtnTap: () {
          _annony = true;
          Navigator.pop(context);
          setState(() {});
        },
        onCancelBtnTap: () {
          _annony = false;
          setState(() {});
          Navigator.pop(context);
        },
        confirmBtnColor: Colors.red,
        title: "",
        cancelBtnText: "NO",
        confirmBtnText: "SI",
        barrierDismissible: true,
        text: "Quiere enviar este reporte anonimamente?");
  }
}
