import 'package:covid_19/constants.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "症状",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SymptomCard(
                        image: "assets/images/headache.png",
                        title: "Headache",
                        isActive: true,
                      ),
                      SymptomCard(
                        image: "assets/images/fever.png",
                        title: "Fever",
                      ),
                      SymptomCard(
                        image: "assets/images/caugh.png",
                        title: "Caugh",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("如何预防", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PrvitionCard(
                    text:
                        "Since the start of the coronavirus outbreak \n some places have fully embraced wearing facemasks",
                    title: "Wear face mask",
                    image: "assets/images/wear_mask.png",
                  ),
                  PrvitionCard(
                    text:
                        "Since the start of the coronavirus outbreak \n some places have fully embraced wash hands",
                    title: "Wash your hands",
                    image: "assets/images/wash_hands.png",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PrvitionCard extends StatelessWidget {
  final String title;
  final String image;
  final String text;
  const PrvitionCard({
    Key key,
    this.title,
    this.image,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 157,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 24,
                      color: kShadowColor,
                    )
                  ]),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: kTitleTextstyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/forward.svg"),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: kActiveShadowColor,
                  )
                : BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: kShadowColor,
                  )
          ]),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
