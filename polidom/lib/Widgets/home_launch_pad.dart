import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLaunchPad extends StatefulWidget {
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final String svg;
  final String onTapRouteName;
  final bool isSmall;
  const HomeLaunchPad(
      {Key key,
      this.subtitle,
      this.title,
      this.backgroundColor,
      this.svg,
      this.onTapRouteName,
      this.isSmall})
      : super(key: key);

  @override
  _HomeLaunchPadState createState() => _HomeLaunchPadState();
}

class _HomeLaunchPadState extends State<HomeLaunchPad> {
  @override
  Widget build(BuildContext context) {
    bool _isSmall;
    if (widget.isSmall != null) {
      _isSmall = widget.isSmall;
    } else {
      _isSmall = false;
    }
    SvgPicture svgPic = SvgPicture.asset(
      widget.svg,
      placeholderBuilder: (context) => CircularProgressIndicator(),
      height: !_isSmall
          ? MediaQuery.of(context).size.height * .08
          : MediaQuery.of(context).size.height * .03,
      width: !_isSmall
          ? MediaQuery.of(context).size.width * .08
          : MediaQuery.of(context).size.width * .03,
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
                  bottom:
                      !_isSmall ? MediaQuery.of(context).size.height * .03 : 0),
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
                        fontSize: !_isSmall ? 20 : 12,
                        color: Colors.black.withOpacity(1),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.subtitle.toUpperCase(),
                    style: TextStyle(
                        fontSize: !_isSmall ? 18 : 10,
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
        height: !_isSmall
            ? MediaQuery.of(context).size.height * .23
            : MediaQuery.of(context).size.height * .15,
        width: !_isSmall
            ? MediaQuery.of(context).size.width * .45
            : MediaQuery.of(context).size.width * .28,
        decoration: BoxDecoration(
            color: Colors.white, //widget.backgroundColor.withOpacity(.3),
            border: Border.all(
              width: 2,
              color: widget.backgroundColor.withOpacity(.3),
            ),
            borderRadius: BorderRadius.all(Radius.circular(18))),
      ),
    );
  }
}
