import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Models/account_to_login_model.dart';
import 'package:polidom/Providers/auth_provider.dart';
import 'package:polidom/Screens/authentication/register_screen.dart';
import 'package:provider/provider.dart';

import '../../assets.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login-screen';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController(text: "dfvxbfgcv@1.com");
  TextEditingController _pass = TextEditingController(text: "12345678910");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('images/icon/icon.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _pass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.loading,
                      backgroundColor: Colors.black.withOpacity(.5),
                      title: "Espere",
                      flareAsset: Assets.logo,
                      text: "Cargando...");
                  final authProvider =
                      Provider.of<AuthProvider>(context, listen: false);
                  if (_email.text.length >= 1 && _pass.text.length >= 1) {
                    AccountToLogin loginInfo = AccountToLogin(
                        email: _email.text, password: _pass.text);
                    if (await authProvider.login(loginInfo, context)) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.routeName, (route) => false);
                    }
                  }
                },
                child: Text(
                  'Login',
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
}
