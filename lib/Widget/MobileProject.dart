import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/Widget/CustomText.dart';

class MobileProject extends StatelessWidget {
  final String image;
  final String projectDescription;
  final String githubUrl;
  final String playStorUrl;
  final Method method = Method();

  MobileProject(
      {@required this.image,
      @required this.projectDescription,
      @required this.githubUrl,
      @required this.playStorUrl});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        method.launchURL(playStorUrl);
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.36,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(image),
          ),
        ),

        // Short Desc
        Container(
          alignment: Alignment.center,
          // height: size.height * 0.65,
          width: size.width * 0.45,
          color: Color(0xff172A45),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  child: CustomText(
                    text: projectDescription,
                    textsize: 16.0,
                    color: Colors.white.withOpacity(0.4),
                    letterSpacing: 0.75,
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            githubUrl != null
                ? IconButton(
                    icon: FaIcon(FontAwesomeIcons.github),
                    color: Colors.white.withOpacity(0.3),
                    onPressed: () {
                      method.launchURL(githubUrl);
                    },
                  )
                : SizedBox.shrink(),
            SizedBox(
              width: 30,
            ),
            playStorUrl != null
                ? IconButton(
                    icon: FaIcon(FontAwesomeIcons.googlePlay),
                    color: Colors.white.withOpacity(0.3),
                    onPressed: () {
                      method.launchURL(playStorUrl);
                    },
                  )
                : SizedBox.shrink(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
    );
  }
}
