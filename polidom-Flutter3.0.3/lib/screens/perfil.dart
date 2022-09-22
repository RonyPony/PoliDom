// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key key}) : super(key: key);

// super.init
//   @override
//   Widget build(BuildContext context) {

//     return Container();
//   }

// }

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Widgets/flatBtn.dart';
import '../Widgets/menu_inferior.dart';
import '../assets.dart';
import '../models/account_info_model.dart';
import '../models/account_to_update_model.dart';
import '../providers/auth_provider.dart';
import '../theme/polidom_colors.dart';
import 'authentication/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'profile';
  const ProfileScreen({Key? key}) : super(key: key);

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
  Future<String>? _userId;
  Future<String>? _userEmail;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nombre = TextEditingController();
  TextEditingController _apellidos = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password1 = TextEditingController();
  TextEditingController _userType = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _bornDate = TextEditingController();
  Future<AccountInfo>? _currentUser;

  List<String> validate() {
    List<String> fields = <String>[];
    if (_nombre.text.length <= 1) {
      fields.add("Nombre no puede estar vacio");
    }
    if (_apellidos.text.length <= 1) {
      fields.add("Apellidos no puede estar vacio");
    }
    if (_email.text.length <= 1) {
      fields.add("Correo Electronico no puede estar vacio");
    }
    if (_phoneNumber.text.length <= 1) {
      fields.add("Numero Telefonico no puede estar vacio");
    }
    if (_password1.text.length <= 1) {
      fields.add("Clave no puede estar vacio");
    }
    return fields;
  }

  showNotCompleteDialog(List<String> field) {
    String fields = "";
    field.forEach((element) {
      fields += '\n *$element *'.toUpperCase();
    });
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      confirmBtnText: 'Entendido',
      backgroundColor: Colors.blue.withOpacity(.5),
      title: 'Formulario Incompleto',
      text: "El formulario de registro contiene los siguientes errores $fields",
    );
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    _userId = userProvider.getCurrentUserId();
    _userEmail = userProvider.getCurrentUserEmail();
    _currentUser = userProvider.getCurrentUser(_userId!);
  }

  @override
  Widget build(BuildContext context) {
    AccountToUpdate _updateUser = AccountToUpdate();
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
      body: FutureBuilder<AccountInfo>(
        future: _currentUser,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            _nombre.text = snapshot.data!.name!;
            _email.text = snapshot.data!.email!;
            _userType.text = snapshot.data!.role.toString();
            _phoneNumber.text = snapshot.data!.phoneNumber;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                    child: Center(
                        child: Icon(
                      Icons.person_pin,
                      size: 100,
                      color: Colors.red.withOpacity(.5),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: _nombre,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre',
                          hintText: 'Introduzca su Nombre'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: _apellidos,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Apellidos',
                          hintText: 'Introduzca sus apellidos'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Correo',
                          hintText: 'Introduzca su correo'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: _userType,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tipo de usuario',
                          hintText: 'Tipo de usuario'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: _phoneNumber,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Numero Telefonico',
                          hintText: 'Introduzca su numero telefonico'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cedula',
                          hintText: 'Introduzca su Numero de cedula'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () async {
                        final authProvider =
                            Provider.of<AuthProvider>(context, listen: false);
                        List<String> errores = validate();
                        if (errores.length >= 1) {
                          showNotCompleteDialog(errores);
                        } else {
                          if (!await authProvider.userExistence(_email.text)) {
                            _updateUser.email = _email.text;
                            _updateUser.bornDate = DateTime.now().toString();
                            _updateUser.registerDate =
                                DateTime.now().toString();
                            _updateUser.name = _nombre.text;
                            _updateUser.password = _password1.text;
                            _updateUser.userName = _nombre.text;
                            _updateUser.role = 0; //UserRoleType.admin;
                            // _updateUser.registerDate = DateTime.now();
                            await authProvider.update(_updateUser, context);
                            // "name": "ronel",
                            // "userName":"roro",
                            // "email":"correo@correo.com",
                            // "password": "12345678910",
                            // "registerDate": "2021-10-13 18:47:02.649257",
                            // "role":"1"
                          }
                        }
                      },
                      child: Text(
                        'Actualizar',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 2,
      ),
    );
  }
}
