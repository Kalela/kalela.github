import 'package:url_launcher/url_launcher.dart';

class Link {
  launchURL(String url) async {
    if (await canLaunchUrl(Uri.dataFromString(url))) {
      await launchUrl(Uri.dataFromString(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchCaller() async {
    const url = "tel:+254717174985";
    if (await canLaunchUrl(Uri.dataFromString(url))) {
      await launchUrl(Uri.dataFromString(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchEmail() async {
    if (await canLaunchUrl(Uri.dataFromString("mailto:philipkalela@gmail.com"))) {
      await launchUrl(Uri.dataFromString("mailto:philipkalela@gmail.com"));
    } else {
      throw 'Could not launch';
    }
  }
}
