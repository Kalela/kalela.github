import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/Widget/CustomText.dart';
import 'package:potrtfolio/Widget/MobileProject.dart';
import 'package:potrtfolio/Widget/MobileWork.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.briefcase,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Method method = Method();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A192F),
      endDrawer: Drawer(
          elevation: 6.0,
          child: Container(
            color: Color(0xff0A192F),
            child: ListView(
              children: [
                Padding(padding: const EdgeInsets.only(top: 50)),
                InkWell(
                  onTap: () {
                    _scrollToIndex(0);
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    title: Text(
                      "About Me",
                      style: TextStyle(color: Color(0xff64FFDA)),
                    ),
                    leading: Icon(
                      FontAwesomeIcons.info,
                      color: Color(0xff64FFDA),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _scrollToIndex(1);
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.building,
                      color: Color(0xff64FFDA),
                    ),
                    title: Text(
                      "Clients/Projects",
                      style: TextStyle(color: Color(0xff64FFDA)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _scrollToIndex(2);
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.briefcase,
                      color: Color(0xff64FFDA),
                    ),
                    title: Text(
                      "Work Experience",
                      style: TextStyle(color: Color(0xff64FFDA)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _scrollToIndex(3);
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Color(0xff64FFDA),
                    ),
                    title: Text(
                      "Contact Us",
                      style: TextStyle(color: Color(0xff64FFDA)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 100),
                  child: InkWell(
                    hoverColor: Color(0xff64FFDA).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4.0),
                    onTap: () {
                      method.launchURL(
                          "https://drive.google.com/file/d/15WCOCk1XYTcfEyuV-jimGNtvY3UvuLv9/view?usp=sharing");
                    },
                    child: Container(
                      margin: EdgeInsets.all(0.85),
                      height: size.height * 0.07,
                      width: size.height * 0.20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff64FFDA),
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Text(
                          "Resume/CV",
                          style: TextStyle(
                            color: Color(0xff64FFDA),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      appBar: AppBar(
        backgroundColor: Color(0xff0A192F),
        elevation: 0.0,
        title: IconButton(
          icon: Icon(
            FontAwesomeIcons.caretSquareUp,
            size: 32.0,
            color: Color(0xff64FFDA),
          ),
          onPressed: () {
            _scrollToIndex(0);
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _autoScrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomText(
                text: "Hi, my name is",
                textsize: 16.0,
                color: Color(0xff41FBDA),
                letterSpacing: 3.0,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomText(
                text: "Philip Kalela.",
                textsize: 52.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w900,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomText(
                text: "Welcome to my little corner on the internet.",
                textsize: 42.0,
                color: Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  children: [
                    Text(
                      "I'm a Software Engineer based in Nairobi, KE specialized in \nbuilding exceptional mobile applications.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        letterSpacing: 2.75,
                        wordSpacing: 0.75,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              InkWell(
                onTap: () {
                  method.launchEmail();
                },
                hoverColor: Color(0xff64FFDA).withOpacity(0.2),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0.75),
                  height: 56.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: Color(0xff64FFDA),
                    ),
                  ),
                  child: Text(
                    "Get In Touch",
                    style: TextStyle(
                      color: Color(0xff64FFDA),
                      letterSpacing: 2.75,
                      wordSpacing: 1.0,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.08,
              ),

              //About me
              _wrapScrollTag(
                index: 0,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    width: size.width,
                    child: Column(
                      children: [
                        //About me title
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "01.",
                              textsize: 20.0,
                              color: Color(0xff61F9D5),
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            CustomText(
                              text: "About Me",
                              textsize: 26.0,
                              color: Color(0xffCCD6F6),
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
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

                        //About me desc
                        Wrap(
                          children: [
                            CustomText(
                              text:
                                  "Hello! I'm Philip, a Software Engineer based in Nairobi, KE.\n\nI enjoy creating optimal business solutions through software. My goal is to provide value to my clients by providing expertise in perfomant, robust, maintainable and above all highly valuable products.\n\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                            CustomText(
                              text:
                                  "I am currenly studying to receive Google certification as an Android native developer. I am also working with freelance clients while seeking permanent employment that I would enjoy.\n\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                            CustomText(
                              text:
                                  "Here are a few technologies I've been working with recently:\n\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size.height * 0.06,
                        ),

                        Container(
                          width: size.width,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  technology(context, "Dart"),
                                  technology(context, "Flutter"),
                                  technology(context, "Android Native"),
                                  technology(context, "Kotlin"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  technology(context, "Java"),
                                  technology(context, "Spring Boot"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.08,
              ),

              //Image
              Center(
                child: Container(
                  height: size.height * 0.6,
                  width: size.width * 0.7,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        right: 20,
                        left: 50.0,
                        child: Card(
                          color: Color(0xff61F9D5),
                          child: Container(
                            margin: EdgeInsets.all(2.75),
                            height: size.height * 0.45,
                            width: size.width * 0.66,
                            color: Color(0xff0A192F),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          method.launchURL(
                              "https://www.linkedin.com/in/philip-kalela-18b7b414b/");
                        },
                        child: Container(
                          height: size.height * 0.5,
                          width: size.width * 0.6,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/download.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Some Things I've Built title
              _wrapScrollTag(
                index: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "02.",
                      textsize: 20.0,
                      color: Color(0xff61F9D5),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    CustomText(
                      text: "Some of my clients/work",
                      textsize: 26.0,
                      color: Color(0xffCCD6F6),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Container(
                      width: size.width * 0.04,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                image: "images/work/jay_fm_splash.png",
                playStorUrl:
                    "https://play.google.com/store/apps/details?id=com.kalela.jay_fm_flutter",
                githubUrl: "https://github.com/Kalela/JayFmFlutter",
                projectDescription:
                    "Jay Fun Media is a local media provider taking the leap to change your content consumption through mobile and internet streaming. Presenting the Jay FM application. Enjoy a variety of music and podcasts brought to you by Jay Fun Media. I was the sole developer on this one. The UI design was inspired by CliffCentral. It features refreshing audio experiences from Kenyan content creators.",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                image: "images/work/hooli_tours_splash.png",
                playStorUrl:
                    "https://play.google.com/store/apps/details?id=com.hoolitours",
                githubUrl: null,
                projectDescription:
                    "Hooli Tours is a tours company that enables users to quickly buy tickets for tours in Kenya.",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Where I've Worked title
              _wrapScrollTag(
                index: 2,
                child: Row(
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
                      text: "Where I've Worked",
                      textsize: 26.0,
                      color: Color(0xffCCD6F6),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Container(
                      width: size.width * 0.08,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileWork(),

              SizedBox(
                height: size.height * 0.07,
              ),

              _wrapScrollTag(
                index: 3,
                child: Container(
                  width: size.width,
                  height: size.height,
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "04. What's Next?",
                          textsize: 16.0,
                          color: Color(0xff41FBDA),
                          letterSpacing: 3.0,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        CustomText(
                          text: "Get In Touch",
                          textsize: 42.0,
                          color: Colors.white,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              "Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                letterSpacing: 0.75,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        InkWell(
                          onTap: () {
                            method.launchEmail();
                          },
                          hoverColor: Color(0xff64FFDA).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0),
                          child: Container(
                            margin: EdgeInsets.all(0.85),
                            height: size.height * 0.10,
                            width: size.width * 0.30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff64FFDA),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                "Say Hello",
                                style: TextStyle(
                                  color: Color(0xff64FFDA),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "images/icons/upwork_icon.png",
                      scale: 25,
                    ),
                    color: Color(0xffffA8B2D1),
                    iconSize: 16.0,
                    onPressed: () {
                      method.launchURL(
                          "https://www.upwork.com/freelancers/~0141ac78cabeab07fa");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: () {
                      method.launchURL("https://github.com/Kalela");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: () {
                      method.launchURL(
                          "https://www.linkedin.com/in/philip-kalela-18b7b414b/");
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.phone),
                    color: Color(0xffffA8B2D1),
                    iconSize: 16.0,
                    onPressed: () {
                      method.launchCaller();
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.envelope),
                    color: Color(0xffffA8B2D1),
                    iconSize: 16.0,
                    onPressed: () {
                      method.launchEmail();
                    },
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Footer
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Designed by "),
                      TextSpan(
                        text: "Tushar Nikam",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            method.launchURL("https://champ96k.github.io/#/");
                          },
                      ),
                      TextSpan(
                          text:
                              " modified for self by Philip Kalela 💙 Flutter")
                    ],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      letterSpacing: 1.75,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
