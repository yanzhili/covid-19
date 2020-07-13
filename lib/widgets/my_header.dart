import 'package:covid_19/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyHeader extends StatelessWidget {
  final String textTop;
  final String textBottom;
  final String image;
  const MyHeader({
    Key key,
    this.textTop,
    this.textBottom,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCliper(),
      child: Container(
          padding: EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
            image: DecorationImage(
              image: AssetImage("assets/images/virus.png"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset("assets/icons/menu.svg"),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    image,
                    fit: BoxFit.fitWidth,
                    width: 230,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20,
                    left: 140,
                    child: Text(
                      "$textTop\n$textBottom",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(),
                ],
              ))
            ],
          )),
    );
  }
}

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
