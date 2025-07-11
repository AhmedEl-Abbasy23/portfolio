import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';


class MainServices {

  static bool isTablet(BuildContext context) {
    var shortestSide = MediaQuery.sizeOf(context).shortestSide;
    return shortestSide > 600;
  }
  static Future<void> viaUrl({required String url}) async {
    // If the URL doesn't already have "https://", add it
    if (!url.startsWith("https://") && !url.startsWith("http://")) {
      url = "https://$url";
    }

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future viaEmail({required String email}) async {
    if (await canLaunchUrl(Uri.parse(Constants.emailUrl(email)))) {
      await launchUrl(Uri.parse(Constants.emailUrl(email)));
    }
  }

  static Future viaCall({required String phoneNumber}) async {
    final Uri launchUri = Uri(scheme: Constants.telScheme, path: phoneNumber);
    await launchUrl(launchUri);
  }

  static Future viaWhatsapp({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    // android
    if (await canLaunchUrl(Uri.parse(Platform.isAndroid
        ? Constants.whatsappUrlAndroid(phoneNumber)
        : Constants.whatsappUrlIos(phoneNumber)))) {
      await launchUrl(Uri.parse(Platform.isAndroid
          ? Constants.whatsappUrlAndroid(phoneNumber)
          : Constants.whatsappUrlIos(phoneNumber)));
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'تطبيق واتساب غير مثبت علي هاتفك!',
            ),
          ),
        );
      }
    }
  }

}
