import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/Widget/CustomText.dart';
import 'package:potrtfolio/Widget/work_custom_data.dart';

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  Method method = Method();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            left: 15,
            bottom: 0,
            // right: 2,
            top: 0,
            child: VerticalDivider(
              color: Color(0xff64FFDA),
              thickness: 1.75,
              width: 10,
              indent: 50,
              endIndent: 10,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "03.",
                    textsize: 20.0,
                    color: Color(0xff61F9D5),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  CustomText(
                    text: "My work experience",
                    textsize: 26.0,
                    color: Color(0xffCCD6F6),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(

                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "images/icons/thejitu.png",
                          scale: 6,
                           fit: BoxFit.fill,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                      ),
                      WorkCustomData(
                        title:
                            "Software Engineer | TheJitu",
                        subTitle:
                            "Currently working at TheJitu as a Full Stack developer. Leveraging Spring Boot Java microservices and a ReactJs Frontend.",
                        duration: "August 2021 - Present",
                        urls: [
                          "https://thejitu.com/"
                        ],
                        method: method,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "images/icons/upwork_icon.png",
                          scale: 6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                      ),
                      WorkCustomData(
                        title:
                            "Mobile Application Developer | Upwork",
                        subTitle:
                            "I offer consultation services. Mainly developing cross-platform mobile applications. Feel free to contact me there.",
                        duration: "February 2021 - Present",
                        urls: [
                          "https://www.upwork.com/freelancers/~0141ac78cabeab07fa"
                          
                        ],
                        method: method,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: FaIcon(FontAwesomeIcons.coffee,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                      ),
                      WorkCustomData(
                        title:
                            "Mobile Application Developer | Workfleek Technologies",
                        subTitle:
                            "I worked here for 3 months on contract. I helped design the architecture for M-gari mobile and led the development team as a sort of pseudo team lead.",
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
                        child: FaIcon(FontAwesomeIcons.laptopHouse,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                      ),
                      WorkCustomData(
                        title: "Associate Software Engineer | Finaccess Kenya",
                        subTitle:
                            "I started work as a native android developer and transitioned to work as a Spring Boot backend engineer to help offload application work serverside.",
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
                        title:
                            "Game Developer | Motus Nova [through Andela Kenya]",
                        subTitle:
                            "I helped build and maintain games build with Unity. I was responsible for implementing changes" +
                             "that were required by management. \nMy biggest achievement while working at Motus was working on the company games UI which would go ahead to be used in most of the games. I learned about the singleton pattern here :)",
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
