import 'package:instantplus/resources/shared_pref.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesResources {
  static Future<void> removeToken() async {
    await SharedPrefUtils.clear();
  }

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static num? getRawValue(String value) {
    final cleaned = value.replaceAll(RegExp(r'[^0-9.]'), '');
    return num.tryParse(cleaned);
  }
}
