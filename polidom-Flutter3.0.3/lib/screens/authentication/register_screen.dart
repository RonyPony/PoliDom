import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/flatBtn.dart';
import '../../models/account_to_register.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = 'registerScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //   String name;
  // String email;
  // String password;
  // String phoneNumber;
  // String country;
  // String location;
  // String province;
  // String textDirection;
  // String zipCode;
  // String sector;
  // UserRoleType role;
  // DateTime registerDate;
  // DateTime bornDate;
  TextEditingController _nombre = TextEditingController();
  TextEditingController _apellidos = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password1 = TextEditingController();
  TextEditingController _password2 = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _bornDate = TextEditingController();
  AccountToRegister _newUser = AccountToRegister();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 15),
              child: Center(
                child: Container(
                    width: 80,
                    height: 80,
                    child: Image.asset('images/icon/icon.png')),
              ),
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
                controller: _password1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Clave',
                    hintText: 'Introduzca su clave'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                controller: _password2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Rep. Clave',
                    hintText: 'Reintroduzca  su clave'),
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cedula',
                    hintText: 'Introduzca su Numero de cedula'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  final authProvider =
                      Provider.of<AuthProvider>(context, listen: false);
                  List<String> errores = validate();
                  if (errores.length >= 1) {
                    showNotCompleteDialog(errores);
                  } else {
                    if (!await authProvider.userExistence(_email.text)) {
                      _newUser.email = _email.text;
                      _newUser.bornDate = DateTime.now().toString();
                      _newUser.registerDate = DateTime.now().toString();
                      _newUser.name = _nombre.text;
                      _newUser.password = _password1.text;
                      _newUser.userName = _nombre.text;
                      _newUser.role = 0; //UserRoleType.admin;
                      // _newUser.registerDate = DateTime.now();
                      await authProvider.register(_newUser, context);
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
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            GestureDetector(
              child: Text('New User? Create Account'),
              onTap: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }

  List<String> validate() {
    List<String> fields = [];
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
    if (_password2.text.length <= 1) {
      fields.add("Reingresar Clave no puede estar vacio");
    }
    if (_password1.text != _password2.text) {
      fields.add("Las Claves no coinciden");
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
  
  
}


