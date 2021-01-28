import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> callTo(String phone) async {
    if (await canLaunch('tel:$phone')) {
      await launch('tel:$phone');
    } else {
      throw 'Could not launch $phone';
    }
  }

  static Future<void> emailTo(String email) async {
    if (await canLaunch('mailto:$email')) {
      await launch('mailto:$email');
    } else {
      throw 'Could not launch $email';
    }
  }

  static Future<void> openMap(
      String address, String number, String city, String state) async {
    if (await canLaunch('geo:0,0?q=$address,$number,$city,$state')) {
      await launch('geo:0,0?q=$address,$number,$city,$state');
    } else {
      throw 'Could not launch $address';
    }
  }
}
