import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/Widget/work_custom_data.dart';

class MobileWork extends StatefulWidget {
  @override
  _MobileWorkState createState() => _MobileWorkState();
}

class _MobileWorkState extends State<MobileWork> {
  final Method method = Method();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height,
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: FaIcon(FontAwesomeIcons.coffee, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                ),
                WorkCustomData(
                  title:
                      "Mobile Application Developer | Workfleek Technologies",
                  subTitle:
                      "I worked here for 3 months on contract. I helped design the architechture for M-gari mobile and led the development team as a sort of pseudo team lead.",
                  duration: "November 2020 - February 2021",
                  urls: [
                    "https://play.google.com/store/apps/details?id=com.workfleek.mgari_flutter",
                    "https://workfleektech.com/"
                  ],
                  method: method,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  child:
                      FaIcon(FontAwesomeIcons.laptopHouse, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                ),
                WorkCustomData(
                  title: "Associate Software Engineer | Finaccess Kenya",
                  subTitle:
                      "I started work as a native android developer and transitioned to work as a backend engineer as my UI skills were lacking. I worked with Spring boot.",
                  duration: "December 2019 - November 2020",
                  urls: ["https://finaccess.co/"],
                  method: method,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "images/icons/motus_icon.png",
                    scale: 6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                ),
                WorkCustomData(
                  title: "Game Developer | Motus Nova [through Andela Kenya]",
                  subTitle:
                      "I helped build and maintain games build with Unity. I was responsible for implementing changes that were required by management. \nMy biggest achievement while working at Motus was working on the company games UI which would go ahead to be used in most of the games.",
                  duration: "April 2019 - November 2019",
                  urls: ["https://motusnova.com/"],
                  method: method,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "images/icons/andela_icon.png",
                    scale: 6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                ),
                Flexible(
                  child: WorkCustomData(
                    title: "Associate Software Engineer | Andela Kenya",
                    subTitle:
                        "At Andela, I was trained to be a proffesional Software Engineer and worked on internal Android Native projects such as Converge(A meeting room management system like Robin) and ART(an asset management system). I got to collaborate with top class Software Engineering talent and learnt a lot from them.",
                    duration: "March 2018 - April 2020",
                    urls: ["https://andela.com/"],
                    method: method,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
          ],
        ),
      ),
    );
  }
}
