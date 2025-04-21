import 'package:url_launcher/url_launcher.dart';

class UrlLaunchController {
  static Future<void> launchWeb(
    String url, {
    String? headerKey,
    String? headerValue,
  }) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
      webViewConfiguration: WebViewConfiguration(
        headers:
            headerKey != null && headerValue != null
                ? <String, String>{headerKey: headerValue}
                : const {},
      ),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  static Future<void> sendSms(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'sms', path: phoneNumber);
    await launchUrl(launchUri);
  }

  static Future<void> sendMail(String emailAddress) async {
    final Uri launchUri = Uri(scheme: 'mailto', path: emailAddress);
    await launchUrl(launchUri);
  }
}
