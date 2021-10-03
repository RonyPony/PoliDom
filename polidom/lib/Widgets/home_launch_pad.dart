import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets.dart';

class HomeLaunchPad extends StatefulWidget {
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final String svg;
  final String onTapRouteName;
  const HomeLaunchPad({
    Key key,
    this.subtitle,
    this.title,
    this.backgroundColor,
    this.svg,
    this.onTapRouteName,
  }) : super(key: key);

  @override
  _HomeLaunchPadState createState() => _HomeLaunchPadState();
}

class _HomeLaunchPadState extends State<HomeLaunchPad> {
  @override
  Widget build(BuildContext context) {
    SvgPicture svgPic = SvgPicture.asset(
      widget.svg,
      placeholderBuilder: (context) => CircularProgressIndicator(),
      height: MediaQuery.of(context).size.height * .08,
    );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.onTapRouteName);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * .1,
                  bottom: MediaQuery.of(context).size.height * .03),
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      // color: widget.backgroundColor.withOpacity(.2),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: svgPic),
            ),
            Container(
              padding: EdgeInsets.all(10),
              // margin:
              //     EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
              child: Column(
                children: [
                  Text(
                    widget.title.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(1),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.subtitle.toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        color: widget.backgroundColor.withOpacity(0.7)),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: widget.backgroundColor.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(7))),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * .23,
        width: MediaQuery.of(context).size.width * .45,
        decoration: BoxDecoration(
            color: Colors.white, //widget.backgroundColor.withOpacity(.3),
            border: Border.all(
              width: 0,
              color: widget.backgroundColor.withOpacity(.3),
            ),
            borderRadius: BorderRadius.all(Radius.circular(18))),
      ),
    );
  }
}
