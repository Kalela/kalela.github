import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Widget/CustomText.dart';
import 'package:potrtfolio/Widget/work_custom_data.dart';

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.4,
      ),
      child: Column(
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
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                width: size.width / 4,
                height: 1.10,
                color: Color(0xff303C55),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: size.height * 1.2,
                  child: Stepper(
                    steps: [
                      Step(
                        title: Text(
                          "Workfleek Technologies",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0xffCCD6F6),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: Row(
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
                              title:
                                  "Mobile Apllication Developer | Workfleek Technologies",
                              subTitle:
                                  "I helped build and maintain games with Unity. ",
                              duration: "November 2020 - February 2021",
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: Text(
                          "Finaccess Kenya",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0xffCCD6F6),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: Row(
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
                              title:
                                  "Associate Software Engineer | Finaccess Kenya",
                              subTitle:
                                  "I helped build and maintain games build with Unity. ",
                              duration: "December 2019 - November 2020",
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: Text(
                          "Motus Nova [through Andela Kenya]",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0xffCCD6F6),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: Row(
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
                              title:
                                  "Game Developer | Motus Nova [through Andela Kenya]",
                              subTitle:
                                  "I helped build and maintain games build with Unity. ",
                              duration: "April 2019 - November 2019",
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: Text(
                          "Andela Kenya",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0xffCCD6F6),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: FaIcon(FontAwesomeIcons.laptopHouse,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                            ),
                            Flexible(
                              child: WorkCustomData(
                                title:
                                    "Associate Software Engineer | Andela Kenya",
                                subTitle:
                                    "At Andela, I was trained to be a proffesional Software Engineer and worked on internal Android Native projects such as Converge(A meeting room management system like Robin) and ART(an asset management system). I got to collaborate with top class Software Engineering talent and learnt a lot from them.",
                                duration: "March 2018 - April 2020",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
