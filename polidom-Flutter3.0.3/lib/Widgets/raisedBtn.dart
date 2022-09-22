import 'package:flutter/material.dart';

class RaisedButton extends StatefulWidget{
  final Widget child;
  final Function onPressed;

  const RaisedButton({super.key, required this.onPressed, required this.child});
  @override
  State<StatefulWidget> createState()=>RaisedButtonState();

}

class RaisedButtonState extends State<RaisedButton>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
