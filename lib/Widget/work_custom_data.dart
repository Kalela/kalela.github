import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:potrtfolio/Model/Method.dart';

class WorkCustomData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String duration;
  final List<String> urls;
  final Method method;

  const WorkCustomData(
      {Key key,
      @required this.title,
      @required this.subTitle,
      @required this.duration,
      @required this.urls,
      this.method})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.cover,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              subTitle,
              style: TextStyle(
                fontSize: 13.0,
                color: Color(0xffCCD6F6).withOpacity(0.5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          duration,
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xffCCD6F6).withOpacity(0.5),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        for (var url in urls) ...[
          FittedBox(
            fit: BoxFit.cover,
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: url,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    color: Color(0xffCCD6F6).withOpacity(0.5),
                    fontWeight: FontWeight.w700,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      method.launchURL(url);
                    },
                ),
              ),
            ),
          )
        ],
      ],
    );
  }
}
