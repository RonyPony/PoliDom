import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Widgets/menu_inferior.dart';

class PoliceFormScreen extends StatefulWidget {
  static String routeName = 'PoliceForm';
  const PoliceFormScreen({Key key}) : super(key: key);

  @override
  _PoliceFormScreenState createState() => _PoliceFormScreenState();
}

class _PoliceFormScreenState extends State<PoliceFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Policial'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [buildReportDetailSection(), buildProofFileSection()],
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
                    decoration: InputDecoration(
                      hintText: 'Detalles del caso',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .95,
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
                    child: GestureDetector(
                      onTap: () async {
                        FilePickerResult result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File file = File(result.files.single.path);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Text('Click'),
                    ))
              ],
            ))
          ],
        ),
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .95,
      ),
    );
  }
}
