import 'package:covid_19/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
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
                            "assets/icons/Drcorona.svg",
                            fit: BoxFit.fitWidth,
                            width: 230,
                            alignment: Alignment.topCenter,
                          ),
                          Positioned(
                            top: 20,
                            left: 140,
                            child: Text(
                              "All you need\nis stay at home.",
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
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                      child: DropdownButton(
                          underline: SizedBox(),
                          isExpanded: true,
                          value: 'USA',
                          icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                          items: ['USA', 'Japan', 'Kerea']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {}))
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Case Update\n",
                            style: kTitleTextstyle,
                          ),
                          TextSpan(
                            text: "Case Update\n",
                            style: TextStyle(color: kTextLightColor),
                          )
                        ]),
                      ),
                      Spacer(),
                      Text(
                        "See details",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          title: "感染人数",
                          color: kInfectedColor,
                          number: 1024,
                        ),
                        Counter(
                          title: "死亡人数",
                          color: kDeathColor,
                          number: 10,
                        ),
                        Counter(
                          title: "治愈人数",
                          color: kRecovercolor,
                          number: 591,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Spread of Virus", style: kTitleTextstyle),
                      Text(
                        "See details",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: kShadowColor,
                      )
                    ]),
                    child: Image.asset("assets/images/map.png",
                        fit: BoxFit.contain),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int number;
  final String title;
  final Color color;
  const Counter({
    Key key,
    this.number,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: color,
                  width: 2,
                )),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(title, style: kSubTextStyle)
      ],
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
