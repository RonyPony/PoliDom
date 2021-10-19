import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polidom/Widgets/menu_inferior.dart';
import 'package:polidom/theme/polidomColors.dart';

import '../assets.dart';
import 'authentication/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'profile';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SvgPicture logout = SvgPicture.asset(
    SvgAssets.logoutIcon,
    color: Colors.purple.withOpacity(.5),
    placeholderBuilder: (context) => CircularProgressIndicator(),
    height: 30,
  );
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SvgPicture profileSvg = SvgPicture.asset(
      SvgAssets.accountIcon,
      color: PolidomColors.secundario,
      placeholderBuilder: (context) => CircularProgressIndicator(),
      height: 80,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(
          'PERFIL',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
                onTap: () async {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.confirm,
                    cancelBtnText: 'No',
                    onConfirmBtnTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.routeName, (route) => false);
                    },
                    confirmBtnText: 'Si',
                    backgroundColor: Colors.blue.withOpacity(.5),
                    title: 'Cerrar Sesion',
                    text: "Estas seguro que quieres cerrar sesion ?",
                  );
                },
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(10, 15),
                        ),
                      ]),
                  child: profileSvg),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(),
                    controller: _nameController,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 2,
      ),
    );
  }
}
