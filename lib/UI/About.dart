import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/Widget/CustomText.dart';

class About extends StatelessWidget {
  final Method method = Method();

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.briefcase,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //About me
          Container(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
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

                //About me desc
                Wrap(
                  children: [
                    CustomText(
                      text:
                          "Hello! I'm Philip, a Software Engineer based in Nairobi, KE.\n\nI enjoy creating optimal business solutions through software. My goal is to provide value to my clients by providing expertise in perfomant, robust, maintainable and above all highly valuable products.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                    CustomText(
                      text:
                          "I am currenly studying to receive Google certification as an Android native developer. I am also working with freelance clients while seeking permanent employment that I would enjoy.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                    CustomText(
                      text:
                          "Here are the technologies I've been working with recently:\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                  ],
                ),

                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Dart"),
                            technology(context, "Flutter"),
                            technology(context, "Android Native"),
                            technology(context, "Kotlin"),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Java"),
                            technology(context, "Spring Boot"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Profile Image
          Expanded(
            child: Container(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.12,
                    left: size.width * 0.120,
                    child: Card(
                      color: Color(0xff61F9D5),
                      child: Container(
                        margin: EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        color: Color(0xff0A192F),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      method.launchURL(
                          "https://www.linkedin.com/in/philip-kalela-18b7b414b/");
                    },
                    child: CustomImageAnimation(
                      image: "images/download.png",
                      highlightColor: Color(0xff61F9D5).withOpacity(0.5),
                      heightRatio: 2,
                      widthRatio: 5,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  CustomImageAnimation(
      {Key key,
      @required this.image,
      @required this.highlightColor,
      @required this.heightRatio,
      @required this.widthRatio})
      : super(key: key);

  final String image;
  final Color highlightColor;
  final int heightRatio;
  final int widthRatio;

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = Colors.transparent;
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = widget.highlightColor.withOpacity(0.5);
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Stack(
        children: [
          Container(
            height: size.height / widget.heightRatio,
            width: size.width / widget.widthRatio,
            color: Colors.black54,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(widget.image),
            ),
          ),
          Container(
            height: size.height / widget.heightRatio,
            width: size.width / widget.widthRatio,
            color: customImageColor,
          ),
        ],
      ),
    );
  }
}
