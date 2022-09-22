import 'package:flutter/cupertino.dart';

class FlatButton extends StatefulWidget {
  final Function onPressed;
  final Widget child;
  const FlatButton({super.key, required this.onPressed,  required this.child});
  @override
  State<StatefulWidget> createState()=>FlatBtnState();
}

class FlatBtnState extends State<FlatButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         widget.onPressed();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: widget.child,
          )
        ],
      ),
    );
  }
}
