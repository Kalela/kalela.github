import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/UI/About.dart';
import 'package:potrtfolio/UI/FeatureProject.dart';
import 'package:potrtfolio/UI/Work.dart';
import 'package:potrtfolio/Widget/AppBarTitle.dart';
import 'package:potrtfolio/Widget/CustomText.dart';
import 'package:potrtfolio/Widget/MainTiitle.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A192F),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.caretSquareUp,
                      size: 32.0,
                      color: Color(0xff64FFDA),
                    ),
                    onPressed: () {
                      _scrollToIndex(0);
                    }),
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DefaultTabController(
                      length: 4,
                      child: TabBar(
                        indicatorColor: Colors.transparent,
                        onTap: (index) async {
                          _scrollToIndex(index);
                        },
                        tabs: [
                          Tab(
                            child: AppBarTitle(
                              text: 'About',
                            ),
                          ),
                          Tab(
                            child: AppBarTitle(
                              text: 'Clients/Projects',
                            ),
                          ),
                          Tab(
                            child: AppBarTitle(
                              text: 'Work Experience',
                            ),
                          ),
                          Tab(
                            child: AppBarTitle(
                              text: 'Contact Us',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  hoverColor: Color(0xff64FFDA).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.0),
                  onTap: () {
                    method.launchURL(
                        "https://philip-kalela-resume.s3.amazonaws.com/Philip+Kalela+Resume.pdf");
                  },
                  child: Container(
                    // margin: EdgeInsets.all(0.85),
                    height: 50,
                    width: 200,
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
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              primary: true,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //Mavigation Bar

                  Row(
                    children: [
                      //Social Icon
                      Container(
                        width: size.width * 0.09,
                        height: size.height - 82,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                              icon: FaIcon(FontAwesomeIcons.github),
                              color: Color(0xffffA8B2D1),
                              iconSize: 16.0,
                              onPressed: () {
                                method.launchURL("https://github.com/Kalela");
                              },
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.linkedin),
                              color: Color(0xffffA8B2D1),
                              onPressed: () {
                                method.launchURL(
                                    "https://www.linkedin.com/in/philip-kalela-18b7b414b/");
                              },
                              iconSize: 16.0,
                            ),
                            IconButton(
                                icon: Icon(FontAwesomeIcons.phone),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  method.launchCaller();
                                }),
                            IconButton(
                                icon: Icon(FontAwesomeIcons.envelope),
                                color: Color(0xffffA8B2D1),
                                iconSize: 16.0,
                                onPressed: () {
                                  method.launchEmail();
                                }),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                height: size.height * 0.20,
                                width: 2,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: size.height - 82,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomScrollView(
                              controller: _autoScrollController,
                              slivers: <Widget>[
                                SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * .06,
                                          ),
                                          CustomText(
                                            text: "Hello There, my name is",
                                            textsize: 16.0,
                                            color: Color(0xff41FBDA),
                                            letterSpacing: 3.0,
                                          ),
                                          SizedBox(
                                            height: 6.0,
                                          ),
                                          CustomText(
                                            text: "Philip Kalela.",
                                            textsize: 68.0,
                                            color: Color(0xffCCD6F6),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          SizedBox(
                                            height: 4.0,
                                          ),
                                          CustomText(
                                            text:
                                                "Welcome to my little corner on the internet.",
                                            textsize: 56.0,
                                            color: Color(0xffCCD6F6)
                                                .withOpacity(0.6),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          SizedBox(
                                            height: size.height * .04,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "I'm a Software Engineer based in Nairobi, KE \nbuilding exceptional software solutions.",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16.0,
                                                  letterSpacing: 2.75,
                                                  wordSpacing: 0.75,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * .12,
                                          ),

                                          //get in tuch text
                                          InkWell(
                                            onTap: () {
                                              method.launchEmail();
                                            },
                                            hoverColor: Color(0xff64FFDA)
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: size.height * 0.09,
                                              width: size.width * 0.14,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff64FFDA),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
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
                                            height: size.height * 0.20,
                                          ),
                                        ],
                                      ),

                                      //About Me
                                      _wrapScrollTag(
                                        index: 0,
                                        child: About(),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),

                                      //Some Things I've Built Main Project
                                      _wrapScrollTag(
                                        index: 1,
                                        child: Column(
                                          children: [
                                            MainTiitle(
                                              number: "02.",
                                              text: "Some of my clients/work",
                                            ),
                                            SizedBox(
                                              height: size.height * 0.04,
                                            ),
                                            FeatureProject(
                                              imagePath:
                                                  "images/work/jay_fm_splash.png",
                                              githubUrl:
                                                  "https://github.com/Kalela/JayFmFlutter",
                                              playStorUrl:
                                                  "https://play.google.com/store/apps/details?id=com.kalela.jay_fm_flutter",
                                              projectDesc:
                                                  "Jay Fun Media is a local media provider taking the leap to change your content consumption through mobile and internet streaming. Presenting the Jay FM application. Enjoy a variety of music and podcasts brought to you by Jay Fun Media. I was the sole developer on this one. The UI design was inspired by CliffCentral. It features refreshing audio experiences from Kenyan content creators.",
                                              projectTitle:
                                                  "Jay Fun Media|Jay FM",
                                              tech1: "Flutter|Dart",
                                              tech2: "Get It   Flutter Redux",
                                              tech3: "RxDart",
                                            ),
                                            FeatureProject(
                                              imagePath:
                                                  "images/work/hooli_tours_splash.png",
                                              playStorUrl:
                                                  "https://play.google.com/store/apps/details?id=com.hoolitours",
                                              projectDesc:
                                                  "Hooli Tours is a tours company that enables users to quickly buy tickets for tours in Kenya.",
                                              projectTitle:
                                                  "Hooli Tours|Hooli Tours App",
                                              tech1: "Flutter|Dart",
                                              tech2: "Get It  Flutter Bloc",
                                              tech3: "Firebase Firestore/Auth",
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: 6.0,
                                      ),

                                      SizedBox(
                                        height: size.height * 0.10,
                                      ),
                                      //Where I've Worked
                                      _wrapScrollTag(index: 2, child: Work()),

                                      //Get In Touch
                                      _wrapScrollTag(
                                        index: 3,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: size.height * 0.68,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              // color: Colors.orange,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                    height: 16.0,
                                                  ),
                                                  Wrap(
                                                    children: [
                                                      Text(
                                                        "Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.4),
                                                          letterSpacing: 0.75,
                                                          fontSize: 17.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 32.0,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      method.launchEmail();
                                                    },
                                                    hoverColor:
                                                        Color(0xff64FFDA)
                                                            .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(0.85),
                                                      height:
                                                          size.height * 0.09,
                                                      width: size.width * 0.10,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xff64FFDA),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 8.0,
                                                        ),
                                                        child: Text(
                                                          "Say Hello",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff64FFDA),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //Footer
                                            Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  6,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              //color: Colors.white,
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: "Designed by "),
                                                    TextSpan(
                                                      text: "Tushar Nikam",
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              method.launchURL(
                                                                  "https://champ96k.github.io/#/");
                                                            },
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            " modified for self by Philip Kalela 💙 Flutter")
                                                  ],
                                                  style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.4),
                                                    letterSpacing: 1.75,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.07,
                        height: MediaQuery.of(context).size.height - 82,
                        //color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotatedBox(
                              quarterTurns: 45,
                              child: Text(
                                "philipkalela@gmail.com",
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.6),
                                  letterSpacing: 3.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                height: 100,
                                width: 2,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
