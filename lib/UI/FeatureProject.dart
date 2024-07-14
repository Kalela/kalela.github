import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Model/Method.dart';
import 'package:portfolio/Widget/CustomText.dart';

import 'About.dart';

class FeatureProject extends StatelessWidget {
  final String? imagePath;
  final String projectTitle;
  final String projectDesc;
  final String? tech1;
  final String? tech2;
  final String? tech3;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? webUrl;

  final Link link = Link();

  FeatureProject({
    this.imagePath,
    required this.projectDesc,
    required this.projectTitle,
    this.tech1,
    this.tech2,
    this.tech3,
    this.githubUrl,
    this.playStoreUrl,
    this.webUrl,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.tealAccent,
      child: Column(
        children: [
          Container(
            height: size.height - 300,
            width: size.width - 84,
            child: Stack(
              children: [
                //Image
                Positioned(
                  top: size.height * 0.02,
                  left: 20.0,
                  child: Container(
                    height: size.height * 0.60,
                    width: size.width * 0.5,
                    //color: Colors.redAccent,
                    child: InkWell(
                      onTap: () {
                        if (playStoreUrl != null) {
                          link.launchURL(playStoreUrl!);
                        }
                        if (webUrl != null) {
                          link.launchURL(webUrl!);
                        }
                      },
                      child: imagePath != null
                          ? CustomImageAnimation(
                              image: imagePath!,
                              highlightColor: Colors.grey.withOpacity(0.5),
                              heightRatio: 1,
                              widthRatio: 1,
                            )
                          : null,
                    ),
                  ),
                ),

                // Short Desc
                Positioned(
                  top: size.height / 6,
                  right: 10.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.25,
                    width: size.width * 0.35,
                    color: Color(0xff172A45),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomText(
                            text: projectDesc,
                            textsize: 16.0,
                            color: Colors.white.withOpacity(0.4),
                            letterSpacing: 0.75,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Project Tiitle
                Positioned(
                  top: 16.0,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.10,
                    width: size.width * 0.25,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        CustomText(
                          text: projectTitle,
                          textsize: 27,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),

                // Project Resources
                Positioned(
                  bottom: 30,
                  right: 10,
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.25,
                    // color: Colors.indigo,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        CustomText(
                          text: tech1 ?? "",
                          textsize: 14,
                          color: Colors.grey,
                          letterSpacing: 1.75,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        CustomText(
                          text: tech2 ?? "",
                          textsize: 14,
                          color: Colors.grey,
                          letterSpacing: 1.75,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        CustomText(
                          text: tech3 ?? "",
                          textsize: 14,
                          color: Colors.grey,
                          letterSpacing: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),

                // Gitub Link
                Positioned(
                  top: size.height * 0.42,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        githubUrl != null
                            ? IconButton(
                                icon: FaIcon(FontAwesomeIcons.github),
                                color: Colors.white.withOpacity(0.3),
                                onPressed: () {
                                  link.launchURL(githubUrl!);
                                },
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          width: 30,
                        ),
                        playStoreUrl != null
                            ? IconButton(
                                icon: FaIcon(FontAwesomeIcons.googlePlay),
                                color: Colors.white.withOpacity(0.3),
                                onPressed: () {
                                  link.launchURL(playStoreUrl!);
                                },
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          width: 10,
                        ),
                        webUrl != null
                            ? IconButton(
                                icon: FaIcon(FontAwesomeIcons.globe),
                                color: Colors.white.withOpacity(0.3),
                                onPressed: () {
                                  link.launchURL(webUrl!);
                                },
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
