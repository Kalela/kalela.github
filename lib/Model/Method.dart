import 'package:url_launcher/url_launcher.dart';

class Link {
  launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchCaller() async {
    const url = "tel:+254717174985";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchEmail() async {
    if (await canLaunchUrl(Uri.parse("mailto:philipkalela@gmail.com"))) {
      await launchUrl(Uri.parse("mailto:philipkalela@gmail.com"));
    } else {
      throw 'Could not launch';
    }
  }
}
